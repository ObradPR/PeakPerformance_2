import { Component, effect, OnDestroy } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import Chart from 'chart.js/auto';
import ChartDataLabels from 'chartjs-plugin-datalabels';
import { DateTime } from 'luxon';
import { eChartTimespan } from '../../../_generated/enums';
import { IEnumProvider, IExerciseDto, IExerciseGoalDto, IExerciseGoalSearchOptions, IExerciseSearchOptions, IExerciseStatsDto, IPagingResult, ISortingOptions } from '../../../_generated/interfaces';
import { Providers } from '../../../_generated/providers';
import { ExerciseController, ExerciseGoalController } from '../../../_generated/services';
import { ShortInfoStats } from "../../../components/short-info-stats/short-info-stats";
import { MeasurementConverterPipe } from '../../../pipes/measurement-converter.pipe';
import { AuthService } from '../../../services/auth.service';
import { eExerciseChartData, ExerciseService } from '../../../services/exercise.service';
import { ModalService } from '../../../services/modal.service';
import { QService } from '../../../services/q.service';
import { SharedService } from '../../../services/shared.service';
import { NgClass } from '@angular/common';
import { UtcToLocalPipe } from '../../../pipes/utc-to-local.pipe';
import { Paginator, PaginatorState } from 'primeng/paginator';
import { ClickOutsideDirective } from '../../../directives/click-outside.directive';


@Component({
  selector: 'app-exercise-single',
  imports: [ShortInfoStats, FormsModule, NgClass, UtcToLocalPipe, MeasurementConverterPipe, Paginator, ClickOutsideDirective],
  templateUrl: './exercise-single.html',
  styleUrl: './exercise-single.css'
})
export class ExerciseSingle implements OnDestroy {
  private chart!: Chart;
  exerciseData: IExerciseStatsDto[] = [];
  goalData: IExerciseGoalDto[] = [];
  exerciseId: number = 0;
  exerciseInfo: IExerciseDto | null = null;

  chartTimespans: IEnumProvider[] = [];
  selectedTimespan: number = eChartTimespan.Last6Months;
  selectedChartData: number = eExerciseChartData.MaxWeight;

  userId: number = 0;
  isCurrentUser: boolean = false;

  goalsFirst = 0;
  rows = 5;

  paginatedGoalsData: IPagingResult<IExerciseGoalDto> = {
    data: [],
    total: 0
  } as IPagingResult<IExerciseGoalDto>;

  selectedGoalMenu: number | null;

  constructor(
    private route: ActivatedRoute,

    private exerciseController: ExerciseController,
    private exerciseGoalController: ExerciseGoalController,

    private $q: QService,
    private providers: Providers,
    public modalService: ModalService,
    private sharedService: SharedService,
    public exerciseService: ExerciseService,
    private authService: AuthService,

    private measurementConverterPipe: MeasurementConverterPipe,
  ) {
    this.exerciseId = parseInt(this.route.snapshot.paramMap.get('id') ?? '0') ?? 0;

    this.userId = parseInt(this.route.snapshot.paramMap.get('userId') ?? '0') ?? 0;

    if (this.userId !== this.authService.currentUserSource()?.id) {
      this.isCurrentUser = false;
    }
    else {
      this.isCurrentUser = true;
    }

    effect(() => {
      this.exerciseService.exerciseChartSignal();
      this.getChartData();
      this.getPaginatedGoals(this.goalsFirst, this.rows);
    }, { allowSignalWrites: true })

    this.chartTimespans = this.providers.getChartTimespans();
  }

  // events

  onTimespanChange = () => this.getChartData();
  onChartDataChange = () => this.chartInit();
   onPageChange(event: PaginatorState) {
    this.goalsFirst = event.first ?? this.goalsFirst;
    this.rows = event.rows ?? this.rows;
    this.getPaginatedGoals(this.goalsFirst, this.rows);
  }
  onOpenEditMenu(idx: number) {
    this.selectedGoalMenu = null;

    if (this.selectedGoalMenu === idx)
      this.selectedGoalMenu = null;
    else
      this.selectedGoalMenu = idx;
  }

  // methods

  editExerciseGoal(data: IExerciseGoalDto) {
    this.selectedGoalMenu = null;
    this.modalService.showEditExerciseGoalModal(data);
  }
  deleteExerciseGoal(id: number) {
    this.selectedGoalMenu = null;
    this.exerciseGoalController.Delete(id).toPromise()
      .then(_ => this.exerciseService.triggerExerciseChart())
      .catch(ex => { throw ex; })
  }

