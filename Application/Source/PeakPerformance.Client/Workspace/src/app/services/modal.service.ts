import { Injectable, signal } from '@angular/core';
import { IBodyweightDto, IBodyweightGoalDto, IMeasurementDto, IMeasurementGoalDto, IWorkoutDto, IWorkoutExerciseDto, IWorkoutExerciseSetDto } from '../_generated/interfaces';

export type TModal = 'add' | 'edit';

@Injectable({
  providedIn: 'root'
})
export class ModalService {
  // Bodyweight
  private bodyweightModal = signal<boolean>(false);
  private bodyweightModalType = signal<TModal | null>(null);
  private selectedBodyweight = signal<IBodyweightDto | null>(null);

  readonly bodyweightModalSignal = this.bodyweightModal.asReadonly();
  readonly bodyweightModalTypeSignal = this.bodyweightModalType.asReadonly();
  readonly selectedBodyweightSignal = this.selectedBodyweight.asReadonly();

  showAddBodyweightModal() {
    this.bodyweightModalType.set('add');
    this.bodyweightModal.set(true);
  }
  showEditBodyweightModal(data: IBodyweightDto) {
    this.bodyweightModalType.set('edit');
    this.selectedBodyweight.set(data);
    this.bodyweightModal.set(true);
  }
  hideBodyweightModal() {
    this.bodyweightModal.set(false);
    this.bodyweightModalType.set(null);
    this.selectedBodyweight.set(null);
  }

  // Bodyweight Goal

  private bodyweightGoalModal = signal<boolean>(false);
  private bodyweightGoalModalType = signal<TModal | null>(null);
  private selectedBodyweightGoal = signal<IBodyweightGoalDto | null>(null);

  readonly bodyweightGoalModalSignal = this.bodyweightGoalModal.asReadonly();
  readonly bodyweightGoalModalTypeSignal = this.bodyweightGoalModalType.asReadonly();
  readonly selectedBodyweightGoalSignal = this.selectedBodyweightGoal.asReadonly();

  showAddBodyweightGoalModal() {
    this.bodyweightGoalModalType.set('add');
    this.bodyweightGoalModal.set(true);
  }
  showEditBodyweightGoalModal(data: IBodyweightGoalDto) {
    this.bodyweightGoalModalType.set('edit');
    this.selectedBodyweightGoal.set(data);
    this.bodyweightGoalModal.set(true);
  }
  hideBodyweightGoalModal() {
    this.bodyweightGoalModal.set(false);
    this.bodyweightGoalModalType.set(null);
    this.selectedBodyweightGoal.set(null);
  }

  // Measurement
  private measurementModal = signal<boolean>(false);
  private measurementModalType = signal<TModal | null>(null);
  private selectedMeasurement = signal<IMeasurementDto | null>(null);

  readonly measurementModalSignal = this.measurementModal.asReadonly();
  readonly measurementModalTypeSignal = this.measurementModalType.asReadonly();
  readonly selectedMeasurementSignal = this.selectedMeasurement.asReadonly();

  showAddMeasurementModal() {
    this.measurementModalType.set('add');
    this.measurementModal.set(true);
  }
  showEditMeasurementModal(data: IMeasurementDto) {
    this.measurementModalType.set('edit');
    this.selectedMeasurement.set(data);
    this.measurementModal.set(true);
  }
  hideMeasurementModal() {
    this.measurementModal.set(false);
    this.measurementModalType.set(null);
    this.selectedMeasurement.set(null);
  }

  // Measurement Goal

  private measurementGoalModal = signal<boolean>(false);
  private measurementGoalModalType = signal<TModal | null>(null);
  private selectedMeasurementGoal = signal<IMeasurementGoalDto | null>(null);

  readonly measurementGoalModalSignal = this.measurementGoalModal.asReadonly();
  readonly measurementGoalModalTypeSignal = this.measurementGoalModalType.asReadonly();
  readonly selectedMeasurementGoalSignal = this.selectedMeasurementGoal.asReadonly();

  showAddMeasurementGoalModal() {
    this.measurementGoalModalType.set('add');
    this.measurementGoalModal.set(true);
  }
  showEditMeasurementGoalModal(data: IMeasurementGoalDto) {
    this.measurementGoalModalType.set('edit');
    this.selectedMeasurementGoal.set(data);
    this.measurementGoalModal.set(true);
  }
  hideMeasurementGoalModal() {
    this.measurementGoalModal.set(false);
    this.measurementGoalModalType.set(null);
    this.selectedMeasurementGoal.set(null);
  }

