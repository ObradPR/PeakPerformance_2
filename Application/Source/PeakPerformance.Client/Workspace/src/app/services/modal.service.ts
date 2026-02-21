import { Injectable, signal } from '@angular/core';
import { IBodyweightDto, IBodyweightGoalDto, IExerciseGoalDto, IMeasurementDto, IMeasurementGoalDto, IWorkoutDto, IWorkoutExerciseDto, IWorkoutExerciseSetDto } from '../_generated/interfaces';
import { single } from 'rxjs';

export type TModal = 'add' | 'edit';

@Injectable({
  providedIn: 'root'
})
export class ModalService {
  private userId = signal<number>(0);
  readonly userIdSignal = this.userId.asReadonly();

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

  showAddWorkoutModal(userId: number) {
    this.userId.set(userId);
    this.workoutModalType.set('add');
    this.workoutModal.set(true);
  }
  showEditWorkoutModal(data: IWorkoutDto) {
    this.userId.set(data.userId);
    this.workoutModalType.set('edit');
    this.selectedWorkout.set(data);
    this.workoutModal.set(true);
  }
  hideWorkoutModal() {
    this.workoutModal.set(false);
    this.workoutModalType.set(null);
    this.selectedWorkout.set(null);
    this.userId.set(0);
  }

  // Exercise

  private exerciseModal = signal<boolean>(false);
  private howToExerciseModal = signal<boolean>(false);
  private workoutId = signal<number>(0);
  private order = signal<number>(0);
  private exerciseId = signal<number>(0);
  private exerciseName = signal<string>('');
  private exercise = signal<IWorkoutExerciseDto | null>(null);
  private isFromExercisesScreen = signal<boolean>(false);
  private isAddingExerciseForComparison = signal<boolean>(false);

  readonly exerciseModalSignal = this.exerciseModal.asReadonly();
  readonly howToExerciseModalSignal = this.howToExerciseModal.asReadonly();
  readonly workoutIdSignal = this.workoutId.asReadonly();
  readonly orderSignal = this.order.asReadonly();
  readonly exerciseIdSignal = this.exerciseId.asReadonly();
  readonly exerciseNameSignal = this.exerciseName.asReadonly();
  readonly exerciseSignal = this.exercise.asReadonly();
  readonly isFromExercisesScreenSignal = this.isFromExercisesScreen.asReadonly();
  readonly isAddingExerciseForComparisonSignal = this.isAddingExerciseForComparison.asReadonly();


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
    this.isFromExercisesScreen.set(false);
    this.userId.set(0);
    this.isAddingExerciseForComparison.set(false);
  }

  showExerciseNotesModal(data: IWorkoutExerciseDto) {
    this.notesModal.set(true);
    this.notes.set(data.notes);
    this.isExerciseNotesModal.set(true);

    this.exercise.set(data);
  }

  showHowToExerciseModal(exerciseId: number) {
    this.howToExerciseModal.set(true);
    this.exerciseId.set(exerciseId);
  }

  hideHowToExerciseModal() {
    this.howToExerciseModal.set(false);
    this.exerciseId.set(0);
  }

  showExereciseReportModal(userId: number) {
    this.isFromExercisesScreen.set(true);
    this.userId.set(userId);
    this.exerciseModal.set(true);
  }

  showAddExerciseForComparisonModal() {
    this.isAddingExerciseForComparison.set(true);
    this.exerciseModal.set(true);
  }

  // Exercise Goal

  private exerciseGoalModal = signal<boolean>(false);
  private exerciseGoalModalType = signal<TModal | null>(null);
  private selectedExerciseGoal = signal<IExerciseGoalDto | null>(null);

  readonly exerciseGoalModalSignal = this.exerciseGoalModal.asReadonly();
  readonly exerciseGoalModalTypeSignal = this.exerciseGoalModalType.asReadonly();
  readonly selectedExerciseGoalSignal = this.selectedExerciseGoal.asReadonly();

  showAddExerciseGoalModal(exerciseId: number) {
    this.exerciseId.set(exerciseId);
    this.exerciseGoalModalType.set('add');
    this.exerciseGoalModal.set(true);
  }
  showEditExerciseGoalModal(data: IExerciseGoalDto) {
    this.exerciseGoalModalType.set('edit');
    this.selectedExerciseGoal.set(data);
    this.exerciseGoalModal.set(true);
  }
  hideExerciseGoalModal() {
    this.exerciseGoalModal.set(false);
    this.exerciseGoalModalType.set(null);
    this.selectedExerciseGoal.set(null);
    this.exerciseId.set(0);
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
  private previousSet = signal<IWorkoutExerciseSetDto | null>(null);
  private selectedExercise = signal<IWorkoutExerciseDto | null>(null);

  readonly setModalSignal = this.setModal.asReadonly();
  readonly setModalTypeSignal = this.setModalType.asReadonly();
  readonly selectedSetSignal = this.selectedSet.asReadonly();
  readonly previousSetSignal = this.previousSet.asReadonly();
  readonly selectedExerciseSignal = this.selectedExercise.asReadonly();

  showAddSetModal(lastSet: IWorkoutExerciseSetDto | null, exercise: IWorkoutExerciseDto, order: number) {
    this.setModalType.set('add');
    this.order.set(order);
    this.previousSet.set(lastSet);
    this.selectedExercise.set(exercise)
    this.setModal.set(true);
  }
  showEditSetModal(lastSet: IWorkoutExerciseSetDto | null, data: IWorkoutExerciseSetDto, exercise: IWorkoutExerciseDto) {
    this.setModalType.set('edit');
    this.selectedSet.set(data);
    this.previousSet.set(lastSet);
    this.selectedExercise.set(exercise)
    this.setModal.set(true);
  }
  hideSetModal() {
    this.setModal.set(false);
    this.setModalType.set(null);
    this.order.set(0);
    this.selectedExercise.set(null);
    this.selectedSet.set(null);
    this.previousSet.set(null);
  }

  // Browse Workotus

  private browseWorkoutsModal = signal<boolean>(false);
  private workoutDate = signal<Date | null>(null);

  readonly browseWorkoutsModalSignal = this.browseWorkoutsModal.asReadonly();
  readonly workoutDateSignal = this.workoutDate.asReadonly();

  showBrowseWorkoutsModal(workoutDate: Date, userId: number) {
    this.workoutDate.set(workoutDate)
    this.userId.set(userId);
    this.browseWorkoutsModal.set(true);
  }
  hideBrowseWorkoutsModal() {
    this.userId.set(0);
    this.browseWorkoutsModal.set(false);
    this.workoutDate.set(null);
  }

  // Find Lifters

  private findLiftersModal = signal<boolean>(false);

  readonly findLiftersModalSignal = this.findLiftersModal.asReadonly();

  showFindLiftersModal() {
    this.findLiftersModal.set(true);
  }
  hideFindLiftersModal() {
    this.findLiftersModal.set(false);
  }

  // Deactivate User

  private deactivateUserModal = signal<boolean>(false);
  readonly deactivateUserModalSignal = this.deactivateUserModal.asReadonly();
  private reload = signal<boolean>(false);
  readonly reloadSignal = this.reload.asReadonly();

  showDeactivateUserModal(userId: number = 0) {
    this.userId.set(userId);
    this.deactivateUserModal.set(true);
  }

  hideDeactivateUserModal() {
    this.deactivateUserModal.set(false);
    this.userId.set(0);
    this.reload.set(!this.reload())
  }

}
