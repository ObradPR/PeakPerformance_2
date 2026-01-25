import { TitleCasePipe } from '@angular/common';
import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { Paginator, PaginatorState } from 'primeng/paginator';
import { debounceTime, distinctUntilChanged } from 'rxjs';
import { IExerciseDbApiDataDto, IExerciseDbApiDto, IExerciseDto, IExerciseSearchOptions } from '../../../_generated/interfaces';
import { ExerciseController } from '../../../_generated/services';
import { ExerciseService } from '../../../services/exercise.service';
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

  search = '';
  offset = 0;
  limit = 10;
  exercises: {
    data: IExerciseDto[],
    total: number
  } = { data: [], total: 0 };

  constructor(
    private fb: FormBuilder,
    // private http: HttpClient,
    private router: Router,

    private exerciseController: ExerciseController,

    private modalService: ModalService,
    private loaderService: LoaderService,
    private workoutService: WorkoutService,
    private exerciseService: ExerciseService,
  ) { }

  // events

  onPageChange(event: PaginatorState) {
    const offset = event.first ?? this.offset;
    const limit = event.rows ?? this.limit;

    this.getExercises(this.search, offset, limit);
  }

  // methods

  ngOnInit(): void {
    this.formInit();
    this.setupSearchListener();

    // Load default 10 exercises on open
    this.loaderService.showPageLoader();
    this.getExercises();
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    this.form = this.fb.group({
      search: [''],
      id: [this.modalService.exerciseIdSignal()],
      exerciseId: [],
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
        this.search = value;
        this.offset = 0;
        this.getExercises(value, this.offset);
      })
  }

  getExercises(search = this.search, offset = this.offset, limit = this.limit) {
    this.offset = offset;

    const options = {
      skip: offset,
      take: limit,
    } as IExerciseSearchOptions;

    if (search) {
      options.filter = search;
    }

    this.exerciseController.GetList(options).toPromise()
      .then((_) => {
        if(_?.isSuccess)
          this.exercises = _.data;
      })
      .catch(ex => {
        this.modalService.hideExerciseModal();
      })
      .finally(() => this.loaderService.hidePageLoader());
  }

  selectExercise(exercise: IExerciseDto) {
    if (this.modalService.isFromExercisesScreenSignal()) {
      this.router.navigateByUrl(`/exercises/${exercise.id}`);
      this.modalService.hideExerciseModal();
      return;
    }
    else if (this.modalService.isAddingExerciseForComparisonSignal()) {
      this.exerciseService.addExerciseForComparison(exercise.id, exercise.name);
      this.modalService.hideExerciseModal();
      return;
    }
    else {
      this.loaderService.showPageLoader();

      this.form.patchValue({
        exerciseId: exercise.id
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
}
