import { Component, OnInit } from '@angular/core';
import { ModalService } from '../../services/modal.service';
import { WorkoutController } from '../../_generated/services';
import { IPagingResult, ISortingOptions, IWorkoutDto, IWorkoutSearchOptions } from '../../_generated/interfaces';
import { LoaderService } from '../../services/loader.service';
import { Paginator, PaginatorState } from 'primeng/paginator';
import { WorkoutSingle } from "./workout-single/workout-single";
import { WorkoutTemplate } from "./workout-template/workout-template";

@Component({
  selector: 'app-workout',
  imports: [Paginator, WorkoutTemplate],
  templateUrl: './workout.html',
  styleUrl: './workout.css'
})
export class Workout implements OnInit {
  workouts?: IPagingResult<IWorkoutDto>;

  first = 0;
  rows = 5;

  constructor(
    public modalService: ModalService,
    private loaderService: LoaderService,

    private workoutController: WorkoutController
  ) {
    this.getPaginatedWorkouts(this.first, this.rows);
  }

  ngOnInit(): void {
  }

  // events

  onPageChange(event: PaginatorState) {
    this.first = event.first ?? this.first;
    this.rows = event.rows ?? this.rows;
    this.getPaginatedWorkouts(this.first, this.rows);
  }

  // private

  private getPaginatedWorkouts(skip: number, take: number) {
    this.loaderService.showPageLoader();

    const options = {
      take: take,
      skip: skip,
      sortingOptions: [{ field: 'LogDate', dir: 'desc' }] as ISortingOptions[]
    } as IWorkoutSearchOptions;

    this.workoutController.Search(options).toPromise()
      .then(_ => {
        if (_?.data !== null) {
          this.workouts = _?.data;
        }
      })
      .catch(ex => { throw ex; })
      .finally(() => this.loaderService.hidePageLoader());
  }
}
