import { LowerCasePipe, NgClass, NgStyle, TitleCasePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DateTime } from 'luxon';
import { eSetRpeType, eSetType } from '../../../_generated/enums';
import { IEnumProvider, IWorkoutDto, IWorkoutExerciseDto, IWorkoutExerciseSetDto } from '../../../_generated/interfaces';
import { Providers } from '../../../_generated/providers';
import { ExerciseController, SetController, WorkoutController } from '../../../_generated/services';
import { ClickOutsideDirective } from '../../../directives/click-outside.directive';
import { DurationPipe } from '../../../pipes/duration.pipe';
import { MeasurementConverterPipe } from "../../../pipes/measurement-converter.pipe";
import { AuthService } from '../../../services/auth.service';
import { LoaderService } from '../../../services/loader.service';
import { ModalService } from '../../../services/modal.service';
import { WorkoutTemplate } from "../workout-template/workout-template";


enum eOrderMove {
  Up = 1,
  Down = 2
}

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
    private router: Router,

    public modalService: ModalService,
    private loaderService: LoaderService,
    private providers: Providers,
    private authService: AuthService,

    private workoutController: WorkoutController,
    private exerciseController: ExerciseController,
    private setController: SetController
  ) { }

  ngOnInit(): void {
    this.workout = this.route.snapshot.data['workout']?.data;
  }
}
