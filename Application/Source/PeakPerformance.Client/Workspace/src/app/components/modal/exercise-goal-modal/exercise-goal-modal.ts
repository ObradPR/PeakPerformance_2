import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { eMeasurementUnit } from '../../../_generated/enums';
import { IExerciseGoalDto } from '../../../_generated/interfaces';
import { ValidationDirective } from '../../../directives/validation.directive';
import { BaseValidationComponent } from '../../../pages/_base/base.component/base-validation.component';
import { MeasurementUnitDescriptionPipe } from '../../../pipes/measurement-unit-description.pipe';
import { IModalMethods } from '../interfaces/modal-methods.interface';
import { ExerciseGoalController } from '../../../_generated/services';
import { ModalService } from '../../../services/modal.service';
import { AuthService } from '../../../services/auth.service';
import { SharedService } from '../../../services/shared.service';
import { LoaderService } from '../../../services/loader.service';
import { MeasurementConverterPipe } from '../../../pipes/measurement-converter.pipe';
import { ExerciseService } from '../../../services/exercise.service';

@Component({
  selector: 'app-exercise-goal-modal',
  imports: [FormsModule, ReactiveFormsModule, MeasurementUnitDescriptionPipe, ValidationDirective],
  templateUrl: './exercise-goal-modal.html',
  styleUrl: './exercise-goal-modal.css'
})
export class ExerciseGoalModal extends BaseValidationComponent implements IModalMethods, OnInit {
  override errors: Record<string, string>;
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;

  userWeightPreference: eMeasurementUnit | undefined;
  selectedExerciseGoal: IExerciseGoalDto | null = null;
  modalType: string;

  constructor(
    private fb: FormBuilder,

    private exerciseGoalController: ExerciseGoalController,

    public modalService: ModalService,
    private authService: AuthService,
    private sharedService: SharedService,
    private loaderService: LoaderService,
    private exerciseService: ExerciseService,

    private mesasurementConverterPipe: MeasurementConverterPipe
  ) {
    super();
    this.modalType = this.modalService.exerciseGoalModalTypeSignal() === 'add' ? 'Add' : 'Edit';
    this.selectedExerciseGoal = this.modalService.selectedExerciseGoalSignal();
    this.userWeightPreference = this.authService.currentUserSource()?.weightUnitId;
  }

  ngOnInit(): void {
    this.formInit();
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    const startDate = new Date(this.selectedExerciseGoal?.startDate ?? Date.now());
    const localStartDate = this.sharedService.getLocalDate(startDate);
    localStartDate.setHours(0, 0, 0);
    const formattedStartDate = localStartDate.toLocaleDateString('en-CA');

    const endDate = this.selectedExerciseGoal?.endDate ? new Date(this.selectedExerciseGoal.endDate) : null;
    let localEndDate;
    let formattedEndDate = null;
    if (endDate !== null) {
      localEndDate = this.sharedService.getLocalDate(endDate);
      formattedEndDate = localEndDate.toLocaleDateString('en-CA');
    }

    this.form = this.fb.group({
      startDate: [formattedStartDate],
      endDate: [formattedEndDate],
      weight: [parseFloat(this.mesasurementConverterPipe.transform(this.selectedExerciseGoal?.weight, this.selectedExerciseGoal?.weightUnitId))
      ],
      weightUnitId: [this.userWeightPreference],
      reps: [this.selectedExerciseGoal?.reps ?? 1]
    });
  }

  submit() {
    this.loaderService.showPageLoader();

    if (this.selectedExerciseGoal !== null)
      this.form.value.id = this.selectedExerciseGoal.id;

    const payload: IExerciseGoalDto = {
      ...this.form.value,
      endDate: this.form.value.endDate ?? this.form.value.startDate,
      weight: isNaN(this.form.value.weight) ? 0 : this.form.value.weight,
      reps: isNaN(this.form.value.reps) ? 1 : this.form.value.reps,
      exerciseId: this.modalService.exerciseIdSignal(),
    }

    this.exerciseGoalController.Save(payload).toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.modalService.hideExerciseGoalModal();
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => {
        this.loaderService.hidePageLoader();
        this.exerciseService.triggerExerciseChart();
      });
  }
}
