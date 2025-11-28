import { TitleCasePipe } from '@angular/common';
import { Component, input } from '@angular/core';
import { Router } from '@angular/router';
import { IWorkoutExerciseDto } from '../../../_generated/interfaces';
import { ExerciseController } from '../../../_generated/services';
import { ClickOutsideDirective } from '../../../directives/click-outside.directive';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';
import { SetsTemplate } from "../../set/sets-template/sets-template";


export enum eOrderMove {
  Up = 1,
  Down = 2
}

@Component({
  selector: 'app-exercises-template',
  imports: [TitleCasePipe, SetsTemplate, ClickOutsideDirective],
  templateUrl: './exercises-template.html',
  styleUrl: './exercises-template.css'
})
export class ExercisesTemplate {
  exercises = input<IWorkoutExerciseDto[]>([]);
  editable = input<boolean>(true);
  workoutId = input<number>(0);

  selectedExerciseMenu: number | null;

  constructor(
    private router: Router,

    public modalService: ModalService,
    private loaderService: LoaderService,

    private exerciseController: ExerciseController,
  ) { }

  // events

  onOpenExerciseEditMenu(idx: number) {
    if (this.selectedExerciseMenu === idx)
      this.selectedExerciseMenu = null;
    else
      this.selectedExerciseMenu = idx;
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
}
