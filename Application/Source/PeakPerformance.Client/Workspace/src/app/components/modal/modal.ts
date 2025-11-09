import { Component } from '@angular/core';
import { ModalService } from '../../services/modal.service';
import { BodyweightModal } from './bodyweight-modal/bodyweight-modal';
import { BodyweightGoalModal } from './bodyweight-goal-modal/bodyweight-goal-modal';

@Component({
  selector: 'app-modal',
  imports: [BodyweightModal, BodyweightGoalModal],
  templateUrl: './modal.html',
  styles: ``
})
export class Modal {
  constructor(public modalService: ModalService) { }
}
