import { CommonModule } from '@angular/common';
import { Component, effect, OnDestroy, OnInit } from '@angular/core';
import { Chart } from 'chart.js/auto';
import { Paginator, PaginatorState } from 'primeng/paginator';
import { eChartTimespan, eMeasurementUnit } from '../../_generated/enums';
import { IBodyweightDto, IBodyweightGoalDto, IBodyweightGoalSearchOptions, IBodyweightSearchOptions, ICurrentBodyInfoDto, IEnumProvider, IPagingResult, ISortingOptions } from '../../_generated/interfaces';
import { BodyweightController, BodyweightGoalController } from '../../_generated/services';
import { ClickOutsideDirective } from '../../directives/click-outside.directive';
import { MeasurementConverterPipe } from '../../pipes/measurement-converter.pipe';
import { UtcToLocalPipe } from '../../pipes/utc-to-local.pipe';
import { BodyweightService } from '../../services/bodyweight.service';
import { ModalService } from '../../services/modal.service';
import { Providers } from '../../_generated/providers';
import { QService } from '../../services/q.service';
import { DateTime } from 'luxon';
import { SharedService } from '../../services/shared.service';
import ChartDataLabels from 'chartjs-plugin-datalabels';
import { FormsModule } from '@angular/forms';

enum eChartTarget {
  Bodyweight = 1,
  BodyFatPercentage = 2,
}
enum eBodyweightInfoTab {
  Bodyweights = 0,
  Goals = 1,
}

@Component({
  selector: 'app-bodyweight',
  imports: [CommonModule, UtcToLocalPipe, MeasurementConverterPipe, ClickOutsideDirective, Paginator, FormsModule],
  templateUrl: './bodyweight.html',
  styleUrl: './bodyweight.css'
})
export class Bodyweight implements OnDestroy {
  private chart!: Chart;
  bodyweights?: IPagingResult<IBodyweightDto>;
  bodyweightsChart: IPagingResult<IBodyweightDto>;
  bodyweightGoals?: IPagingResult<IBodyweightGoalDto>;
  bodyweightGoalsChart: IPagingResult<IBodyweightGoalDto>;


  chartTimespans: IEnumProvider[] = [];
  selectedTimespan: number = eChartTimespan.Last3Months;
  // chartTargets: IEnumProvider[] = [
  //   {
  //     id: eChartTarget.Bodyweight,
  //     description: 'Bodyweight',
  //     name: ''
  //   },
  //   {
  //     id: eChartTarget.BodyFatPercentage,
  //     description: 'Body Fat',
  //     name: ''
  //   }
  // ]

  currentBodyweight: ICurrentBodyInfoDto | null = null;

  selectedTab: number = 0;
  tabs = [
    {
      label: 'Bodyweights',
      iconClass: 'fa-solid fa-weight-scale',
    },
    {
      label: 'Goals',
      iconClass: 'fa-solid fa-chart-line',
    }
  ];

  bodyweightsFirst = 0;
  bodyweightGoalsFirst = 0;
  rows = 7;

  selectedBodyweightMenu: number | null;
  selectedBodyweightGoalMenu: number | null;

  constructor(
    public modalService: ModalService,
    private bodyweightService: BodyweightService,
    private referenceService: Providers,
    private $q: QService,
    private sharedService: SharedService,

    private bodyweightController: BodyweightController,
    private bodyweightGoalController: BodyweightGoalController,

    private measurementConverterPipe: MeasurementConverterPipe
  ) {
    effect(() => {
      this.bodyweightService.bodyweightsSignal();
      this.getBodyweights();
      this.getBodyweightGoals();
    }, { allowSignalWrites: true });

    this.chartTimespans = this.referenceService.getChartTimespans();
  }

  // events

