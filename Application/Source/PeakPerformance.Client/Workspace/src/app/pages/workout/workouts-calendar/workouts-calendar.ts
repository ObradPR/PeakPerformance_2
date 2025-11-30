import { NgClass } from '@angular/common';
import { Component, input, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { DatePickerModule } from 'primeng/datepicker';
import { IWorkoutLogDto } from '../../../_generated/interfaces';
import { Router } from '@angular/router';
import { ModalService } from '../../../services/modal.service';
import { LoaderService } from '../../../services/loader.service';
import { WorkoutService } from '../../../services/workout.service';


@Component({
  selector: 'app-workouts-calendar',
  imports: [NgClass, DatePickerModule, FormsModule],
  templateUrl: './workouts-calendar.html',
  styleUrl: './workouts-calendar.css'
})
export class WorkoutsCalendar implements OnInit {
  selectedDate = input<Date | null>(null);

  workoutLogs: IWorkoutLogDto[] = [];
  loggedWorkoutDates: Date[] = [];
  disabledDates: Date[] = [];
  workoutDate: Date | null;

  sameDateWorkouts: IWorkoutLogDto[] = [];

  constructor(
    private router: Router,

    private modalService: ModalService,
    private loaderService: LoaderService,
    private workoutService: WorkoutService

  ) { }

  ngOnInit(): void {
    this.loaderService.showPageLoader();

    this.workoutDate = this.selectedDate() ? new Date(this.selectedDate()!) : null;
    this.workoutService.getWorkoutLogs()
      .then(_ => {
        this.workoutLogs = this.workoutService.workoutLogsSignal() ?? [];
        this.loggedWorkoutDates = this.workoutLogs.map(_ => new Date(_.logDate));
        this.disabledDates = this.computeDisabledDates(this.loggedWorkoutDates);
      })
      .finally(() => this.loaderService.hidePageLoader());
  }

  // Calendar

  isWorkoutDateFromTemplate(dateTpl: any): boolean {
    const d = this.toDateFromTemplate(dateTpl);
    return this.loggedWorkoutDates.some(x =>
      this.sameDay(x, d) &&
      (this.selectedDate() ? (!this.selectedDate() || !this.sameDay(x, this.selectedDate()!)) : true)
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
    const workouts = this.workoutLogs.filter(_ => {
      return this.sameDay(new Date(_.logDate), date);
    });

    if (workouts.length === 1) {
      this.onSelectWorkout(workouts[0].id);
    }
    else if (workouts.length > 1) {
      this.sameDateWorkouts = workouts;
    }
  }

  onSelectWorkout(workoutId: number) {
    this.router.navigateByUrl('/', { skipLocationChange: true })
      .then(() => {
        this.modalService.hideBrowseWorkoutsModal(); // if its from the modal, if not doesn't hurt code a bit
        this.router.navigateByUrl(`/workouts/${workoutId}`);
      });
  }
}