  getPaginatedGoals(skip: number, take: number) {
    const options = {
      exerciseId: this.exerciseId,
      userId: this.userId,
      skip: skip,
      take: take,
      sortingOptions: [{field: 'EndDate', dir: 'desc'}] as ISortingOptions[]
    } as IExerciseGoalSearchOptions ;

    this.exerciseGoalController.Search(options).toPromise()
      .then(_ => {
        if (_?.data !== null) {
          this.paginatedGoalsData = _?.data!;
        }
      })
      .catch(ex => { throw ex; });
  }

  getChartData() {
    this.destroyChart();

    const options = {
      chartTimespanId: this.selectedTimespan,
      exerciseIds: [this.exerciseId],
      userId: this.userId,
    } as IExerciseSearchOptions;

    const goalOptions = {
      chartTimespanId: this.selectedTimespan,
      exerciseId: this.exerciseId,
      userId: this.userId,
    } as IExerciseGoalSearchOptions ;

    this.$q.all([
      this.exerciseController.Search(options).toPromise(),
      this.exerciseGoalController.Search(goalOptions).toPromise(),
      this.exerciseController.GetSingle(this.exerciseId).toPromise(),
    ])
      .then(result => {
        if (result[0] !== null)
          this.exerciseData = result[0]?.data?.data ?? [];

        if (result[1] !== null)
          this.goalData = result[1]?.data?.data ?? [];

        if (result[2] !== null)
          this.exerciseInfo = result[2]?.data;

        this.chartInit();
      });
  }

  private getStartDate() {
    let earliestExerciseTimestamp: Date | null = null;

    if (this.exerciseData && this.exerciseData.length > 0) {
      earliestExerciseTimestamp = new Date(
        Math.min(...this.exerciseData.map(_ => new Date(_.logDate!).getTime()))
      );
    }

    let earliestExerciseGoalTimestamp: Date | null = null;

    if (this.goalData?.length) {
      earliestExerciseGoalTimestamp = new Date(
        Math.min(...this.goalData.map(_ => new Date(_.startDate!).getTime()))
      );
    }

    const earliestDate = this.sharedService.getLocalDate(
      earliestExerciseTimestamp && earliestExerciseGoalTimestamp
        ? earliestExerciseTimestamp < earliestExerciseGoalTimestamp
          ? earliestExerciseTimestamp
          : earliestExerciseGoalTimestamp
        : earliestExerciseTimestamp !== null
          ? earliestExerciseTimestamp
          : earliestExerciseGoalTimestamp !== null
            ? earliestExerciseGoalTimestamp
            : null
    );
    return DateTime.fromJSDate(earliestDate);
  }

