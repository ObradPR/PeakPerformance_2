import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { IWorkoutDto } from '../../../_generated/interfaces';
import { ModalService } from '../../../services/modal.service';
import { WorkoutTemplate } from "../workout-template/workout-template";

@Component({
  selector: 'app-workout-single',
  imports: [WorkoutTemplate],
  templateUrl: './workout-single.html',
  styleUrl: './workout-single.css'
})
export class WorkoutSingle implements OnInit {
  workout: IWorkoutDto;

  constructor(
    private route: ActivatedRoute,

    public modalService: ModalService,
  ) { }

  ngOnInit(): void {
    this.workout = this.route.snapshot.data['workout']?.data;
  }
}
