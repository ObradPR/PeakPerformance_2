import { NgStyle, TitleCasePipe } from '@angular/common';
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
  imports: [TitleCasePipe, FormsModule, NgStyle],
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
  exerciseChartColors: string[] = ["#000080", "#ff8800ff", "#00b300ff", "#c00000ff", "#b17cecff"];

  dataDatasets: any[] = [];
  savedVisibility: Partial<Record<number, boolean>> = {};

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
  onChartDataChange = () => this.chartInit();

  toggleDataset(index: number) {
    const ds = this.chart.data.datasets[index];
    const exerciseId = this.dataDatasets[index].exerciseId;

    const newHidden = !ds.hidden;

    // 1. Toggle the exercises dataset visually
    ds.hidden = newHidden;
    this.dataDatasets[index].visible = !newHidden;

    // Update saved visibility immediately
    this.savedVisibility[exerciseId] = !newHidden;

    this.chart.update();
  }

  // methods

  openExerciseReportPage(apiExerciseId: string) {
    this.router.navigateByUrl(`/exercises/${apiExerciseId}`);
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

    const values = this.chartData.map(_ => this.getValueForChart(_)).filter(_ => _ !== null);;

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
            max: this.sharedService.roundToNearestTen(Math.round(Math.max(...values) + (this.selectedChartData === eExerciseChartData.Volume ? 500 : 20))),
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

    this.dataDatasets = [];

    let i = 0;
    for (const [id, group] of map) {
      const lookup = this.exercisesLookup[id] || {};
      const dataForChart = allDates.map(date => lookup[date] ?? null);

      if (dataForChart.length > 0 && dataForChart.some(_ => _ !== null)) {
        this.dataDatasets.push({
          label: group[0].name,
          data: dataForChart,
          backgroundColor: this.exerciseChartColors[i],
          borderColor: this.exerciseChartColors[i],
          borderWidth: 2,
          tension: 0.3,
          spanGaps: true,
          hidden: !(this.savedVisibility?.[id] ?? true),
          visible: this.savedVisibility?.[id] ?? true, // <-- for legend UI
          exerciseId: id
        });
      }
      i++;
    }
    return this.dataDatasets;
  }


  private buildExercisesLookup() {
    this.exercisesLookup = {} as Partial<Record<number, Record<string, number>>>;

    for (const e of this.chartData) {
      const localDate = this.sharedService.getLocalDate(e.logDate);
      const dateKey = DateTime.fromJSDate(localDate).toFormat('MMM dd yyyy');

      if (!this.exercisesLookup[e.id])
        this.exercisesLookup[e.id] = {};

      if (e.isStrength && this.exerciseService.allowedForStrength.includes(this.selectedChartData)) {
        this.exercisesLookup[e.id]![dateKey] = this.getValue(e);
        continue;
      }

      if (e.isBodyweight && this.exerciseService.allowedForBodyweight.includes(this.selectedChartData)) {
        this.exercisesLookup[e.id]![dateKey] = this.getValue(e);
        continue;
      }

      if (e.isCardio && this.exerciseService.allowedForCardio.includes(this.selectedChartData)) {
        this.exercisesLookup[e.id]![dateKey] = this.getValue(e);
        continue;
      }
    }
  }

  private getValue(e: IExerciseStatsDto): number {
    switch (this.selectedChartData) {
      case eExerciseChartData.OneRepMax:
        return e.total.oneRepMax!;
      case eExerciseChartData.MaxWeight:
        return e.total.maxWeight!;
      case eExerciseChartData.TotalReps:
        return e.total.totalReps!;
      case eExerciseChartData.MaxReps:
        return e.total.maxReps!;
      case eExerciseChartData.Volume:
        return e.total.volume!;
      case eExerciseChartData.TotalCardioTime:
        return e.total.totalCardioTime!
      default:
        return 0;
    }
  }

  private getValueForChart(e: IExerciseStatsDto): number | null {
    switch (this.selectedChartData) {
      case eExerciseChartData.OneRepMax:
        return e.total.oneRepMax ?? null;

      case eExerciseChartData.MaxWeight:
        return e.total.maxWeight ?? null;

      case eExerciseChartData.TotalReps:
        return e.total.totalReps ?? null;

      case eExerciseChartData.MaxReps:
        return e.total.maxReps ?? null;

      case eExerciseChartData.Volume:
        return e.total.volume ?? null;

      case eExerciseChartData.TotalCardioTime:
        return e.total.totalCardioTime ?? null;

      default:
        return null;
    }
  }

  private destroyChart() {
    if (this.chart)
      this.chart.destroy();
  }

  getTransparentColor(hex: string): string {
    if (!hex.startsWith('#')) return hex;

    const r = parseInt(hex.slice(1, 3), 16);
    const g = parseInt(hex.slice(3, 5), 16);
    const b = parseInt(hex.slice(5, 7), 16);

    return `rgba(${r}, ${g}, ${b}, 0.2)`;
  }

  ngOnDestroy(): void {
    this.destroyChart();
  }
}
