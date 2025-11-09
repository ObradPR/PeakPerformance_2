import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { eMeasurementUnit } from '../../../_generated/enums';
import { IBodyweightGoalDto } from '../../../_generated/interfaces';
import { BodyweightGoalController } from '../../../_generated/services';
import { ValidationDirective } from '../../../directives/validation.directive';
import { BaseValidationComponent } from '../../../pages/_base/base.component/base-validation.component';
import { MeasurementConverterPipe } from '../../../pipes/measurement-converter.pipe';
import { MeasurementUnitDescriptionPipe } from '../../../pipes/measurement-unit-description.pipe';
import { AuthService } from '../../../services/auth.service';
import { BodyweightService } from '../../../services/bodyweight.service';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';
import { SharedService } from '../../../services/shared.service';
import { IModalMethods } from '../interfaces/modal-methods.interface';

@Component({
  selector: 'app-bodyweight-goal-modal',
  imports: [FormsModule, ReactiveFormsModule, MeasurementUnitDescriptionPipe, ValidationDirective],
  templateUrl: './bodyweight-goal-modal.html',
  styleUrl: './bodyweight-goal-modal.css'
})
export class BodyweightGoalModal extends BaseValidationComponent implements IModalMethods, OnInit {
  override errors: Record<string, string>;
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;

  userWeightPreference: eMeasurementUnit | undefined;
  selectedBodyweightGoal: IBodyweightGoalDto | null = null;
  modalType: string;;

  constructor(
    private fb: FormBuilder,

    private bodyweightGoalController: BodyweightGoalController,

    public modalService: ModalService,
    private authService: AuthService,
    private sharedService: SharedService,
    private loaderService: LoaderService,
    private bodyweightService: BodyweightService,

    private mesasurementConverterPipe: MeasurementConverterPipe
  ) {
    super();
    this.modalType = this.modalService.bodyweightGoalModalTypeSignal() === 'add' ? 'Add' : 'Edit';
    this.selectedBodyweightGoal = this.modalService.selectedBodyweightGoalSignal();
    this.userWeightPreference = this.authService.currentUserSource()?.weightUnitId;
  }

  ngOnInit(): void {
    this.formInit();
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    const startDate = new Date(this.selectedBodyweightGoal?.startDate ?? Date.now());
    const localStartDate = this.sharedService.getLocalDate(startDate);
    localStartDate.setHours(0, 0, 0);
    const formattedStartDate = localStartDate.toLocaleDateString('en-CA');

    const endDate = this.selectedBodyweightGoal?.endDate ? new Date(this.selectedBodyweightGoal.endDate) : null;
    let localEndDate;
    let formattedEndDate = null;
    if (endDate !== null) {
      localEndDate = this.sharedService.getLocalDate(endDate);
      formattedEndDate = localEndDate.toLocaleDateString('en-CA');
    }

    this.form = this.fb.group({
      startDate: [formattedStartDate],
      endDate: [formattedEndDate],
      target: [parseFloat(this.mesasurementConverterPipe.transform(this.selectedBodyweightGoal?.target, this.selectedBodyweightGoal?.weightUnitId))
      ],
      weightUnitId: [this.userWeightPreference],
    });
  }

  submit() {
    this.loaderService.showPageLoader();

    if (this.selectedBodyweightGoal !== null)
      this.form.value.id = this.selectedBodyweightGoal.id;

    const payload: IBodyweightGoalDto = {
      ...this.form.value,
      target: isNaN(this.form.value.target) ? 0 : this.form.value.target,
      endDate: this.form.value.endDate ?? this.form.value.startDate
    }

    this.bodyweightGoalController.Save(payload).toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.modalService.hideBodyweightGoalModal();
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => {
        this.loaderService.hidePageLoader();
        this.bodyweightService.triggerBodyweights();
      });
  }
}
