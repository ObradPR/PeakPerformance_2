import { DatePipe } from '@angular/common';
import { AfterViewInit, Component, OnInit, Signal } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IWorkoutDto } from '../../../_generated/interfaces';
import { ModalService } from '../../../services/modal.service';
import { WorkoutService } from '../../../services/workout.service';
import { WorkoutTemplate } from "../workout-template/workout-template";
import { WorkoutController } from '../../../_generated/services';
import { LoaderService } from '../../../services/loader.service';
import Chart from 'chart.js/auto';

enum eOtherWorkoutDirection {
  Previous = 1,
  Next = 2,
}
@Component({
  selector: 'app-workout-single',
  imports: [WorkoutTemplate, DatePipe],
  templateUrl: './workout-single.html',
  styleUrl: './workout-single.css'
})
export class WorkoutSingle implements OnInit, AfterViewInit {
  workout: Signal<IWorkoutDto | null>;
  workoutDate: Date;

  private chart: Chart;

  constructor(
    private route: ActivatedRoute,
    private router: Router,

    public modalService: ModalService,
    private workoutService: WorkoutService,
    private loaderService: LoaderService,

    private workoutController: WorkoutController,
  ) {
    this.workout = this.workoutService.workoutSignal;
  }

  ngOnInit(): void {
    const resolvedWorkout = this.route.snapshot.data['workout']?.data;

    if (resolvedWorkout) {
      this.workoutService.setInitialWorkout(resolvedWorkout);
    }
    this.workoutDate = new Date(this.workout()!.logDate);
  }

  ngAfterViewInit(): void {
    if (this.workout()!.isCompleted)
      this.chartInit();
  }

  // Get

  onGetOtherWorkout(direction: eOtherWorkoutDirection) {
    const workoutId = (direction === eOtherWorkoutDirection.Previous
      ? this.workout()?.previousWorkoutId
      : this.workout()?.nextWorkoutId)
      ?? 0;

    this.router.navigateByUrl('/', { skipLocationChange: true })
      .then(() => this.router.navigateByUrl(`/workouts/${Number(workoutId)}`));
  }

  // Update

  updateStatus() {
    this.loaderService.showPageLoader();

    this.workoutController.UpdateCompleteStatus(this.workout()!.id).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.workoutService.refreshWorkout(this.workout()!.id);
        }
      })
      .finally(() => this.loaderService.hidePageLoader());
  }

  // private

  private chartInit() {
    if (this.chart)
      this.chart.destroy();

    this.chart = new Chart('workout-radar-chart', {
      type: 'radar',
      data: {
        labels: this.workout()!.muscleGroupsTotalVolume.map(_ => _.name),
        datasets: [{
          label: 'Volume',
          data: this.workout()!.muscleGroupsTotalVolume.map(_ => _.volume ? _.volume : 0),
          fill: true,
          backgroundColor: 'rgba(13, 110, 253, 0.08)',
          borderColor: 'rgb(13, 110, 253)',
          pointBackgroundColor: 'rgb(13, 110, 253)',
          pointBorderColor: '#fff',
          pointHoverBackgroundColor: '#fff',
          pointHoverBorderColor: 'rgb(13, 110, 253)',
        }]
      },
      options: {
        elements: {
          line: {
            borderWidth: 3
          }
        },
        plugins: {
          legend: {
            display: true,
            position: 'bottom'
          }
        },
        scales: {
          r: {
            ticks: {
              display: false
            },
          }
        }
      }
    })
  }
}
