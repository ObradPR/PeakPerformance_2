import { Injectable, signal } from "@angular/core";
import { StorageService } from "./storage.service";

@Injectable({
    providedIn: 'root'
})
export class ExerciseService {

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
