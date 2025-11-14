import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { BaseValidationComponent } from '../../../pages/_base/base.component/base-validation.component';
import { IModalMethods } from '../interfaces/modal-methods.interface';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ValidationDirective } from '../../../directives/validation.directive';
import { MeasurementUnitDescriptionPipe } from '../../../pipes/measurement-unit-description.pipe';
import { EnumNamePipe } from '../../../pipes/enum-name.pipe';
import { eMeasurementUnit } from '../../../_generated/enums';
import { IMeasurementGoalDto } from '../../../_generated/interfaces';
import { MeasurementGoalController } from '../../../_generated/services';
import { ModalService } from '../../../services/modal.service';
import { AuthService } from '../../../services/auth.service';
import { SharedService } from '../../../services/shared.service';
import { LoaderService } from '../../../services/loader.service';
import { MeasurementService } from '../../../services/measurement.service';
import { MeasurementConverterPipe } from '../../../pipes/measurement-converter.pipe';

@Component({
  selector: 'app-measurement-goal-modal',
  imports: [FormsModule, ReactiveFormsModule, ValidationDirective, MeasurementUnitDescriptionPipe, EnumNamePipe],
  templateUrl: './measurement-goal-modal.html',
  styleUrl: './measurement-goal-modal.css'
})
export class MeasurementGoalModal extends BaseValidationComponent implements IModalMethods, OnInit {
  override errors: Record<string, string>;
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;
  updateForm: FormGroup<any>;

  userWeightPreference: eMeasurementUnit | undefined;
  selectedMeasurementGoal: IMeasurementGoalDto | null = null;
  modalType: string;

  constructor(
    private fb: FormBuilder,

    private measurementGoalController: MeasurementGoalController,

    public modalService: ModalService,
    private authService: AuthService,
    private sharedService: SharedService,
    private loaderService: LoaderService,
    private measurementService: MeasurementService,

    private mesasurementConverterPipe: MeasurementConverterPipe
  ) {
    super();
    this.modalType = this.modalService.measurementGoalModalTypeSignal() === 'add' ? 'Add' : 'Edit';
    this.selectedMeasurementGoal = this.modalService.selectedMeasurementGoalSignal();
    this.userWeightPreference = this.authService.currentUserSource()?.measurementUnitId;
  }

  ngOnInit(): void {
    if (this.selectedMeasurementGoal === null) {
      this.formInit();
    }
    else if (this.selectedMeasurementGoal !== null) {
      this.updateFormInit();
    }
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  updateFormInit(): void {
    const startDate = new Date(this.selectedMeasurementGoal!.startDate!);
    const localStartDate = this.sharedService.getLocalDate(startDate);
    const formattedStartDate = localStartDate.toLocaleDateString('en-CA');

    const endDate = new Date(this.selectedMeasurementGoal!.endDate!);
    const localEndDate = this.sharedService.getLocalDate(endDate);
    const formattedEndDate = localEndDate.toLocaleDateString('en-CA');

    this.updateForm = this.fb.group({
      startDate: [formattedStartDate],
      endDate: [formattedEndDate],
      size: [parseFloat(this.mesasurementConverterPipe.transform(this.selectedMeasurementGoal!.size, this.selectedMeasurementGoal!.measurementUnitId))
      ],
      measurementUnitId: [this.userWeightPreference],
      bodyPartId: [this.selectedMeasurementGoal!.bodyPartId]
    });
  }

  formInit(): void {
    const date = new Date(Date.now());
    const localDate = this.sharedService.getLocalDate(date);
    localDate.setHours(0, 0, 0);
    const formattedDate = localDate.toLocaleDateString('en-CA');

    this.form = this.fb.group({
      startDate: [formattedDate],
      endDate: [null],
      measurementUnitId: [this.userWeightPreference],
      waist: [null],
      hips: [null],
      neck: [null],
      chest: [null],
      shoulders: [null],
      rightBicep: [null],
      leftBicep: [null],
      rightForearm: [null],
      leftForearm: [null],
      rightThigh: [null],
      leftThigh: [null],
      rightCalf: [null],
      leftCalf: [null],
    });
  }

  submitCreate() {
    this.loaderService.showPageLoader();

    const payload: IMeasurementGoalDto = {
      ...this.form.value,
      endDate: this.form.value.endDate ?? this.form.value.startDate
    }

    this.measurementGoalController.Create(payload).toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.modalService.hideMeasurementGoalModal();
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => {
        this.loaderService.hidePageLoader();
        this.measurementService.triggerMeasurements();
      });
  }

  submitUpdate() {
    this.loaderService.showPageLoader();

    this.updateForm.value.id = this.selectedMeasurementGoal!.id;

    this.measurementGoalController.Update(this.updateForm.value).toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.modalService.hideMeasurementGoalModal();
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => {
        this.loaderService.hidePageLoader();
        this.measurementService.triggerMeasurements();
      });
  }
}
