import { DatePipe } from '@angular/common';
import { Component, input, OnInit } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { DateTime } from 'luxon';
import { IWorkoutDto } from '../../../_generated/interfaces';
import { Providers } from '../../../_generated/providers';
import { WorkoutController } from '../../../_generated/services';
import { ShortInfoStats } from "../../../components/short-info-stats/short-info-stats";
import { ClickOutsideDirective } from '../../../directives/click-outside.directive';
import { DurationPipe } from '../../../pipes/duration.pipe';
import { MeasurementConverterPipe } from "../../../pipes/measurement-converter.pipe";
import { AuthService } from '../../../services/auth.service';
import { ModalService } from '../../../services/modal.service';
import { ExercisesTemplate } from '../../exercise/exercises-template/exercises-template';

@Component({
  selector: 'app-workout-template',
  imports: [ClickOutsideDirective, MeasurementConverterPipe, DurationPipe, RouterLink, ExercisesTemplate, DatePipe, ShortInfoStats],
  templateUrl: './workout-template.html',
  styleUrl: './workout-template.css'
})
export class WorkoutTemplate implements OnInit {
  workout = input<IWorkoutDto>();
  editable = input<boolean>(true);
  isFromMainWorkoutsScren = input<boolean>(false);

  workoutTime: string;
  userWeightPreference: string;

  selectedWorkoutMenu = false;

  constructor(
    private router: Router,

    public modalService: ModalService,
    private providers: Providers,
    private authService: AuthService,

    private workoutController: WorkoutController,
  ) {
    this.userWeightPreference = this.providers.getMeasurementUnits().find(_ => _.id === this.authService.currentUserSource()?.weightUnitId)?.description ?? '';
  }

  ngOnInit(): void {
    this.formatWorkoutTime();
  }

  // events 

  onOpenEditMenu() {
    if (this.editable())
      this.selectedWorkoutMenu = true;
  }

  // methods

  editWorkout() {
    if (this.editable()) {
      this.selectedWorkoutMenu = false;
      this.modalService.showEditWorkoutModal(this.workout()!);
    }
  }
  deleteWorkout() {
    this.selectedWorkoutMenu = false;
    this.workoutController.Delete(this.workout()!.id).toPromise()
      .then(_ => this.router.navigateByUrl("/workouts"))
      .catch(ex => { throw ex; })
  }

  // private

  private formatWorkoutTime() {
    const { startAt, finishAt } = this.workout()!;

    const startFormatted = this.formatTimeToAMPM(startAt);
    const finishFormatted = this.formatTimeToAMPM(finishAt);

    if (startAt && finishAt) {
      this.workoutTime = `${startFormatted} - ${finishFormatted}`;
    }
    else if (startAt) {
      this.workoutTime = `Start at: ${startFormatted}`;
    }
    else if (finishAt) {
      this.workoutTime = `Finish at: ${finishFormatted}`;
    }
    else {
      this.workoutTime = '';
    }
  }

  private formatTimeToAMPM(time: string): string {
    if (!time) return '';

    return DateTime.fromFormat(time, 'HH:mm:ss')
      .toFormat('h:mm a'); // 12-hour format with AM/PM
  }
}
