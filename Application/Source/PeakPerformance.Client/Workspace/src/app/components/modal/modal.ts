import { Component } from '@angular/core';
import { ModalService } from '../../services/modal.service';
import { BodyweightGoalModal } from './bodyweight-goal-modal/bodyweight-goal-modal';
import { BodyweightModal } from './bodyweight-modal/bodyweight-modal';
import { ExerciseModal } from "./exercise-modal/exercise-modal";
import { HowToExerciseModal } from "./how-to-exercise-modal/how-to-exercise-modal";
import { MeasurementGoalModal } from "./measurement-goal-modal/measurement-goal-modal";
import { MeasurementModal } from './measurement-modal/measurement-modal';
import { NotesModal } from "./notes-modal/notes-modal";
import { SetModal } from "./set-modal/set-modal";
import { WorkoutModal } from "./workout-modal/workout-modal";

@Component({
  selector: 'app-modal',
  imports: [BodyweightModal, BodyweightGoalModal, MeasurementModal, MeasurementGoalModal, WorkoutModal, ExerciseModal, NotesModal, HowToExerciseModal, SetModal],
  templateUrl: './modal.html',
  styles: ``
})
export class Modal {
  constructor(public modalService: ModalService) { }
}
