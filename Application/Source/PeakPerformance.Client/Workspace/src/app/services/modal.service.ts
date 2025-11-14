import { Injectable, signal } from '@angular/core';
import { IBodyweightDto, IBodyweightGoalDto, IMeasurementDto, IMeasurementGoalDto } from '../_generated/interfaces';

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
}
