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

    constructor(private storageService: StorageService) {
        this.setExercisesForComparison();
    }

    private selectedExerciseForComparison = signal<{ id: string, name: string }[]>([]); // api exerciseId
    readonly selectedExerciseForComparisonSignal = this.selectedExerciseForComparison.asReadonly();

    addExerciseForComparison(apiExerciseId: string, name: string) {
        if (this.selectedExerciseForComparison().find(_ => _.id === apiExerciseId)) {
            return;
        }

        this.selectedExerciseForComparison.update(_ => [..._, { id: apiExerciseId, name: name }]);
        this.storageService.set('exercises_comparison', JSON.stringify(this.selectedExerciseForComparison()));
    }
    removeExerciseForComparison(apiExerciseId: string) {
        this.selectedExerciseForComparison.update(_ => _.filter(_ => _.id !== apiExerciseId));
        this.storageService.set('exercises_comparison', JSON.stringify(this.selectedExerciseForComparison()));
    }
    private setExercisesForComparison() {
        const item = this.storageService.get('exercises_comparison');
        if (item === null)
            this.storageService.set('exercises_comparison', JSON.stringify(this.selectedExerciseForComparison()));

        const data = JSON.parse(this.storageService.get('exercises_comparison')!);
        this.selectedExerciseForComparison.set(data);
    }
}
