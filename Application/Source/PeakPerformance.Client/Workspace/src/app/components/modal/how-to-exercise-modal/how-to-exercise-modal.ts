import { Component, output, OutputEmitterRef } from '@angular/core';
import { IExerciseDto } from '../../../_generated/interfaces';
import { ExerciseController } from '../../../_generated/services';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';
import { ShortInfoStats } from "../../short-info-stats/short-info-stats";

@Component({
  selector: 'app-how-to-exercise-modal',
  imports: [ShortInfoStats],
  templateUrl: './how-to-exercise-modal.html',
  styleUrl: './how-to-exercise-modal.css'
})
export class HowToExerciseModal {
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  exercise: IExerciseDto | null;

  constructor(
    private exerciseController: ExerciseController,

    private modalService: ModalService,
    private loaderService: LoaderService
  ) {
    this.loaderService.showPageLoader();

    this.exerciseController.GetSingle(this.modalService.exerciseIdSignal()).toPromise()
      .then((res: any) => {
        if (res.isSuccess) {
          this.exercise = res.data;
        }
      })
      .catch(ex => {
        this.exercise = null;
        this.modalService.hideHowToExerciseModal();
      })
      .finally(() => this.loaderService.hidePageLoader());
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

}
