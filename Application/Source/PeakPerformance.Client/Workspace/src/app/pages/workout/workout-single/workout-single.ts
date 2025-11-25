import { Component, importProvidersFrom, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IWorkoutDto } from '../../../_generated/interfaces';
import { ClickOutsideDirective } from '../../../directives/click-outside.directive';
import { DateTime } from 'luxon';
import { ModalService } from '../../../services/modal.service';
import { WorkoutController } from '../../../_generated/services';
import { MeasurementConverterPipe } from "../../../pipes/measurement-converter.pipe";
import { DurationPipe } from '../../../pipes/duration.pipe';

@Component({
  selector: 'app-workout-single',
  imports: [ClickOutsideDirective, MeasurementConverterPipe, DurationPipe],
  templateUrl: './workout-single.html',
  styleUrl: './workout-single.css'
})
export class WorkoutSingle implements OnInit {
  workout: IWorkoutDto;
  selectedWorkoutMenu = false;
  workoutTime: string;

  constructor(
    private route: ActivatedRoute,
    private router: Router,

    private modalService: ModalService,

    private workoutController: WorkoutController,
  ) { }

  ngOnInit(): void {
    this.workout = this.route.snapshot.data['workout']?.data;

    this.formatWorkoutTime();

  }

  // events 

  onOpenEditMenu = () => this.selectedWorkoutMenu = true;

  // methods

  editWorkout() {
    this.selectedWorkoutMenu = false;
    this.modalService.showEditWorkoutModal(this.workout);
  }

  deleteWorkout() {
    this.selectedWorkoutMenu = false;
    this.workoutController.Delete(this.workout.id).toPromise()
      .then(_ => this.router.navigateByUrl("/workouts"))
      .catch(ex => { throw ex; })
  }

  // private

  private formatWorkoutTime() {
    const { startAt, finishAt } = this.workout;

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
