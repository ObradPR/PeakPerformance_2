import { Component } from '@angular/core';
import { ModalService } from '../../services/modal.service';
import { ExerciseService } from '../../services/exercise.service';
import { TitleCasePipe } from '@angular/common';
import { Router } from '@angular/router';

@Component({
  selector: 'app-exercise',
  imports: [TitleCasePipe],
  templateUrl: './exercise.html',
  styleUrl: './exercise.css'
})
export class Exercise {
  constructor(
    private router: Router,

    public modalService: ModalService,
    public exerciseService: ExerciseService
  ) { }

  openExerciseReportPage(apiExerciseId: string) {
    this.router.navigateByUrl(`/exercise/${apiExerciseId}`);
  }
}
