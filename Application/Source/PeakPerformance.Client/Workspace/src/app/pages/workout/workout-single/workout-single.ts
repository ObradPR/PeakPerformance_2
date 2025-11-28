import { Component, importProvidersFrom, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IEnumProvider, IWorkoutDto, IWorkoutExerciseDto } from '../../../_generated/interfaces';
import { ClickOutsideDirective } from '../../../directives/click-outside.directive';
import { DateTime } from 'luxon';
import { ModalService } from '../../../services/modal.service';
import { ExerciseController, WorkoutController } from '../../../_generated/services';
import { MeasurementConverterPipe } from "../../../pipes/measurement-converter.pipe";
import { DurationPipe } from '../../../pipes/duration.pipe';
import { TitleCasePipe, NgStyle, LowerCasePipe } from '@angular/common';
import { LoaderService } from '../../../services/loader.service';
import { eMeasurementUnit, eSetRpeType, eSetType } from '../../../_generated/enums';
import { Providers } from '../../../_generated/providers';
import { AuthService } from '../../../services/auth.service';


enum eOrderMove {
  Up = 1,
  Down = 2
}

@Component({
  selector: 'app-workout-single',
  imports: [ClickOutsideDirective, MeasurementConverterPipe, DurationPipe, TitleCasePipe, NgStyle, LowerCasePipe],
  templateUrl: './workout-single.html',
  styleUrl: './workout-single.css'
})
export class WorkoutSingle implements OnInit {
  workout: IWorkoutDto;
  selectedWorkoutMenu = false;
  workoutTime: string;
  userWeightPreference: string;

  selectedExerciseMenu: number | null;

  setRpes: IEnumProvider[] = [];
  setTypes: IEnumProvider[] = [];


  constructor(
    private route: ActivatedRoute,
    private router: Router,

    public modalService: ModalService,
    private loaderService: LoaderService,
    private providers: Providers,
    private authService: AuthService,

    private workoutController: WorkoutController,
    private exerciseController: ExerciseController
  ) {
    this.userWeightPreference = this.providers.getMeasurementUnits().find(_ => _.id === this.authService.currentUserSource()?.weightUnitId)?.description ?? '';
  }

  ngOnInit(): void {
    this.workout = this.route.snapshot.data['workout']?.data;
    this.setRpes = this.providers.getSetRpeTypes();
    this.setTypes = this.providers.getSetTypes();

    this.formatWorkoutTime();

  }

  // events 

  onOpenEditMenu = () => this.selectedWorkoutMenu = true;
  onOpenExerciseEditMenu(idx: number) {
    if (this.selectedExerciseMenu === idx)
      this.selectedExerciseMenu = null;
    else
      this.selectedExerciseMenu = idx;
  }

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

  switchExercise(id: number, order: number) {
    this.selectedExerciseMenu = null;
    this.modalService.showExerciseModal(this.workout.id, order, id);
  }
  deleteExercise(id: number) {
    this.loaderService.showPageLoader();

    this.selectedExerciseMenu = null;
    this.exerciseController.Delete(id).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.router.navigateByUrl('/', { skipLocationChange: true })
            .then(() => this.router.navigateByUrl(`/workouts/${this.workout.id}`));
        }
      })
      .catch(ex => { throw ex; })
      .finally(() => this.loaderService.hidePageLoader());
  }
  editExerciseNotes(data: IWorkoutExerciseDto) {
    this.selectedExerciseMenu = null;
    this.modalService.showExerciseNotesModal(data);
  }
  howToExercise(apiExerciseId: string) {
    this.selectedExerciseMenu = null;
    this.modalService.showHowToExerciseModal(apiExerciseId);
  }
  moveExercise(exercise: IWorkoutExerciseDto, move: eOrderMove) {
    this.loaderService.showPageLoader();

    if (move === eOrderMove.Up) {
      exercise.order--;
    }
    else if (move === eOrderMove.Down) {
      exercise.order++;
    }

    this.exerciseController.Save(exercise).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.router.navigateByUrl('/', { skipLocationChange: true })
            .then(() => this.router.navigateByUrl(`/workouts/${this.workout.id}`));
        }
      })
      .catch(ex => console.log(ex))
      .finally(() => this.loaderService.hidePageLoader());
  }

  getSetRpeById = (id: eSetRpeType | undefined) => this.setRpes.find(_ => _.id === id);
  getSetTypeById = (id: eSetType | undefined) => this.setTypes.find(_ => _.id === id);
  isColoredTextOnly = (id: eSetType | undefined) => id === eSetType.Warmup;
  isFullBackground = (id: eSetType | undefined) => id === eSetType.Failure || id === eSetType.Dropset;
  hasAnyRpe = (exercise: IWorkoutExerciseDto) => exercise.sets.some(_ => _.rpeTypeId && _.rpeTypeId > 0);
  hasAnyType = (exercise: IWorkoutExerciseDto) => exercise.sets.some(_ => _.typeId && _.typeId > 0);
  hasAnyRest = (exercise: IWorkoutExerciseDto) => exercise.sets.some(_ => _.rest && _.rest > 0);

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
