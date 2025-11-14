import { Component } from '@angular/core';
import { ModalService } from '../../services/modal.service';
import { BodyweightModal } from './bodyweight-modal/bodyweight-modal';
import { BodyweightGoalModal } from './bodyweight-goal-modal/bodyweight-goal-modal';
import { MeasurementModal } from './measurement-modal/measurement-modal';
import { MeasurementGoalModal } from "./measurement-goal-modal/measurement-goal-modal";

@Component({
  selector: 'app-modal',
  imports: [BodyweightModal, BodyweightGoalModal, MeasurementModal, MeasurementGoalModal],
  templateUrl: './modal.html',
  styles: ``
})
export class Modal {
  constructor(public modalService: ModalService) { }
}