  // Workout

  private workoutModal = signal<boolean>(false);
  private workoutModalType = signal<TModal | null>(null);
  private selectedWorkout = signal<IWorkoutDto | null>(null);

  readonly workoutModalSignal = this.workoutModal.asReadonly();
  readonly workoutModalTypeSignal = this.workoutModalType.asReadonly();
  readonly selectedWorkoutSignal = this.selectedWorkout.asReadonly();

  showAddWorkoutModal() {
    this.workoutModalType.set('add');
    this.workoutModal.set(true);
  }
  showEditWorkoutModal(data: IWorkoutDto) {
    this.workoutModalType.set('edit');
    this.selectedWorkout.set(data);
    this.workoutModal.set(true);
  }
  hideWorkoutModal() {
    this.workoutModal.set(false);
    this.workoutModalType.set(null);
    this.selectedWorkout.set(null);
  }

  // Exercise

  private exerciseModal = signal<boolean>(false);
  private howToExerciseModal = signal<boolean>(false);
  private workoutId = signal<number>(0);
  private order = signal<number>(0);
  private exerciseId = signal<number>(0);
  private apiExerciseId = signal<string>('');
  private exerciseName = signal<string>('');
  private exercise = signal<IWorkoutExerciseDto | null>(null);

  readonly exerciseModalSignal = this.exerciseModal.asReadonly();
  readonly howToExerciseModalSignal = this.howToExerciseModal.asReadonly();
  readonly workoutIdSignal = this.workoutId.asReadonly();
  readonly orderSignal = this.order.asReadonly();
  readonly exerciseIdSignal = this.exerciseId.asReadonly();
  readonly apiExerciseIdSignal = this.apiExerciseId.asReadonly();
  readonly exerciseNameSignal = this.exerciseName.asReadonly();
  readonly exerciseSignal = this.exercise.asReadonly();


  showExerciseModal(workoutId: number, order: number, exerciseId: number = 0) {
    this.exerciseModal.set(true);
    this.workoutId.set(workoutId);
    this.order.set(order);
    this.exerciseId.set(exerciseId);
  }

  hideExerciseModal() {
    this.exerciseModal.set(false);
    this.workoutId.set(0);
    this.order.set(0);
    this.exerciseId.set(0);
  }

  showExerciseNotesModal(data: IWorkoutExerciseDto) {
    this.notesModal.set(true);
    this.notes.set(data.notes);
    this.isExerciseNotesModal.set(true);

    this.exercise.set(data);
  }

  showHowToExerciseModal(apiExerciseId: string) {
    this.howToExerciseModal.set(true);
    this.apiExerciseId.set(apiExerciseId);
  }

  hideHowToExerciseModal() {
    this.howToExerciseModal.set(false);
    this.apiExerciseId.set('');
  }

  // Notes

  private notesModal = signal<boolean>(false);
  private notes = signal<string>('');
  private isExerciseNotesModal = signal<boolean>(false);

  readonly notesModalSignal = this.notesModal.asReadonly();
  readonly notesSignal = this.notes.asReadonly();
  readonly isExerciseNotesModalSignal = this.isExerciseNotesModal.asReadonly();

  hideNotesModal() {
    this.notesModal.set(false);
    this.notes.set('');

    this.isExerciseNotesModal.set(false);

    this.exercise.set(null);
  }

  // Sets

  private setModal = signal<boolean>(false);
  private setModalType = signal<TModal | null>(null);
  private selectedSet = signal<IWorkoutExerciseSetDto | null>(null);
  private selectedExercise = signal<IWorkoutExerciseDto | null>(null);

  readonly setModalSignal = this.setModal.asReadonly();
  readonly setModalTypeSignal = this.setModalType.asReadonly();
  readonly selectedSetSignal = this.selectedSet.asReadonly();
  readonly selectedExerciseSignal = this.selectedExercise.asReadonly();

  showAddSetModal(exercise: IWorkoutExerciseDto, order: number) {
    this.setModalType.set('add');
    this.order.set(order);
    this.selectedExercise.set(exercise)
    this.setModal.set(true);
  }
  showEditSetModal(data: IWorkoutExerciseSetDto, exercise: IWorkoutExerciseDto) {
    this.setModalType.set('edit');
    this.selectedSet.set(data);
    this.selectedExercise.set(exercise)
    this.setModal.set(true);
  }
  hideSetModal() {
    this.setModal.set(false);
    this.setModalType.set(null);
    this.order.set(0);
    this.selectedExercise.set(null);
    this.selectedSet.set(null);
  }
}
