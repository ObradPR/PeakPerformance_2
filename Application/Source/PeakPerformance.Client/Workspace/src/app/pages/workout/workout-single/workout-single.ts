import { Component, importProvidersFrom, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { IWorkoutDto } from '../../../_generated/interfaces';

@Component({
  selector: 'app-workout-single',
  imports: [],
  templateUrl: './workout-single.html',
  styleUrl: './workout-single.css'
})
export class WorkoutSingle implements OnInit {
  constructor(private route: ActivatedRoute) { }

  workout: IWorkoutDto;

  ngOnInit(): void {
    this.workout = this.route.snapshot.data['workout']?.data;
    console.log(this.workout);
  }
}
