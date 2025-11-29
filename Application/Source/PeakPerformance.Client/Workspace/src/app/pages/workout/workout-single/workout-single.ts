import { Component, OnInit, Signal } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { IWorkoutDto } from '../../../_generated/interfaces';
import { ModalService } from '../../../services/modal.service';
import { WorkoutService } from '../../../services/workout.service';
import { WorkoutTemplate } from "../workout-template/workout-template";

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
}
