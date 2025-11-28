import { TitleCasePipe } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component, output, OutputEmitterRef } from '@angular/core';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';

@Component({
  selector: 'app-how-to-exercise-modal',
  imports: [TitleCasePipe],
  templateUrl: './how-to-exercise-modal.html',
  styleUrl: './how-to-exercise-modal.css'
})
export class HowToExerciseModal {
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  exercise: any; // can't use generated api objs , since the get By id return a different kind of obj, it seems

  constructor(
    private http: HttpClient,

    private modalService: ModalService,
    private loaderService: LoaderService
  ) {
    this.loaderService.showPageLoader();

    this.http.get<any>(`https://www.exercisedb.dev/api/v1/exercises/${this.modalService.apiExerciseIdSignal()}`).toPromise()
      .then((res: any) => {
        if (res.success) {
          this.exercise = res.data;
        }
      })
      .catch(ex => {
        this.exercise = {}
        this.modalService.hideHowToExerciseModal();
      })
      .finally(() => this.loaderService.hidePageLoader());
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

}
