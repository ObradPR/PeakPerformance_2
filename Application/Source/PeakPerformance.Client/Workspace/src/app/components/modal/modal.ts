import { Component } from '@angular/core';
import { ModalService } from '../../services/modal.service';
import { BodyweightModal } from './bodyweight-modal/bodyweight-modal';

@Component({
  selector: 'app-modal',
  imports: [BodyweightModal],
  templateUrl: './modal.html',
  styles: ``
})
export class Modal {
  constructor(public modalService: ModalService) { }
}
