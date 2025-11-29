import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ExerciseController } from '../../../_generated/services';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';
import { WorkoutService } from '../../../services/workout.service';
import { IModalMethods } from '../interfaces/modal-methods.interface';

@Component({
  selector: 'app-notes-modal',
  imports: [FormsModule, ReactiveFormsModule],
  templateUrl: './notes-modal.html',
  styleUrl: './notes-modal.css'
})
export class NotesModal implements IModalMethods, OnInit {
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;

  constructor(
    private fb: FormBuilder,

    private exerciseController: ExerciseController,

    public modalService: ModalService,
    private loaderService: LoaderService,
    private workoutService: WorkoutService
  ) { }

  ngOnInit(): void {
    this.formInit();
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    this.form = this.fb.group({
      notes: [this.modalService.notesSignal()]
    })
  }

  submit() {
    let payload: any;

    if (this.modalService.isExerciseNotesModalSignal()) {
      this.loaderService.showPageLoader();

      payload = {
        ...this.modalService.exerciseSignal(),
        ...this.form.value,
      };

      this.exerciseController.Save(payload).toPromise()
        .then(_ => {
          if (_?.isSuccess) {
            this.workoutService.refreshWorkout(this.modalService.exerciseSignal()!.workoutId)
              .then(_ => {
                this.modalService.hideNotesModal();
              })
          }
        })
        .catch(ex => console.log(ex))
        .finally(() => {
          this.loaderService.hidePageLoader();
        });
    }
  }
}
