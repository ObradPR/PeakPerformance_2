import { NgStyle } from '@angular/common';
import { Component, input } from '@angular/core';
import { eSetRpeType, eSetType } from '../../../_generated/enums';
import { IEnumProvider, IWorkoutExerciseDto, IWorkoutExerciseSetDto } from '../../../_generated/interfaces';
import { Providers } from '../../../_generated/providers';
import { SetController } from '../../../_generated/services';
import { ClickOutsideDirective } from '../../../directives/click-outside.directive';
import { MeasurementConverterPipe } from '../../../pipes/measurement-converter.pipe';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';
import { WorkoutService } from '../../../services/workout.service';
import { eOrderMove } from '../../exercise/exercises-template/exercises-template';

@Component({
  selector: 'app-sets-template',
  imports: [NgStyle, MeasurementConverterPipe, ClickOutsideDirective],
  templateUrl: './sets-template.html',
  styleUrl: './sets-template.css'
})
export class SetsTemplate {
  exercise = input<IWorkoutExerciseDto>();
  editable = input<boolean>(true);
  workoutId = input<number>(0);

  selectedSetMenu: number | null;

  setRpes: IEnumProvider[] = [];
  setTypes: IEnumProvider[] = [];

  constructor(
    public modalService: ModalService,
    private providers: Providers,
    private loaderService: LoaderService,
    private workoutService: WorkoutService,

    private setController: SetController,
  ) {
    this.setRpes = this.providers.getSetRpeTypes();
    this.setTypes = this.providers.getSetTypes();
  }

  // events

  onOpenSetEditMenu(setId: number) {
    this.selectedSetMenu = this.selectedSetMenu === setId ? null : setId;
  }

  // methods

  editSet(set: IWorkoutExerciseSetDto, exercise: IWorkoutExerciseDto) {
    if (this.editable()) {
      this.selectedSetMenu = null;
      this.modalService.showEditSetModal(exercise?.sets?.[exercise.sets.findIndex(_ => _.id === set.id) - 1] ?? null, set, exercise);
    }
  }
  deleteSet(id: number) {
    this.loaderService.showPageLoader();

    this.selectedSetMenu = null;
    this.setController.Delete(id).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          console.log(this.workoutId());
          this.workoutService.refreshWorkout(this.workoutId());
        }
      })
      .catch(ex => { throw ex; })
      .finally(() => this.loaderService.hidePageLoader());
  }
  moveSet(set: IWorkoutExerciseSetDto, move: eOrderMove) {
    if (move === eOrderMove.Up) {
      set.order--;
    }
    else if (move === eOrderMove.Down) {
      set.order++;
    }

    this.setController.Save(set).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.workoutService.refreshWorkout(this.workoutId());
        }
      })
      .catch(ex => console.log(ex));
  }

  // helpers

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
}
