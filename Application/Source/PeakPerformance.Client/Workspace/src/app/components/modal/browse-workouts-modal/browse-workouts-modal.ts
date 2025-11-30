import { NgClass } from '@angular/common';
import { Component, output, OutputEmitterRef } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { DatePickerModule } from 'primeng/datepicker';
import { IWorkoutLogDto } from '../../../_generated/interfaces';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';
import { WorkoutService } from '../../../services/workout.service';


@Component({
  selector: 'app-browse-workouts-modal',
  imports: [DatePickerModule, FormsModule, NgClass],
  templateUrl: './browse-workouts-modal.html',
  styleUrl: './browse-workouts-modal.css'
})
export class BrowseWorkoutsModal {
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();

  allWorkoutLogs: IWorkoutLogDto[] = [];
  loggedWorkoutDates: Date[] = [];
  disabledDates: Date[] = [];
  selectedDate: Date;

  constructor(
    private router: Router,

    public modalService: ModalService,
    private workoutService: WorkoutService,
    private loaderService: LoaderService,
  ) {
    this.loaderService.showPageLoader();

    this.selectedDate = new Date(this.modalService.workoutDateSignal()!);

    this.workoutService.getWorkoutLogs()
      .then(_ => {
        this.allWorkoutLogs = this.workoutService.workoutLogsSignal() ?? [];
        this.loggedWorkoutDates = this.allWorkoutLogs.map(_ => new Date(_.logDate));
        this.disabledDates = this.computeDisabledDates(this.loggedWorkoutDates);

      })
      .finally(() => this.loaderService.hidePageLoader());
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  // Calendar

  isWorkoutDateFromTemplate(dateTpl: any): boolean {
    const d = this.toDateFromTemplate(dateTpl);
    return this.loggedWorkoutDates.some(x =>
      this.sameDay(x, d) && (!this.selectedDate || !this.sameDay(x, this.selectedDate))
    );
  }

  private toDateFromTemplate(dateTpl: any): Date {
    // dateTpl has properties: day (1..31), month (1..12) and year
    return new Date(dateTpl.year, dateTpl.month, dateTpl.day);
  }

  private sameDay(a: Date, b: Date) {
    return a.getFullYear() === b.getFullYear()
      && a.getMonth() === b.getMonth()
      && a.getDate() === b.getDate();
  }

  isEnabled(date: Date) {
    const allowedDatesSet = new Set(this.loggedWorkoutDates.map(_ => _.toDateString()));
    return allowedDatesSet.has(date.toDateString());
  }

  // Build disabledDates (all dates in range that are NOT in loggedWorkoutDates)
  computeDisabledDates(allowedDates: Date[]): Date[] {
    const allowedStr = new Set(allowedDates.map(_ => _.toDateString()));
    const disabled: Date[] = [];

    const start = new Date();
    start.setFullYear(start.getFullYear() - 10);

    const end = new Date();
    end.setFullYear(end.getFullYear() + 10);

    for (let d = new Date(start); d <= end; d.setDate(d.getDate() + 1)) {
      if (!allowedStr.has(d.toDateString())) {
        disabled.push(new Date(d));
      }
    }

    return disabled;
  }

  onDateSelect(date: Date) {
    const workout = this.allWorkoutLogs.find(_ => {
      return this.sameDay(new Date(_.logDate), date);
    });

    if (workout) {
      this.router.navigateByUrl('/', { skipLocationChange: true })
        .then(() => {
          this.modalService.hideBrowseWorkoutsModal();
          this.router.navigateByUrl(`/workouts/${workout.id}`);
        });
    }
  }

}
