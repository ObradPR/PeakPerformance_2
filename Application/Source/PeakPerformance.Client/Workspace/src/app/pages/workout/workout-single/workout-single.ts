import { Component, OnInit, Signal } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IWorkoutDto } from '../../../_generated/interfaces';
import { ModalService } from '../../../services/modal.service';
import { WorkoutService } from '../../../services/workout.service';
import { WorkoutTemplate } from "../workout-template/workout-template";

enum eOtherWorkoutDirection {
  Previous = 1,
  Next = 2,
}
@Component({
  selector: 'app-workout-single',
  imports: [WorkoutTemplate],
  templateUrl: './workout-single.html',
  styleUrl: './workout-single.css'
})
export class WorkoutSingle implements OnInit {
  workout: Signal<IWorkoutDto | null>;

  constructor(
    private route: ActivatedRoute,
    private router: Router,

    public modalService: ModalService,
    private workoutService: WorkoutService
  ) {
    this.workout = this.workoutService.workoutSignal;
  }

  ngOnInit(): void {
    const resolvedWorkout = this.route.snapshot.data['workout']?.data;

    if (resolvedWorkout) {
      this.workoutService.setInitialWorkout(resolvedWorkout);
    }
  }

  onGetWorkout(direction: eOtherWorkoutDirection) {
    const workoutId = (direction === eOtherWorkoutDirection.Previous
      ? this.workout()?.previousWorkoutId
      : this.workout()?.nextWorkoutId)
      ?? 0;

    this.router.navigateByUrl('/', { skipLocationChange: true })
      .then(() => this.router.navigateByUrl(`/workouts/${Number(workoutId)}`));
  }
}
