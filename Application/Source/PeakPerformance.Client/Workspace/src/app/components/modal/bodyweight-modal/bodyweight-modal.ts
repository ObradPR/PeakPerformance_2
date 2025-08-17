import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { IModalMethods } from '../interfaces/modal-methods.interface';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedService } from '../../../services/shared.service';
import { IBodyweightDto } from '../../../_generated/interfaces';
import { ModalService } from '../../../services/modal.service';
import { AuthService } from '../../../services/auth.service';
import { LoaderService } from '../../../services/loader.service';
import { BodyweightController } from '../../../_generated/services';
import { BaseValidationComponent } from '../../../pages/_base/base.component/base-validation.component';
import { ValidationDirective } from '../../../directives/validation.directive';
import { DateTime } from 'luxon';
import { eMeasurementUnit } from '../../../_generated/enums';
import { MeasurementUnitDescriptionPipe } from "../../../pipes/measurement-unit-description.pipe";

@Component({
  selector: 'app-bodyweight-modal',
  imports: [FormsModule, ReactiveFormsModule, ValidationDirective, MeasurementUnitDescriptionPipe],
  templateUrl: './bodyweight-modal.html',
  styleUrl: './bodyweight-modal.css'
})
export class BodyweightModal extends BaseValidationComponent implements IModalMethods, OnInit {
  override errors: Record<string, string>;
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;

  userWeightPreference: eMeasurementUnit | undefined;
  selectedBodyweight: IBodyweightDto | null = null;
  modalType: string;
  minLogDate: string;
  maxLogDate: string;

  constructor(
    private fb: FormBuilder,

    private bodyweightController: BodyweightController,

    public modalService: ModalService,
    private authService: AuthService,
    private sharedService: SharedService,
    private loaderService: LoaderService
  ) {
    super();
    this.modalType = this.modalService.bodyweightModalTypeSignal() === 'add' ? 'Add' : 'Edit';
    this.selectedBodyweight = this.modalService.selectedBodyweightSignal();
    this.userWeightPreference = this.authService.currentUserSource()?.weightUnitId;

    this.minLogDate = DateTime.now().minus({ months: 3 }).toISODate();
    this.maxLogDate = DateTime.now().toISODate();
  }

  ngOnInit(): void {
    this.formInit();
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    const date = new Date(Date.now());
    const localDate = this.sharedService.getLocalDate(date);
    localDate.setHours(0, 0, 0);
    console.log('local date', localDate);
    const formattedDate = localDate.toLocaleDateString('en-CA');
    console.log('formated', formattedDate);

    this.form = this.fb.group({
      logDate: [formattedDate],
      value: [0],
      weightUnitId: [this.userWeightPreference],
      bodyFatPercentage: [null]
    });
  }

  submit() {
    this.loaderService.showPageLoader();

    if (this.selectedBodyweight !== null)
      this.form.value.id = this.selectedBodyweight.id;

    this.bodyweightController.Save(this.form.value).toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.modalService.hideBodyweightModal();
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => {
        this.loaderService.hidePageLoader();
        // this.bodyweightService.triggerBodyweights();
      });
  }

}
