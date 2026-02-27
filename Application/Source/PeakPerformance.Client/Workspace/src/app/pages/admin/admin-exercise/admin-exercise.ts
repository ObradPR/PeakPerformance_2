import { CommonModule } from '@angular/common';
import { Component, effect, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Paginator, PaginatorState } from 'primeng/paginator';
import { IExerciseDto, IExerciseSearchOptions, IPagingResult } from '../../../_generated/interfaces';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';
import { ExerciseController } from '../../../_generated/services';
import { debounceTime, distinctUntilChanged } from 'rxjs';

@Component({
  selector: 'app-admin-exercise',
  imports: [FormsModule, ReactiveFormsModule, Paginator, CommonModule],
  templateUrl: './admin-exercise.html',
  styleUrl: './admin-exercise.css'
})
export class AdminExercise implements OnInit {
  form: FormGroup<any>;
  exercises: IPagingResult<IExerciseDto> = {
    data: [],
    total: 0,
  };

  first = 0;
  rows = 13;

  constructor(
    private fb: FormBuilder,

    private loaderService: LoaderService,
    public modalService: ModalService,
    
    private exerciseController: ExerciseController,
  ) {
    effect(() => {
      this.modalService.reloadSignal();
      this.getExercises(this.first, this.rows);
    }, { allowSignalWrites: true })
  }

  ngOnInit(): void {
    this.formInit();
    this.setupFilterListener();
  }

  private formInit() {
    this.form = this.fb.group({
      id: [],
      search: [],
    })
  }

  // events

  onPageChange(event: PaginatorState) {
    this.first = event.first ?? this.first;
    this.rows = event.rows ?? this.rows;
    this.getExercises(this.first, this.rows);
  }

  // methods

  private getExercises(skip: number, take: number) {
    this.loaderService.showPageLoader();

    const options = {
      ...this.form.value,
      filter: this.form.value.search,
      take,
      skip,
      sortingOptions: [{ field: 'Name', dir: 'asc' }]
    } as IExerciseSearchOptions;

    this.exerciseController.AdminSearch(options).toPromise()
      .then(_ => {
        if(_?.isSuccess) {
          this.exercises = _.data;
        }
      })
      .catch(ex => {throw ex;})
      .finally(() => this.loaderService.hidePageLoader());
  }

  setupFilterListener() {
    this.form.valueChanges
      .pipe(
        debounceTime(300),
        distinctUntilChanged()
      )
      .subscribe(value => {
        this.first = 0;
        this.getExercises(this.first, this.rows);
      });
  }

  onEditExercise(exercise: IExerciseDto) {
    const ok = window.confirm(`Are you sure you want to edit existing exercise?`);

    if (!ok) return;

    this.modalService.showAdminExerciseEditModal(exercise);
  }
}