  onSelectTab = (idx: number) => this.selectedTab = idx;
  onTimespanChange = () => this.getBodyweightsAndGoalsChart();
  onPageChange(event: PaginatorState) {
    if (this.selectedTab === eBodyweightInfoTab.Bodyweights) {
      this.bodyweightsFirst = event.first ?? this.bodyweightsFirst;
      this.rows = event.rows ?? this.rows;
      this.getPaginatedBodyweights(this.bodyweightsFirst, this.rows);
    }
    else if (this.selectedTab === eBodyweightInfoTab.Goals) {
      this.bodyweightGoalsFirst = event.first ?? this.bodyweightGoalsFirst;
      this.rows = event.rows ?? this.rows;
      this.getPaginatedBodyweightGoals(this.bodyweightGoalsFirst, this.rows);
    }
  }
  onOpenEditMenu(idx: number) {
    if (this.selectedTab === eBodyweightInfoTab.Bodyweights) {
      this.selectedBodyweightGoalMenu = null;

      if (this.selectedBodyweightMenu === idx)
        this.selectedBodyweightMenu = null;
      else
        this.selectedBodyweightMenu = idx;
    }
    else if (this.selectedTab === eBodyweightInfoTab.Goals) {
      this.selectedBodyweightMenu = null;

      if (this.selectedBodyweightGoalMenu === idx)
        this.selectedBodyweightGoalMenu = null;
      else
        this.selectedBodyweightGoalMenu = idx;
    }
  }

  // methods

  editBodyweight(data: IBodyweightDto) {
    this.selectedBodyweightMenu = null;
    this.modalService.showEditBodyweightModal(data);
  }
  deleteBodyweight(id: number) {
    this.selectedBodyweightMenu = null;
    this.bodyweightController.Delete(id).toPromise()
      .then(_ => this.bodyweightService.triggerBodyweights())
      .catch(ex => { throw ex; })
  }

  editBodyweightGoal(data: IBodyweightGoalDto) {
    this.selectedBodyweightGoalMenu = null;
    this.modalService.showEditBodyweightGoalModal(data);
  }
  deleteBodyweightGoal(id: number) {
    this.selectedBodyweightGoalMenu = null;
    this.bodyweightGoalController.Delete(id).toPromise()
      .then(_ => this.bodyweightService.triggerBodyweights())
      .catch(ex => { throw ex; })
  }

  // private

  private getBodyweightGoals() {
    this.getPaginatedBodyweightGoals(this.bodyweightGoalsFirst, this.rows);
  }

  private getPaginatedBodyweightGoals(skip: number, take: number) {
    const options = {} as IBodyweightGoalSearchOptions;
    options.take = take;
    options.skip = skip;
    options.sortingOptions = [{ field: 'EndDate', dir: 'desc' }] as ISortingOptions[];

    this.bodyweightGoalController.Search(options).toPromise()
      .then(_ => {
        if (_?.data !== null) {
          this.bodyweightGoals = _?.data;
        }
      })
      .catch(ex => { throw ex; });
  }

  private getBodyweights() {
    this.getBodyweightsAndGoalsChart();
    this.getPaginatedBodyweights(this.bodyweightsFirst, this.rows);
    this.infoInit();
  }

  private getPaginatedBodyweights(skip: number, take: number) {
    const options = {} as IBodyweightSearchOptions;
    options.take = take;
    options.skip = skip;
    options.sortingOptions = [{ field: 'LogDate', dir: 'desc' }] as ISortingOptions[];

    this.bodyweightController.Search(options).toPromise()
      .then(_ => {
        if (_?.data !== null) {
          this.bodyweights = _?.data;
        }
      })
      .catch(ex => { throw ex; });
  }

  private getBodyweightsAndGoalsChart() {
    this.destroyChart();

    const options = {} as IBodyweightSearchOptions;
    options.chartTimespanId = this.selectedTimespan;

    const goalOptions = {} as IBodyweightGoalSearchOptions;
    goalOptions.chartTimespanId = this.selectedTimespan;

    this.$q.all([
      this.bodyweightController.Search(options).toPromise(),
      this.bodyweightGoalController.Search(goalOptions).toPromise()
    ])
      .then(result => {
        if (result[0] !== null) {
          this.bodyweightsChart = result[0].data;
        }
        if (result[1] !== null) {
          this.bodyweightGoalsChart = result[1].data;
        }

        this.chartInit();
      })
  }

