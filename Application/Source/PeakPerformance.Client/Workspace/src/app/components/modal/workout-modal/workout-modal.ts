import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ValidationDirective } from '../../../directives/validation.directive';
import { BaseValidationComponent } from '../../../pages/_base/base.component/base-validation.component';
import { IModalMethods } from '../interfaces/modal-methods.interface';
import { WorkoutController } from '../../../_generated/services';
import { ModalService } from '../../../services/modal.service';
import { LoaderService } from '../../../services/loader.service';
import { IWorkoutDto } from '../../../_generated/interfaces';
import { DateTime } from 'luxon';

@Component({
  selector: 'app-workout-modal',
  imports: [FormsModule, ReactiveFormsModule, ValidationDirective],
  templateUrl: './workout-modal.html',
  styleUrl: './workout-modal.css'
})
export class WorkoutModal extends BaseValidationComponent implements IModalMethods, OnInit {
  override errors: Record<string, string>;
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;

  selectedWorkout: IWorkoutDto | null = null;
  modalType: string;
  minLogDate: string;
  maxLogDate: string;

  constructor(
    private fb: FormBuilder,

    private workoutController: WorkoutController,

    public modalService: ModalService,
    private loaderService: LoaderService
  ) {
    super();
    this.modalType = this.modalService.workoutModalTypeSignal() === 'add' ? 'Add' : 'Edit';
    this.selectedWorkout = this.modalService.selectedWorkoutSignal();

    this.minLogDate = DateTime.now().minus({ months: 3 }).toISODate();
    this.maxLogDate = DateTime.now().plus({ months: 1 }).toISODate();
  }

  ngOnInit(): void {
    this.formInit();
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {

  }

  submit() { }

}
