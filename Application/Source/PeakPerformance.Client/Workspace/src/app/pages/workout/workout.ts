import { Component } from '@angular/core';
import { ModalService } from '../../services/modal.service';

@Component({
  selector: 'app-workout',
  imports: [],
  templateUrl: './workout.html',
  styleUrl: './workout.css'
})
export class Workout {
  constructor(
    public modalService: ModalService
  ) { }
}