  private getStartDate() {
    let earliestBodyweightTimestamp: Date | null = null;

    if (this.bodyweightsChart?.data && this.bodyweightsChart.data.length > 0) {
      earliestBodyweightTimestamp = new Date(
        Math.min(...this.bodyweightsChart.data.map(_ => new Date(_.logDate!).getTime()))
      );
    }

    let earliestBodyweightGoalTimestamp: Date | null = null;

    if (this.bodyweightGoalsChart?.data && this.bodyweightGoalsChart.data.length > 0) {
      earliestBodyweightGoalTimestamp = new Date(
        Math.min(...this.bodyweightGoalsChart.data.map(_ => new Date(_.startDate!).getTime()))
      );
    }

    const earliestDate = this.sharedService.getLocalDate(
      earliestBodyweightTimestamp && earliestBodyweightGoalTimestamp
        ? earliestBodyweightTimestamp < earliestBodyweightGoalTimestamp
          ? earliestBodyweightTimestamp
          : earliestBodyweightGoalTimestamp
        : earliestBodyweightTimestamp !== null
          ? earliestBodyweightTimestamp
          : earliestBodyweightGoalTimestamp !== null
            ? earliestBodyweightGoalTimestamp
            : null
    );
    return DateTime.fromJSDate(earliestDate);
  }

