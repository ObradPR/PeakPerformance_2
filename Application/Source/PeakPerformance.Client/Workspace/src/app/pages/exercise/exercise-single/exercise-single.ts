import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IExerciseDbApiDataDto, IExerciseStatsDto } from '../../../_generated/interfaces';
import { LoaderService } from '../../../services/loader.service';
import { ShortInfoStats } from "../../../components/short-info-stats/short-info-stats";
import { ModalService } from '../../../services/modal.service';

@Component({
  selector: 'app-exercise-single',
  imports: [ShortInfoStats],
  templateUrl: './exercise-single.html',
  styleUrl: './exercise-single.css'
})
export class ExerciseSingle {
  exercise: IExerciseStatsDto;
  // apiExerciseData: IExerciseDbApiDataDto;

  constructor(
    private route: ActivatedRoute,
    // private router: Router,
    // private http: HttpClient,

    public modalService: ModalService,
    // private loaderService: LoaderService,
  ) {
    // this.loaderService.showPageLoader();

    this.exercise = this.route.snapshot.data['exercise']?.data;
    // const apiExerciseId = this.route.snapshot.paramMap.get('apiExerciseId');

    // this.http.get<any>(`https://www.exercisedb.dev/api/v1/exercises/${apiExerciseId}`).toPromise()
    //   .then((res: any) => {
    //     if (res.success) {
    //       this.apiExerciseData = res.data;
    //       console.log(this.apiExerciseData);
    //     }
    //   })
    //   .catch(ex => {
    //     this.apiExerciseData = {} as IExerciseDbApiDataDto;
    //     this.router.navigateByUrl('/exercises');
    //   })
    //   .finally(() => this.loaderService.hidePageLoader());
  }
}