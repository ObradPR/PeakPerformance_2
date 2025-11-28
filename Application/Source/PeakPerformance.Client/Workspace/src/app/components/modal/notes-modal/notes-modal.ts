import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { ExerciseController } from '../../../_generated/services';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';
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
    private router: Router,

    private exerciseController: ExerciseController,

    public modalService: ModalService,
    private loaderService: LoaderService,
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
        ...this.form.value,
        id: this.modalService.exerciseIdSignal(),
        workoutId: this.modalService.workoutIdSignal(),
        apiExerciseId: this.modalService.apiExerciseIdSignal(),
        name: this.modalService.exerciseNameSignal()
      };

      this.exerciseController.Save(payload).toPromise()
        .then(_ => {
          if (_?.isSuccess) {
            this.router.navigateByUrl('/', { skipLocationChange: true })
              .then(() => {
                this.router.navigateByUrl(`/workouts/${this.modalService.workoutIdSignal()}`)
                this.modalService.hideNotesModal();
              });
          }
        })
        .catch(ex => console.log(ex))
        .finally(() => {
          this.loaderService.hidePageLoader();
        });
    }
  }
}
