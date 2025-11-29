import { Injectable, signal } from '@angular/core';
import { IWorkoutDto } from '../_generated/interfaces';
import { WorkoutController } from '../_generated/services';

@Injectable({
    providedIn: 'root'
})
export class WorkoutService {
    private workout = signal<IWorkoutDto | null>(null);
    readonly workoutSignal = this.workout.asReadonly();

    constructor(private workoutController: WorkoutController) { }

    setInitialWorkout(workout: IWorkoutDto) {
        this.workout.set(workout);
    }

    async refreshWorkout(id: number) {
        const res = await this.workoutController.GetSingle(id).toPromise();
        if (res?.isSuccess) this.workout.set(res.data);
    }
}