  private chartInit() {
    if (this.chart)
      this.destroyChart();

    const today = DateTime.local().startOf('day');
    const startDate = (this.selectedTimespan !== eChartTimespan.AllTime
      ? today.minus({ months: this.selectedTimespan })
      : this.getStartDate())
      .minus({ days: 7 }); // padding for start of the chart

    let maxGoalEndDate = today;

    if (this.bodyweightGoalsChart?.data?.length) {
      const maxGoalEndDateTimespan = new Date(
        Math.max(...this.bodyweightGoalsChart.data.map(_ => new Date(_.endDate).getTime()))
      );
      const maxGoalEndDateLocal = this.sharedService.getLocalDate(maxGoalEndDateTimespan);
      maxGoalEndDate = DateTime.fromJSDate(maxGoalEndDateLocal) as DateTime<true>;
    }

    maxGoalEndDate = maxGoalEndDate.plus({ days: 10 }); // padding for end of the chart
    let totalDays = maxGoalEndDate.diff(startDate, 'days').days;
    const allDates: string[] = [];
    for (let i = 0; i <= totalDays; i++) {
      const date = startDate.plus({ days: i });
      allDates.push(date.toFormat('MMM dd yyyy'));
    }

    const dataForChart: (number | null)[] = allDates.map(date => {
      // const formattedDate = DateTime.fromFormat(date, 'MMM ddd'); // this can be useful for year maybe (for all time showcase)
      const log = this.bodyweightsChart.data.find(_ => {
        const localDate = this.sharedService.getLocalDate(_.logDate);
        return DateTime.fromJSDate(localDate).toFormat('MMM dd yyyy') === date;
      });

      let data = null;

      data = log
        ? parseFloat(this.measurementConverterPipe.transform(log['value'], log['weightUnitId']))
        : null;

      return data;
    });

    const values = this.bodyweightsChart.data
      .map(_ => parseFloat(this.measurementConverterPipe.transform(_['value'], _.weightUnitId)));

    // MAP GOALS

    const goalDatasets: any[] = [];
    const goalValues: number[] = [];

    if (this.bodyweightGoalsChart?.data && this.bodyweightGoalsChart.data.length > 0) {
      const maxGoalEntry = this.bodyweightGoalsChart.data
        .reduce((max, current) => (current.target > max.target ? current : max), this.bodyweightGoalsChart.data[0]);

      const maxGoalWeight = parseFloat(this.measurementConverterPipe.transform(maxGoalEntry.target, maxGoalEntry.weightUnitId));
      goalValues.push(maxGoalWeight);

      this.bodyweightGoalsChart.data.forEach((goal, idx) => {
        let goalData: (number | null)[] = new Array(allDates.length).fill(null);

        // End date
        const goalEndDate = DateTime.fromJSDate(new Date(goal.endDate)).toFormat('MMM dd yyyy');
        const endIdx = allDates.indexOf(goalEndDate);
        if (endIdx !== -1) goalData[endIdx] = parseFloat(this.measurementConverterPipe.transform(goal.target, goal.weightUnitId));

        // Start date
        let goalStartWeight: number | null = null;
        const goalStartDate = DateTime.fromJSDate(new Date(goal.startDate)).toFormat('MMM dd yyyy');
        const startIdx = allDates.indexOf(goalStartDate);

        if (startIdx !== -1) {
          const log = this.bodyweightsChart.data.find(log =>
            DateTime.fromJSDate(this.sharedService.getLocalDate(log.logDate)).toFormat('MMM dd yyyy') === goalStartDate
          );
          goalStartWeight = log
            ? parseFloat(this.measurementConverterPipe.transform(log['value'], log.weightUnitId))
            : null; // setting a start of the goal to weight at that time
        }

        if (!goalStartWeight) {
          // <
          const closestLog = [...this.bodyweightsChart.data]
            .filter(log => this.sharedService.getLocalDate(log.logDate) < this.sharedService.getLocalDate(goal.startDate))
            .sort((a, b) =>
              DateTime.fromJSDate(this.sharedService.getLocalDate(b.logDate))
                .diff(DateTime.fromJSDate(this.sharedService.getLocalDate(a.logDate)), 'milliseconds')
                .milliseconds
            )[0];
          goalStartWeight = closestLog
            ? parseFloat(this.measurementConverterPipe.transform(closestLog['value'], closestLog.weightUnitId))
            : null; // setting a start of the goal to closest weight at that time

          if (!goalStartWeight) {
            // >
            const closestLog = [...this.bodyweightsChart.data]
              .filter(log => this.sharedService.getLocalDate(log.logDate) > this.sharedService.getLocalDate(goal.startDate))
              .sort((a, b) =>
                DateTime.fromJSDate(this.sharedService.getLocalDate(a.logDate))
                  .diff(DateTime.fromJSDate(this.sharedService.getLocalDate(b.logDate)), 'milliseconds')
                  .milliseconds
              )[0];


            goalStartWeight = closestLog
              ? parseFloat(this.measurementConverterPipe.transform(closestLog['value'], closestLog.weightUnitId))
              : null; // setting a start of the goal to closest body fat at that time //#TODO
            //? MAYBE this piece of if block was used for body fat and we don't need it anymore
            //? check this throughly when cleanup takes place
            //? also chekc this at measurement.ts
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

    Chart.register(ChartDataLabels);

    this.chart = new Chart('bodyweights-line-chart', {
      type: 'line',
      data: {
        labels: allDates,
        datasets: [
          {
            label: 'Bodyweight',
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
        scales: {
          x: {
            ticks: {
              maxTicksLimit: 8
            }
          },
          y: {
            min: this.sharedService.roundToNearestTen(Math.max(0, Math.round(Math.min(...values) - 10))),
            max: this.sharedService.roundToNearestTen(Math.round(Math.max(...values, ...goalValues) + 10)),
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


  private infoInit() {
    this.bodyweightController.GetCurrentBodyweightInfo().toPromise()
      .then(_ => {
        if (!_?.isSuccess)
          return;

        this.currentBodyweight = _.data;
      })
      .catch(ex => { throw ex; })
  }

  private destroyChart() {
    if (this.chart)
      this.chart.destroy();
  }

  ngOnDestroy(): void {
    this.destroyChart();
  }
}
