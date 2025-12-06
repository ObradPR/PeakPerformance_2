import { TitleCasePipe } from '@angular/common';
import { Component, effect, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import Chart from 'chart.js/auto';
import { ExerciseController } from '../../_generated/services';
import { eExerciseChartData, ExerciseService } from '../../services/exercise.service';
import { ModalService } from '../../services/modal.service';
import { IEnumProvider, IExerciseSearchOptions, IExerciseStatsDto } from '../../_generated/interfaces';
import { eChartTimespan } from '../../_generated/enums';
import { Providers } from '../../_generated/providers';
import { FormsModule } from '@angular/forms';
import { DateTime } from 'luxon';
import { SharedService } from '../../services/shared.service';
import ChartDataLabels from 'chartjs-plugin-datalabels';

@Component({
  selector: 'app-exercise',
  imports: [TitleCasePipe, FormsModule],
  templateUrl: './exercise.html',
  styleUrl: './exercise.css'
})
export class Exercise implements OnDestroy {
  private chart!: Chart;
  chartData: IExerciseStatsDto[] = [];
  private exercisesLookup: Partial<Record<number, Record<string, number>>> = {};


  chartTimespans: IEnumProvider[] = [];
  selectedTimespan: number = eChartTimespan.Last6Months;

  selectedChartData: number = eExerciseChartData.MaxWeight;
  exerciseChartColors: string[] = ["#000080", "#ff8800ff", "#00b300ff", "#c00000ff", "#6529aaff"];

  constructor(
    private router: Router,

    private exerciseController: ExerciseController,

    public modalService: ModalService,
    public exerciseService: ExerciseService,
    private providers: Providers,
    private sharedService: SharedService,
  ) {
    effect(() => {
      this.exerciseService.selectedExerciseForComparisonSignal();
      this.getChartData();
    });

    this.chartTimespans = this.providers.getChartTimespans();
  }

  // events

  onTimespanChange = () => this.getChartData();
  onChartDataChange = () => this.getChartData();

  // methods

  openExerciseReportPage(apiExerciseId: string) {
    this.router.navigateByUrl(`/exercise/${apiExerciseId}`);
  }

  getChartData() {
    this.destroyChart();

    const options = {
      chartTimespanId: this.selectedTimespan,
      apiExerciseIds: this.exerciseService.selectedExerciseForComparisonSignal().map(_ => _.id),
    } as IExerciseSearchOptions;

    this.exerciseController.Search(options).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.chartData = _.data?.data ?? [];

          this.chartInit();
        }
      })
      .catch(ex => { throw ex })
  }

  private getStartDate() {
    let earliestExerciseTimestamp: Date | null = null;

    if (this.chartData && this.chartData.length > 0) {
      earliestExerciseTimestamp = new Date(
        Math.min(...this.chartData.map(_ => new Date(_.logDate).getTime()))
      );
    }

    const earliestDate = this.sharedService.getLocalDate(earliestExerciseTimestamp);
    return DateTime.fromJSDate(earliestDate);
  }

  private chartInit() {
    this.destroyChart();

    const today = DateTime.local().startOf('day');
    const startDate = (this.selectedTimespan !== eChartTimespan.AllTime
      ? today.minus({ months: this.selectedTimespan })
      : this.getStartDate())
      .minus({ days: 7 }); // padding for start of the chart


    const maxEndDate = today.plus({ days: 10 });

    let totalDays = maxEndDate.diff(startDate, 'days').days;
    const allDates: string[] = [];
    for (let i = 0; i <= totalDays; i++) {
      const date = startDate.plus({ days: i });
      allDates.push(date.toFormat('MMM dd yyyy'));
    }

    this.buildExercisesLookup();
    const datasets = this.getDatasets(allDates);

    const values = this.chartData.map(_ => _.total.maxWeight!);

    Chart.register(ChartDataLabels);

    this.chart = new Chart('exercises-line-chart', {
      type: 'line',
      data: {
        labels: allDates,
        datasets: datasets,
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          x: {
            ticks: {
              maxTicksLimit: 30
            }
          },
          y: {
            min: 0,
            max: this.sharedService.roundToNearestTen(Math.round(Math.max(...values) + 20)),
          },
        },
        plugins: {
          legend: {
            display: false,
          },
          datalabels: {
            display: false
          }
        }
      },
      plugins: [ChartDataLabels]
    });

  }

  private getDatasets(allDates: string[]) {
    const map = new Map<number, IExerciseStatsDto[]>();

    for (const e of this.chartData) {
      const id = e.id;
      if (!map.has(id))
        map.set(id, []);

      map.get(id)!.push(e);
    }

    const datasets: any[] = [];

    let i = 0;
    for (const [id, group] of map) {
      const lookup = this.exercisesLookup[id] || {};
      const dataForChart = allDates.map(date => lookup[date] ?? null);

      if (dataForChart.length > 0 && dataForChart.some(_ => _ !== null)) {
        datasets.push({
          label: group[0].name,
          data: dataForChart,
          backgroundColor: this.exerciseChartColors[i],
          borderColor: this.exerciseChartColors[i],
          borderWidth: 2,
          tension: 0.3,
          spanGaps: true
        });

        i++;
      }
    }
    return datasets;
  }


  private buildExercisesLookup() {
    this.exercisesLookup = {} as Partial<Record<number, Record<string, number>>>;

    for (const e of this.chartData) {
      const localDate = this.sharedService.getLocalDate(e.logDate);
      const dateKey = DateTime.fromJSDate(localDate).toFormat('MMM dd yyyy');

      if (!this.exercisesLookup[e.id])
        this.exercisesLookup[e.id] = {};

      this.exercisesLookup[e.id]![dateKey] = e.total.maxWeight!;
    }
  }

  private destroyChart() {
    if (this.chart)
      this.chart.destroy();
  }

  ngOnDestroy(): void {
    this.destroyChart();
  }
}
