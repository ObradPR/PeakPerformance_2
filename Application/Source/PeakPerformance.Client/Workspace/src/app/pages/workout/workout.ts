import { Component, OnInit } from '@angular/core';
import { Paginator, PaginatorState } from 'primeng/paginator';
import { IPagingResult, ISortingOptions, IWorkoutDto, IWorkoutSearchOptions } from '../../_generated/interfaces';
import { WorkoutController } from '../../_generated/services';
import { LoaderService } from '../../services/loader.service';
import { ModalService } from '../../services/modal.service';
import { WorkoutTemplate } from "./workout-template/workout-template";
import { WorkoutsCalendar } from "./workouts-calendar/workouts-calendar";
import { ActivatedRoute } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-workout',
  imports: [Paginator, WorkoutTemplate, WorkoutsCalendar],
  templateUrl: './workout.html',
  styleUrl: './workout.css'
})
export class Workout implements OnInit {
  workouts?: IPagingResult<IWorkoutDto>;

  first = 0;
  rows = 5;

  userId: number = 0;
  isCurrentUser: boolean = false;

  constructor(
    private route: ActivatedRoute,

    public modalService: ModalService,
    private loaderService: LoaderService,
    private authService: AuthService,

    private workoutController: WorkoutController
  ) {
    this.userId = parseInt(this.route.snapshot.paramMap.get('userId') ?? '0') ?? 0;
    console.log(this.userId, this.authService.currentUserSource());
    if (this.userId !== this.authService.currentUserSource()?.id) {
      this.isCurrentUser = false;
    }
    else {
      this.isCurrentUser = true;
    }

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
    if (!this.userId) return; // TODO show toaster error

    this.loaderService.showPageLoader();

    const options = {
      userId: this.userId,
      take: take,
      skip: skip,
      sortingOptions: [
        { field: 'LogDate', dir: 'desc' },
        { field: 'Id', dir: 'desc' }
      ] as ISortingOptions[]
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
