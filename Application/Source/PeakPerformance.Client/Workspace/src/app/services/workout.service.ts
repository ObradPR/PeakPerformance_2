import { Injectable, signal } from '@angular/core';
import { IWorkoutDto, IWorkoutLogDto } from '../_generated/interfaces';
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

    private workoutLogs = signal<IWorkoutLogDto[] | null>(null);
    readonly workoutLogsSignal = this.workoutLogs.asReadonly();

    async getWorkoutLogs() {
        if (this.workoutLogsSignal() !== null)
            return;

        const res = await this.workoutController.GetAllWorkoutLogs().toPromise();
        if (res?.isSuccess) this.workoutLogs.set(res.data);
    }

    resetWorkoutLogs() {
        this.workoutLogs.set(null);
    }
}
