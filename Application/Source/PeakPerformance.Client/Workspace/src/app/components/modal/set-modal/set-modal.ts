import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { eMeasurementUnit, eSetRpeType, eSetType } from '../../../_generated/enums';
import { IEnumProvider, IWorkoutExerciseDto, IWorkoutExerciseSetDto } from '../../../_generated/interfaces';
import { Providers } from '../../../_generated/providers';
import { SetController } from '../../../_generated/services';
import { ValidationDirective } from '../../../directives/validation.directive';
import { BaseValidationComponent } from '../../../pages/_base/base.component/base-validation.component';
import { MeasurementConverterPipe } from '../../../pipes/measurement-converter.pipe';
import { MeasurementUnitDescriptionPipe } from '../../../pipes/measurement-unit-description.pipe';
import { AuthService } from '../../../services/auth.service';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';
import { IModalMethods } from '../interfaces/modal-methods.interface';

@Component({
  selector: 'app-set-modal',
  imports: [FormsModule, ReactiveFormsModule, ValidationDirective, MeasurementUnitDescriptionPipe],
  templateUrl: './set-modal.html',
  styleUrl: './set-modal.css'
})
export class SetModal extends BaseValidationComponent implements IModalMethods, OnInit {
  override errors: Record<string, string>;
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;

  userWeightPreference: eMeasurementUnit | undefined;
  selectedSet: IWorkoutExerciseSetDto | null = null;
  selectedExercise: IWorkoutExerciseDto | null = null;
  modalType: string;

  rpes: IEnumProvider[];
  types: IEnumProvider[];

  constructor(
    private fb: FormBuilder,
    private router: Router,

    private setController: SetController,

    public modalService: ModalService,
    private authService: AuthService,
    private loaderService: LoaderService,
    private providers: Providers,

    private mesasurementConverterPipe: MeasurementConverterPipe
  ) {
    super();
    this.modalType = this.modalService.setModalTypeSignal() === 'add' ? 'Add' : 'Edit';
    this.selectedSet = this.modalService.selectedSetSignal();
    this.selectedExercise = this.modalService.selectedExerciseSignal();
    this.userWeightPreference = this.authService.currentUserSource()?.weightUnitId;
    this.rpes = this.providers.getSetRpeTypes();
    this.types = this.providers.getSetTypes();
  }

  ngOnInit(): void {
    this.formInit();
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    this.form = this.fb.group({
      weight: [parseFloat(this.mesasurementConverterPipe.transform(this.selectedSet?.weight, this.selectedSet?.weightUnitId))
      ],
      weightUnitId: [this.userWeightPreference],
      reps: [this.selectedSet?.reps],
      sets: [],
      rpeTypeId: [this.selectedSet?.rpeTypeId ?? eSetRpeType.NotSet],
      typeId: [this.selectedSet?.typeId ?? eSetType.NotSet],
      order: [this.selectedSet?.order ?? this.modalService.orderSignal()],
      workoutExerciseId: [this.selectedSet?.workoutExerciseId ?? this.modalService.selectedExerciseSignal()!.id],
      notes: [this.selectedSet?.notes],
      rest: [this.selectedSet?.rest],
      durationMinutes: [this.selectedSet?.durationMinutes]
    });
  }

  submit() {
    this.loaderService.showPageLoader();

    if (this.selectedSet !== null)
      this.form.value.id = this.selectedSet.id;

    const payload: IWorkoutExerciseSetDto = {
      ...this.form.value,
      weight: isNaN(this.form.value.weight) ? 0 : this.form.value.weight,
      reps: this.form.value.reps ? this.form.value.reps : 1,
      sets: this.form.value.sets ? this.form.value.sets : 1
    }

    this.setController.Save(payload).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.router.navigateByUrl('/', { skipLocationChange: true })
            .then(() => {
              this.router.navigateByUrl(`/workouts/${this.modalService.selectedExerciseSignal()!.workoutId}`)
              this.modalService.hideSetModal();
            });
        }
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => {
        this.loaderService.hidePageLoader();
      });
  }
}
