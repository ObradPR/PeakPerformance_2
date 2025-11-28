import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DateTime } from 'luxon';
import { eMeasurementUnit } from '../../../_generated/enums';
import { IMeasurementDto } from '../../../_generated/interfaces';
import { MeasurementController } from '../../../_generated/services';
import { ValidationDirective } from '../../../directives/validation.directive';
import { BaseValidationComponent } from '../../../pages/_base/base.component/base-validation.component';
import { EnumNamePipe } from "../../../pipes/enum-name.pipe";
import { MeasurementConverterPipe } from '../../../pipes/measurement-converter.pipe';
import { MeasurementUnitDescriptionPipe } from '../../../pipes/measurement-unit-description.pipe';
import { AuthService } from '../../../services/auth.service';
import { LoaderService } from '../../../services/loader.service';
import { MeasurementService } from '../../../services/measurement.service';
import { ModalService } from '../../../services/modal.service';
import { SharedService } from '../../../services/shared.service';
import { IModalMethods } from '../interfaces/modal-methods.interface';

@Component({
  selector: 'app-measurement-modal',
  imports: [FormsModule, ReactiveFormsModule, ValidationDirective, MeasurementUnitDescriptionPipe, EnumNamePipe],
  templateUrl: './measurement-modal.html',
  styleUrl: './measurement-modal.css'
})
export class MeasurementModal extends BaseValidationComponent implements IModalMethods, OnInit {
  override errors: Record<string, string>;
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;
  updateForm: FormGroup<any>;

  userMeasurementPreference: eMeasurementUnit | undefined;
  selectedMeasurement: IMeasurementDto | null = null;
  modalType: string;
  minLogDate: string;
  maxLogDate: string;

  constructor(
    private fb: FormBuilder,

    private measurementController: MeasurementController,

    public modalService: ModalService,
    private authService: AuthService,
    private sharedService: SharedService,
    private loaderService: LoaderService,
    private measurementService: MeasurementService,

    private mesasurementConverterPipe: MeasurementConverterPipe
  ) {
    super();
    this.modalType = this.modalService.measurementModalTypeSignal() === 'add' ? 'Add' : 'Edit';
    this.selectedMeasurement = this.modalService.selectedMeasurementSignal();
    this.userMeasurementPreference = this.authService.currentUserSource()?.measurementUnitId;

    this.minLogDate = DateTime.now().minus({ months: 3 }).toISODate();
    this.maxLogDate = DateTime.now().toISODate();
  }

  ngOnInit(): void {
    if (this.selectedMeasurement === null) {
      this.formInit();
    }
    else if (this.selectedMeasurement !== null) {
      this.updateFormInit();
    }
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  updateFormInit(): void {
    const date = new Date(this.selectedMeasurement!.logDate!);
    const localDate = this.sharedService.getLocalDate(date);
    const formattedDate = localDate.toLocaleDateString('en-CA');

    this.updateForm = this.fb.group({
      logDate: [formattedDate],
      size: [parseFloat(this.mesasurementConverterPipe.transform(this.selectedMeasurement!.size, this.selectedMeasurement!.measurementUnitId))
      ],
      measurementUnitId: [this.userMeasurementPreference],
      bodyPartId: [this.selectedMeasurement!.bodyPartId]
    });
  }

  formInit(): void {
    const date = new Date(Date.now());
    const localDate = this.sharedService.getLocalDate(date);
    localDate.setHours(0, 0, 0);
    const formattedDate = localDate.toLocaleDateString('en-CA');

    this.form = this.fb.group({
      logDate: [formattedDate],
      measurementUnitId: [this.userMeasurementPreference],
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

    this.measurementController.Create(this.form.value).toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.modalService.hideMeasurementModal();
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => {
        this.loaderService.hidePageLoader();
        this.measurementService.triggerMeasurements();
      });
  }

  submitUpdate() {
    this.loaderService.showPageLoader();

    this.updateForm.value.id = this.selectedMeasurement!.id;

    this.measurementController.Update(this.updateForm.value).toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.modalService.hideMeasurementModal();
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => {
        this.loaderService.hidePageLoader();
        this.measurementService.triggerMeasurements();
      });
  }
}
