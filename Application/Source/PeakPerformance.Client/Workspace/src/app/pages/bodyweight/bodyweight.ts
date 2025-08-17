import { Component } from '@angular/core';
import { ModalService } from '../../services/modal.service';

@Component({
  selector: 'app-bodyweight',
  imports: [],
  templateUrl: './bodyweight.html',
  styleUrl: './bodyweight.css'
})
export class Bodyweight {
  constructor(
    public modalService: ModalService
  ) {
    this.modalService.showAddBodyweightModal();
  }
}
