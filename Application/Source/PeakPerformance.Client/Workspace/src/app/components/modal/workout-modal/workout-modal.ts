import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ValidationDirective } from '../../../directives/validation.directive';
import { BaseValidationComponent } from '../../../pages/_base/base.component/base-validation.component';
import { IModalMethods } from '../interfaces/modal-methods.interface';
import { WorkoutController } from '../../../_generated/services';
import { ModalService } from '../../../services/modal.service';
import { LoaderService } from '../../../services/loader.service';
import { IPagingResult, IWorkoutDto, IWorkoutSearchOptions } from '../../../_generated/interfaces';
import { DateTime } from 'luxon';
import { SharedService } from '../../../services/shared.service';
import { Router } from '@angular/router';
import { MeasurementConverterPipe } from '../../../pipes/measurement-converter.pipe';

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

  recentWorkouts: IWorkoutDto[] = [];

  constructor(
    private fb: FormBuilder,
    private router: Router,

    private workoutController: WorkoutController,

    public modalService: ModalService,
    private loaderService: LoaderService,
    private sharedService: SharedService,
  ) {
    super();
    this.modalType = this.modalService.workoutModalTypeSignal() === 'add' ? 'Add' : 'Edit';
    this.selectedWorkout = this.modalService.selectedWorkoutSignal();

    this.minLogDate = DateTime.now().minus({ months: 3 }).toISODate();
    this.maxLogDate = DateTime.now().plus({ months: 1 }).toISODate();
  }

  ngOnInit(): void {
    this.workoutController.GetRecent().toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.recentWorkouts = _.data;
      });

    this.formInit();
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    const date = new Date(this.selectedWorkout?.logDate ?? Date.now());
    const localDate = this.sharedService.getLocalDate(date);
    localDate.setHours(0, 0, 0);
    const formattedDate = localDate.toLocaleDateString('en-CA');

    this.form = this.fb.group({
      copiedFromId: [this.selectedWorkout?.copiedFromId ?? 0],
      name: [this.selectedWorkout?.name],
      logDate: [formattedDate],
      startAt: [this.selectedWorkout?.startAt],
      finishAt: [this.selectedWorkout?.finishAt]
    })

    if (this.selectedWorkout) {
      this.form.get('copiedFromId')?.disable();
    } else {
      this.form.get('copiedFromId')?.enable();
    }
  }

  submit() {
    this.loaderService.showPageLoader();

    if (this.selectedWorkout !== null)
      this.form.value.id = this.selectedWorkout.id;

    const payload: IWorkoutDto = {
      ...this.form.value,
      startAt: this.form.value.startAt ? this.form.value.startAt : null,
      finishAt: this.form.value.finishAt ? this.form.value.finishAt : null,
    }

    this.workoutController.Save(payload).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.modalService.hideWorkoutModal();
          this.router.navigateByUrl('/', { skipLocationChange: true })
            .then(() => this.router.navigateByUrl(`/workouts/${_.data}`));
        }
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => {
        this.loaderService.hidePageLoader();
      });
  }

}