  private chartInit() {
    this.destroyChart();

    const today = DateTime.local().startOf('day');
    const startDate = (this.selectedTimespan !== eChartTimespan.AllTime
      ? today.minus({ months: this.selectedTimespan })
      : this.getStartDate())
      .minus({ days: 7 }); // padding for start of the chart


    let maxGoalEndDate = today;

    if (this.goalData?.length) {
      const maxGoalEndDateTimespan = new Date(
        Math.max(...this.goalData.map(_ => new Date(_.endDate).getTime()))
      );
      const maxGoalEndDateLocal = this.sharedService.getLocalDate(maxGoalEndDateTimespan);
      maxGoalEndDate = DateTime.fromJSDate(maxGoalEndDateLocal) as DateTime<true>;
    }

    const maxEndDate = (maxGoalEndDate > today
      ? maxGoalEndDate
      : today)
      .plus({ days: 10 });

    let totalDays = maxEndDate.diff(startDate, 'days').days;
    const allDates: string[] = [];
    for (let i = 0; i <= totalDays; i++) {
      const date = startDate.plus({ days: i });
      allDates.push(date.toFormat('MMM dd yyyy'));
    }

    // build datasets

    const dataForChart: (number | null)[] = allDates.map(date => {
      const log = this.exerciseData.find(_ => {
        const localDate = this.sharedService.getLocalDate(_.logDate);
        return DateTime.fromJSDate(localDate).toFormat('MMM dd yyyy') === date;
      });

      let data = null;

      data = log
        ? this.getValue(log)
        : null;

      return data;
    });

    // MAP GOALS

    const goalDatasets: any[] = [];
    const goalValues: number[] = [];

    if (this.goalData?.length) {
      const maxGoalEntry = this.goalData
        .reduce((max, current) => (current.weight! > max.weight! ? current : max), this.goalData[0]);

      const maxGoalWeight = parseFloat(this.measurementConverterPipe.transform(maxGoalEntry.weight, maxGoalEntry.weightUnitId));
      goalValues.push(maxGoalWeight);

      this.goalData.forEach((goal, idx) => {
        let goalData: (number | null)[] = new Array(allDates.length).fill(null);

        // End date
        const goalEndDate = DateTime.fromJSDate(new Date(goal.endDate)).toFormat('MMM dd yyyy');
        const endIdx = allDates.indexOf(goalEndDate);
        if (endIdx !== -1) goalData[endIdx] = parseFloat(this.measurementConverterPipe.transform(goal.weight!, goal.weightUnitId));

        // Start date
        let goalStartWeight: number | null = null;
        const goalStartDate = DateTime.fromJSDate(new Date(goal.startDate)).toFormat('MMM dd yyyy');
        const startIdx = allDates.indexOf(goalStartDate);

        if (startIdx !== -1) {
          const log = this.exerciseData.find(log =>
            DateTime.fromJSDate(this.sharedService.getLocalDate(log.logDate)).toFormat('MMM dd yyyy') === goalStartDate
          );
          goalStartWeight = log
            ? log.total.maxWeight!
            : null; // setting a start of the goal to weight at that time
        }

        if (!goalStartWeight) {
          // <
          const closestLog = [...this.exerciseData]
            .filter(log => this.sharedService.getLocalDate(log.logDate) < this.sharedService.getLocalDate(goal.startDate))
            .sort((a, b) =>
              DateTime.fromJSDate(this.sharedService.getLocalDate(b.logDate))
                .diff(DateTime.fromJSDate(this.sharedService.getLocalDate(a.logDate)), 'milliseconds')
                .milliseconds
            )[0];
          goalStartWeight = closestLog
            ? closestLog.total.maxWeight!
            : null; // setting a start of the goal to closest weight at that time

          if (!goalStartWeight) {
            // >
            const closestLog = [...this.exerciseData]
              .filter(log => this.sharedService.getLocalDate(log.logDate) > this.sharedService.getLocalDate(goal.startDate))
              .sort((a, b) =>
                DateTime.fromJSDate(this.sharedService.getLocalDate(a.logDate))
                  .diff(DateTime.fromJSDate(this.sharedService.getLocalDate(b.logDate)), 'milliseconds')
                  .milliseconds
              )[0];


            goalStartWeight = closestLog
              ? closestLog.total.maxWeight!
              : null;
          }
        }

        if (startIdx !== -1 && goalStartWeight !== null) {
          goalData[startIdx] = goalStartWeight;
        }

        // Push a separate dataset for each goal
        goalDatasets.push({
          label: `Goal ${idx + 1}`,
          data: goalData,
          backgroundColor: 'rgba(255, 0, 0, 1)',
          borderColor: 'rgba(255, 0, 0, 1)',
          borderWidth: 2,
          borderDash: [10, 5],
          fill: false,
          tension: 0.3,
          spanGaps: true,
        });
      });
    }

    // max/min

    const values = this.exerciseData.map(_ => this.getValueForChart(_)).filter(_ => _ !== null);;

    Chart.register(ChartDataLabels);

    this.chart = new Chart('exercises-line-chart', {
      type: 'line',
      data: {
        labels: allDates,
        datasets: [
          {
            label: this.exerciseData?.[0]?.name ?? 'Exercise',
            data: dataForChart,
            backgroundColor: 'rgba(0, 123, 255, 1)',
            borderColor: 'rgba(0, 123, 255, 1)',
            borderWidth: 2,
            tension: 0.3,
            spanGaps: true,
          },
          ...goalDatasets.map((dataset, idx) => ({
            ...dataset,
            datalabels: {
              display: true,
              align: 'top',
              anchor: 'end',
              formatter: (value: any, ctx: any) => {
                if (value === null) return '';

                const dataIdx = ctx.dataIndex;
                const firstIdx = dataset.data.findIndex((_: any) => _ !== null);
                const lastIdx = dataset.data.lastIndexOf(value);

                if (dataIdx === firstIdx)
                  return `Start`;
                else if (dataIdx === lastIdx)
                  return `Goal ${idx + 1}`

                return '';
              },
              color: 'rgba(255, 0, 0, 1)',
              font: {
                weight: 'bold',
                size: 12
              }
            }
          })),
        ],
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
            max: this.sharedService.roundToNearestTen(Math.round(Math.max(...values, ...goalValues) + (this.selectedChartData === eExerciseChartData.Volume ? 500 : 20))),
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

  ngOnDestroy(): void {
    this.destroyChart();
  }
}