import { TitleCasePipe } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Paginator, PaginatorState } from 'primeng/paginator';
import { debounceTime, distinctUntilChanged } from 'rxjs';
import { IExerciseDbApiDataDto, IExerciseDbApiDto } from '../../../_generated/interfaces';
import { ExerciseController } from '../../../_generated/services';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';
import { WorkoutService } from '../../../services/workout.service';
import { IModalMethods } from '../interfaces/modal-methods.interface';

@Component({
  selector: 'app-exercise-modal',
  imports: [FormsModule, ReactiveFormsModule, TitleCasePipe, Paginator],
  templateUrl: './exercise-modal.html',
  styleUrl: './exercise-modal.css'
})
export class ExerciseModal implements IModalMethods, OnInit {
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;

  apiSearch = '';
  apiOffset = 0;
  apiLimit = 10;
  apiData: IExerciseDbApiDto = {
    success: false,
    metadata: {} as any,
    data: [],
  };

  constructor(
    private fb: FormBuilder,
    private http: HttpClient,

    private exerciseController: ExerciseController,

    private modalService: ModalService,
    private loaderService: LoaderService,
    private workoutService: WorkoutService,
  ) { }

  // events

  onPageChange(event: PaginatorState) {
    const offset = event.first ?? this.apiOffset;
    const limit = event.rows ?? this.apiLimit;

    this.getExercises(this.apiSearch, offset, limit);
  }

  // methods

  ngOnInit(): void {
    this.formInit();
    this.setupSearchListener();

    // Load default 10 exercises on open
    this.getExercises();
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    this.form = this.fb.group({
      search: [''],
      id: [this.modalService.exerciseIdSignal()],
      apiExerciseId: [],
      name: [],
      equipmentName: [],
      bodyParts: [],
      workoutId: [this.modalService.workoutIdSignal()],
      order: [this.modalService.orderSignal()]
    });
  }

  setupSearchListener() {
    this.form.get('search')!.valueChanges
      .pipe(
        debounceTime(500),
        distinctUntilChanged()
      )
      .subscribe(value => {
        this.apiSearch = value;
        this.getExercises(value);
      })
  }

  getExercises(search = this.apiSearch, offset = this.apiOffset, limit = this.apiLimit) {
    this.loaderService.showPageLoader();

    const params: any = {
      offset: offset,
      limit: limit,
    };

    if (search) {
      params.search = search;
    }

    this.http.get<any[]>('https://www.exercisedb.dev/api/v1/exercises', { params }).toPromise()
      .then((res: any) => {
        if (res.success) {
          this.apiData = res;
        }
      })
      .catch(ex => {
        // #TODO: Toaster validation
        this.modalService.hideExerciseModal();
      })
      .finally(() => this.loaderService.hidePageLoader());
  }

  selectExercise(exercise: IExerciseDbApiDataDto) {
    this.loaderService.showPageLoader();

    this.form.patchValue({
      apiExerciseId: exercise.exerciseId,
      name: exercise.name,
      equipmentName: exercise.equipments[0],
      bodyParts: exercise.bodyParts
    });

    this.exerciseController.Save(this.form.value).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.workoutService.refreshWorkout(this.modalService.workoutIdSignal())
            .then(_ => {
              this.modalService.hideExerciseModal();
            })
        }
      })
      .catch(ex => console.log(ex))
      .finally(() => {
        this.loaderService.hidePageLoader()
      });
  }
}
