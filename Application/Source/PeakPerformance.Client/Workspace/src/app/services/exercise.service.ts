import { Injectable, signal } from "@angular/core";
import { StorageService } from "./storage.service";
import { IEnumProvider } from "../_generated/interfaces";

export enum eExerciseChartData {
    OneRepMax = 1,
    MaxWeight = 2,
    TotalReps = 3,
    MaxReps = 4,
    Volume = 5,
    TotalCardioTime = 6
}

@Injectable({
    providedIn: 'root'
})
export class ExerciseService {
    exerciseChartData: { id: eExerciseChartData, name: string }[] = [
        { id: eExerciseChartData.OneRepMax, name: 'Estimated 1-Rep Max' },
        { id: eExerciseChartData.MaxWeight, name: 'Max Weight' },
        { id: eExerciseChartData.TotalReps, name: 'Total Reps' },
        { id: eExerciseChartData.MaxReps, name: 'Max Reps' },
        { id: eExerciseChartData.Volume, name: 'Volume' },
        { id: eExerciseChartData.TotalCardioTime, name: 'Total Cardio Time' },
    ];
    allowedForStrength = [
        eExerciseChartData.OneRepMax,
        eExerciseChartData.MaxWeight,
        eExerciseChartData.TotalReps,
        eExerciseChartData.MaxReps,
        eExerciseChartData.Volume,
    ];
    allowedForBodyweight = [
        eExerciseChartData.TotalReps,
        eExerciseChartData.MaxReps,
        eExerciseChartData.Volume,
    ];
    allowedForCardio = [
        eExerciseChartData.TotalCardioTime,
    ];

    // Chart - Exercise
    private exerciseChart = signal<boolean>(false);
    readonly exerciseChartSignal = this.exerciseChart.asReadonly();

    triggerExerciseChart() {
        this.exerciseChart.set(!this.exerciseChart());
    }
}
