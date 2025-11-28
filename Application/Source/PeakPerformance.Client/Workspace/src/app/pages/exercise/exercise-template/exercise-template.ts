import { Component, input, OnInit } from '@angular/core';
import { IEnumProvider, IWorkoutExerciseDto, IWorkoutExerciseSetDto } from '../../../_generated/interfaces';
import { LowerCasePipe, NgStyle, TitleCasePipe } from '@angular/common';
import { ModalService } from '../../../services/modal.service';
import { LoaderService } from '../../../services/loader.service';
import { ExerciseController, SetController } from '../../../_generated/services';
import { Router } from '@angular/router';
import { eSetRpeType, eSetType } from '../../../_generated/enums';
import { MeasurementConverterPipe } from '../../../pipes/measurement-converter.pipe';
import { Providers } from '../../../_generated/providers';


export enum eOrderMove {
  Up = 1,
  Down = 2
}

@Component({
  selector: 'app-exercise-template',
  imports: [TitleCasePipe, MeasurementConverterPipe, NgStyle, LowerCasePipe],
  templateUrl: './exercise-template.html',
  styleUrl: './exercise-template.css'
})
export class ExerciseTemplate implements OnInit {
  exercises = input<IWorkoutExerciseDto[]>([]);
  editable = input<boolean>(true);
  workoutId = input<number>(0);

  selectedExerciseMenu: number | null;
  selectedSetMenu: number | null;

  setRpes: IEnumProvider[] = [];
  setTypes: IEnumProvider[] = [];

  constructor(
    private router: Router,

    public modalService: ModalService,
    private loaderService: LoaderService,
    private providers: Providers,

    private exerciseController: ExerciseController,
    private setController: SetController
  ) { }

  ngOnInit(): void {
    this.setRpes = this.providers.getSetRpeTypes();
    this.setTypes = this.providers.getSetTypes();
  }

  // events

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

  howToExercise(apiExerciseId: string) {
    this.selectedExerciseMenu = null;
    this.modalService.showHowToExerciseModal(apiExerciseId);
  }
  switchExercise(id: number, order: number) {
    this.selectedExerciseMenu = null;
    this.modalService.showExerciseModal(this.workoutId(), order, id);
  }
  deleteExercise(id: number) {
    this.loaderService.showPageLoader();

    this.selectedExerciseMenu = null;
    this.exerciseController.Delete(id).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.router.navigateByUrl('/', { skipLocationChange: true })
            .then(() => this.router.navigateByUrl(`/workouts/${this.workoutId()}`));
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
            .then(() => this.router.navigateByUrl(`/workouts/${this.workoutId()}`));
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
            .then(() => this.router.navigateByUrl(`/workouts/${this.workoutId()}`));
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
            .then(() => this.router.navigateByUrl(`/workouts/${this.workoutId()}`));
        }
      })
      .catch(ex => console.log(ex))
      .finally(() => this.loaderService.hidePageLoader());
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
