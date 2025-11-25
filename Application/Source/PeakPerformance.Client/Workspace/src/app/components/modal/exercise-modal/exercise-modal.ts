import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { IModalMethods } from '../interfaces/modal-methods.interface';
import { WorkoutController } from '../../../_generated/services';
import { Router } from '@angular/router';
import { ModalService } from '../../../services/modal.service';
import { LoaderService } from '../../../services/loader.service';
import { SharedService } from '../../../services/shared.service';
import { debounceTime, distinctUntilChanged } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { TitleCasePipe } from '@angular/common';

@Component({
  selector: 'app-exercise-modal',
  imports: [FormsModule, ReactiveFormsModule, TitleCasePipe],
  templateUrl: './exercise-modal.html',
  styleUrl: './exercise-modal.css'
})
export class ExerciseModal implements IModalMethods, OnInit {
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;

  apiMetadata: {
    totalPages: number,
    totalExercises: number,
    currentPage: number,
    previousPage: number | null,
    nextPage: string | null
  };
  apiExercises: {
    exerciseId: string,
    name: string,
    gifUrl: string | null,
    targetMuscles: string[],
    bodyParts: string[],
    equipments: string[],
    secondaryMuscles: string[],
    instructions: string[]
  }[] = [];

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private http: HttpClient,

    private workoutController: WorkoutController,

    private modalService: ModalService,
    private loaderService: LoaderService,
    private sharedService: SharedService,
  ) { }

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
      apiExerciseId: [],
      name: [],
      workoutId: [this.modalService.workoutIdSignal()]
    });
  }

  setupSearchListener() {
    this.form.get('search')!.valueChanges
      .pipe(
        debounceTime(500),
        distinctUntilChanged()
      )
      .subscribe(value => {
        this.getExercises(value);
      })
  }

  getExercises(search: string = '') {
    const params: any = {
      offset: 0,
      limit: 10,
    };

    if (search) {
      params.search = search;
    }

    this.http.get<any[]>('https://www.exercisedb.dev/api/v1/exercises', { params }).toPromise()
      .then((_: any) => {
        if (_.success) {
          this.apiMetadata = _.metadata;
          this.apiExercises = _.data ?? [];
        }
      })
      .catch(ex => this.apiExercises = []);
  }

  selectExercise(exercise: any) {
    console.log(exercise);
    this.form.patchValue({
      apiExerciseId: exercise.exerciseId,
      name: exercise.name
    })
  }
}
