import { Component, output, OutputEmitterRef } from '@angular/core';
import { IWorkoutLogDto } from '../../../_generated/interfaces';
import { WorkoutsCalendar } from "../../../pages/workout/workouts-calendar/workouts-calendar";
import { ModalService } from '../../../services/modal.service';


@Component({
  selector: 'app-browse-workouts-modal',
  imports: [WorkoutsCalendar],
  templateUrl: './browse-workouts-modal.html',
  styleUrl: './browse-workouts-modal.css'
})
export class BrowseWorkoutsModal {
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();

  allWorkoutLogs: IWorkoutLogDto[] = [];
  selectedDate: Date;

  constructor(
    public modalService: ModalService,
  ) {
    this.selectedDate = new Date(this.modalService.workoutDateSignal()!);
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }
}
