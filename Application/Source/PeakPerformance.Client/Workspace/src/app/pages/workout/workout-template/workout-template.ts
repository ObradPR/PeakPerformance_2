import { LowerCasePipe, NgStyle, TitleCasePipe } from '@angular/common';
import { Component, input, OnInit } from '@angular/core';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { DateTime } from 'luxon';
import { eSetRpeType, eSetType } from '../../../_generated/enums';
import { IEnumProvider, IWorkoutDto, IWorkoutExerciseDto, IWorkoutExerciseSetDto } from '../../../_generated/interfaces';
import { Providers } from '../../../_generated/providers';
import { ExerciseController, SetController, WorkoutController } from '../../../_generated/services';
import { ClickOutsideDirective } from '../../../directives/click-outside.directive';
import { DurationPipe } from '../../../pipes/duration.pipe';
import { MeasurementConverterPipe } from "../../../pipes/measurement-converter.pipe";
import { AuthService } from '../../../services/auth.service';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';

enum eOrderMove {
  Up = 1,
  Down = 2
}

@Component({
  selector: 'app-workout-template',
  imports: [ClickOutsideDirective, MeasurementConverterPipe, DurationPipe, TitleCasePipe, NgStyle, LowerCasePipe, RouterLink],
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
  selectedExerciseMenu: number | null;
  selectedSetMenu: number | null;

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
    private exerciseController: ExerciseController,
    private setController: SetController
  ) {
    this.userWeightPreference = this.providers.getMeasurementUnits().find(_ => _.id === this.authService.currentUserSource()?.weightUnitId)?.description ?? '';
  }

  ngOnInit(): void {
    this.setRpes = this.providers.getSetRpeTypes();
    this.setTypes = this.providers.getSetTypes();

    this.formatWorkoutTime();
  }

  // events 

  onOpenEditMenu() {
    if (this.editable())
      this.selectedWorkoutMenu = true;
  }
  onOpenExerciseEditMenu(idx: number) {
    if (this.selectedExerciseMenu === idx)
      this.selectedExerciseMenu = null;
    else
      this.selectedExerciseMenu = idx;
  }
  onOpenSetEditMenu(setId: number) {
    if (this.selectedSetMenu === setId)
      this.selectedSetMenu = null;
    else
      this.selectedSetMenu = setId;
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

  switchExercise(id: number, order: number) {
    this.selectedExerciseMenu = null;
    this.modalService.showExerciseModal(this.workout()!.id, order, id);
  }
  deleteExercise(id: number) {
    this.loaderService.showPageLoader();

    this.selectedExerciseMenu = null;
    this.exerciseController.Delete(id).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.router.navigateByUrl('/', { skipLocationChange: true })
            .then(() => this.router.navigateByUrl(`/workouts/${this.workout()!.id}`));
        }
      })
      .catch(ex => { throw ex; })
      .finally(() => this.loaderService.hidePageLoader());
  }
  editExerciseNotes(data: IWorkoutExerciseDto) {
    if (this.editable()) {
      this.selectedExerciseMenu = null;
      this.modalService.showExerciseNotesModal(data);
    }
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
            .then(() => this.router.navigateByUrl(`/workouts/${this.workout()!.id}`));
        }
      })
      .catch(ex => console.log(ex))
      .finally(() => this.loaderService.hidePageLoader());
  }
  editSet(set: IWorkoutExerciseSetDto, exercise: IWorkoutExerciseDto) {
    if (this.editable()) {
      this.selectedSetMenu = null;
      this.modalService.showEditSetModal(set, exercise);
    }
  }
  deleteSet(id: number) {
    this.loaderService.showPageLoader();

    this.selectedSetMenu = null;
    this.setController.Delete(id).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.router.navigateByUrl('/', { skipLocationChange: true })
            .then(() => this.router.navigateByUrl(`/workouts/${this.workout()!.id}`));
        }
      })
      .catch(ex => { throw ex; })
      .finally(() => this.loaderService.hidePageLoader());
  }
  moveSet(set: IWorkoutExerciseSetDto, move: eOrderMove) {
    this.loaderService.showPageLoader();

    if (move === eOrderMove.Up) {
      set.order--;
    }
    else if (move === eOrderMove.Down) {
      set.order++;
    }

    this.setController.Save(set).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.router.navigateByUrl('/', { skipLocationChange: true })
            .then(() => this.router.navigateByUrl(`/workouts/${this.workout()!.id}`));
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
  getTotalColumns(exercise: IWorkoutExerciseDto) {
    let count = 2; // weight + reps

    if (this.hasAnyRpe(exercise)) count++;
    if (this.hasAnyType(exercise)) count++;
    if (this.hasAnyRest(exercise)) count++;

    return count + 1; // +1 for the empty action column
  }
  getSetPrefix(typeId?: eSetType): string {
    if (!typeId)
      return '';
    else if (typeId === eSetType.Warmup)
      return 'W ';
    else if (typeId === eSetType.Dropset)
      return '↳ ';

    return '';
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
