import { CommonModule } from '@angular/common';
import { Component, effect, OnDestroy } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Chart } from 'chart.js/auto';
import ChartDataLabels from 'chartjs-plugin-datalabels';
import { DateTime } from 'luxon';
import { Paginator, PaginatorState } from 'primeng/paginator';
import { eBodyPart, eChartTimespan } from '../../_generated/enums';
import { ICurrentBodyInfoDto, IEnumProvider, IMeasurementDto, IMeasurementGoalDto, IMeasurementGoalSearchOptions, IMeasurementSearchOptions, IPagingResult, ISortingOptions } from '../../_generated/interfaces';
import { Providers } from '../../_generated/providers';
import { MeasurementController, MeasurementGoalController } from '../../_generated/services';
import { ClickOutsideDirective } from '../../directives/click-outside.directive';
import { EnumNamePipe } from '../../pipes/enum-name.pipe';
import { MeasurementConverterPipe } from '../../pipes/measurement-converter.pipe';
import { UtcToLocalPipe } from '../../pipes/utc-to-local.pipe';
import { MeasurementService } from '../../services/measurement.service';
import { ModalService } from '../../services/modal.service';
import { QService } from '../../services/q.service';
import { SharedService } from '../../services/shared.service';

enum eMeasurementInfoTab {
  Measurements = 0,
  Goals = 1,
}

@Component({
  selector: 'app-measurement',
  imports: [CommonModule, UtcToLocalPipe, MeasurementConverterPipe, EnumNamePipe, Paginator, FormsModule, ClickOutsideDirective],
  templateUrl: './measurement.html',
  styleUrl: './measurement.css'
})
export class Measurement implements OnDestroy {
  private chart!: Chart;

  measurements?: IPagingResult<IMeasurementDto>;
  measurementsChart: IPagingResult<IMeasurementDto>;
  private measurementLookup: Partial<Record<eBodyPart, Record<string, number>>> = {};

  measurementGoals?: IPagingResult<IMeasurementGoalDto>;
  measurementGoalsChart: IPagingResult<IMeasurementGoalDto>;

  chartTimespans: IEnumProvider[] = [];
  selectedTimespan: number = eChartTimespan.Last3Months;

  dataDatasets: any[] = [];
  savedVisibility: Partial<Record<eBodyPart, boolean>> = {};


  currentMeasurements: ICurrentBodyInfoDto | null = null;

  selectedTab: number = 0;
  tabs = [
    {
      label: 'Measurements',
      iconClass: 'fa-solid fa-ruler',
    },
    {
      label: 'Goals',
      iconClass: 'fa-solid fa-chart-line',
    }
  ];

  measurementsFirst = 0;
  measurementGoalsFirst = 0;
  rows = 13;

  selectedMeasurementMenu: number | null;
  selectedMeasurementGoalMenu: number | null;

  constructor(
    public modalService: ModalService,
    private measurementService: MeasurementService,
    private referenceService: Providers,
    private $q: QService,
    private sharedService: SharedService,

    private measurementController: MeasurementController,
    private measurementGoalController: MeasurementGoalController,

    private measurementConverterPipe: MeasurementConverterPipe,
    private enumNamePipe: EnumNamePipe
  ) {
    effect(() => {
      this.measurementService.measurementsSignal();
      this.getMeasurements();
      this.getMeasurementGoals();
    }, { allowSignalWrites: true });

    this.chartTimespans = this.referenceService.getChartTimespans();
  }

  // events

  onSelectTab = (idx: number) => this.selectedTab = idx;
  onTimespanChange = () => this.getMeasurementsAndGoalsChart();
  onPageChange(event: PaginatorState) {
    if (this.selectedTab === eMeasurementInfoTab.Measurements) {
      this.measurementsFirst = event.first ?? this.measurementsFirst;
      this.rows = event.rows ?? this.rows;
      this.getPaginatedMeasurements(this.measurementsFirst, this.rows);
    }
    else if (this.selectedTab === eMeasurementInfoTab.Goals) {
      this.measurementGoalsFirst = event.first ?? this.measurementGoalsFirst;
      this.rows = event.rows ?? this.rows;
      this.getPaginatedMeasurementGoals(this.measurementGoalsFirst, this.rows);
    }
  }
  onOpenEditMenu(idx: number) {
    if (this.selectedTab === eMeasurementInfoTab.Measurements) {
      this.selectedMeasurementGoalMenu = null;

      if (this.selectedMeasurementMenu === idx)
        this.selectedMeasurementMenu = null;
      else
        this.selectedMeasurementMenu = idx;
    }
    else if (this.selectedTab === eMeasurementInfoTab.Goals) {
      this.selectedMeasurementMenu = null;

      if (this.selectedMeasurementGoalMenu === idx)
        this.selectedMeasurementGoalMenu = null;
      else
        this.selectedMeasurementGoalMenu = idx;
    }
  }

  toggleDataset(index: number) {
    const ds = this.chart.data.datasets[index];
    const partId = this.dataDatasets[index].bodyPartId;

    const newHidden = !ds.hidden;

    // 1. Toggle the measurement dataset visually
    ds.hidden = newHidden;
    this.dataDatasets[index].visible = !newHidden;

    // Update saved visibility immediately
    this.savedVisibility[partId as eBodyPart] = !newHidden;

    // 2. Toggle all goal datasets with same bodyPartId
    this.chart.data.datasets.forEach((gds: any) => {
      if (gds.bodyPartId === partId && gds !== ds) {
        gds.hidden = newHidden;
      }
    });

    this.chart.update();
  }

  // methods

  editMeasurement(data: IMeasurementDto) {
    this.selectedMeasurementMenu = null;
    this.modalService.showEditMeasurementModal(data);
  }
  deleteMeasurement(id: number) {
    this.selectedMeasurementMenu = null;
    this.measurementController.Delete(id).toPromise()
      .then(_ => this.measurementService.triggerMeasurements())
      .catch(ex => { throw ex; })
  }

  editMeasurementGoal(data: IMeasurementGoalDto) {
    this.selectedMeasurementGoalMenu = null;
    this.modalService.showEditMeasurementGoalModal(data);
  }
  deleteMeasurementGoal(id: number) {
    this.selectedMeasurementGoalMenu = null;
    this.measurementGoalController.Delete(id).toPromise()
      .then(_ => this.measurementService.triggerMeasurements())
      .catch(ex => { throw ex; })
  }

  // private

  private getMeasurementGoals() {
    this.getPaginatedMeasurementGoals(this.measurementGoalsFirst, this.rows);
  }

  private getMeasurements() {
    this.getMeasurementsAndGoalsChart();
    this.getPaginatedMeasurements(this.measurementsFirst, this.rows);
    this.infoInit();
  }

  private getPaginatedMeasurementGoals(skip: number, take: number) {
    const options = {} as IMeasurementGoalSearchOptions;
    options.take = take;
    options.skip = skip;
    options.sortingOptions = [{ field: 'EndDate', dir: 'desc' }] as ISortingOptions[];

    this.measurementGoalController.Search(options).toPromise()
      .then(_ => {
        if (_?.data !== null) {
          this.measurementGoals = _?.data;
        }
      })
      .catch(ex => { throw ex; });
  }

  private getPaginatedMeasurements(skip: number, take: number) {
    const options = {} as IMeasurementSearchOptions;
    options.take = take;
    options.skip = skip;
    options.sortingOptions = [{ field: 'LogDate', dir: 'desc' }] as ISortingOptions[];

    this.measurementController.Search(options).toPromise()
      .then(_ => {
        if (_?.data !== null) {
          this.measurements = _?.data;
        }
      })
      .catch(ex => { throw ex; });
  }

  private getMeasurementsAndGoalsChart() {
    this.destroyChart();

    const options = {} as IMeasurementSearchOptions;
    options.chartTimespanId = this.selectedTimespan;

    const goalOptions = {} as IMeasurementGoalSearchOptions;
    goalOptions.chartTimespanId = this.selectedTimespan;

    this.$q.all([
      this.measurementController.Search(options).toPromise(),
      this.measurementGoalController.Search(goalOptions).toPromise()
    ])
      .then(result => {
        if (result[0] !== null) {
          this.measurementsChart = result[0].data;
        }
        if (result[1] !== null) {
          this.measurementGoalsChart = result[1].data;
        }

        this.chartInit();
      })
  }

  private getStartDate() {
    let earliestMeasurementTimestamp: Date | null = null;

    if (this.measurementsChart?.data && this.measurementsChart.data.length > 0) {
      earliestMeasurementTimestamp = new Date(
        Math.min(...this.measurementsChart.data.map(_ => new Date(_.logDate!).getTime()))
      );
    }

    let earliestMeasurementGoalTimestamp: Date | null = null;

    if (this.measurementGoalsChart?.data && this.measurementGoalsChart.data.length > 0) {
      earliestMeasurementGoalTimestamp = new Date(
        Math.min(...this.measurementGoalsChart.data.map(_ => new Date(_.startDate!).getTime()))
      );
    }

    const earliestDate = this.sharedService.getLocalDate(
      earliestMeasurementTimestamp && earliestMeasurementGoalTimestamp
        ? earliestMeasurementTimestamp < earliestMeasurementGoalTimestamp
          ? earliestMeasurementTimestamp
          : earliestMeasurementGoalTimestamp
        : earliestMeasurementTimestamp !== null
          ? earliestMeasurementTimestamp
          : earliestMeasurementGoalTimestamp !== null
            ? earliestMeasurementGoalTimestamp
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
      .minus({ days: 7 }) // padding for start of the chart

    let maxGoalEndDate = today; // does this mean that if the goal is later than today it will show it??

    if (this.measurementGoalsChart?.data?.length) {
      const maxGoalEndDateTimespan = new Date(
        Math.max(...this.measurementGoalsChart.data.map(_ => new Date(_.endDate).getTime()))
      );
      const maxGoalEndDateLocal = this.sharedService.getLocalDate(maxGoalEndDateTimespan);
      maxGoalEndDate = DateTime.fromJSDate(maxGoalEndDateLocal) as DateTime<true>;
    }

    const maxEndDate = (maxGoalEndDate > today
      ? maxGoalEndDate
      : today)
      .plus({ days: 10 }); // padding for end of the chart

    let totalDays = maxEndDate.diff(startDate, 'days').days;
    const allDates: string[] = [];
    for (let i = 0; i <= totalDays; i++) {
      const date = startDate.plus({ days: i });
      allDates.push(date.toFormat('MMM dd yyyy'));
    }

    this.buildMeasurementLookup();
    const dataDatasets = this.getDatasets(allDates);

    const goalDatasets = this.getGoalDatasets(allDates);

    Chart.register(ChartDataLabels)

    const values = this.measurementsChart.data
      .map(_ => parseFloat(this.measurementConverterPipe.transform(_.size, _.measurementUnitId)));
    const goalValues: number[] = [];

    if (this.measurementGoalsChart?.data?.length) {
      const maxGoalEntry = this.measurementGoalsChart.data
        .reduce((max, current) => (current.size > max.size ? current : max), this.measurementGoalsChart.data[0]);

      goalValues.push(parseFloat(this.measurementConverterPipe.transform(maxGoalEntry.size, maxGoalEntry.measurementUnitId)));
    }

    this.chart = new Chart('measurements-line-chart', {
      type: 'line',
      data: {
        labels: allDates,
        datasets: [
          ...dataDatasets,
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

                const partName = dataset.label.replace('Goal', '');

                if (dataIdx === firstIdx)
                  return `Start ${partName}`;
                else if (dataIdx === lastIdx)
                  return `Goal ${partName}`

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

  private getDatasets(allDates: string[]) {
    this.dataDatasets = [];

    this.referenceService.getBodyParts().forEach(_ => {
      const dataForChart = this.getBodyPartData(allDates, _.id);

      if (dataForChart.length > 0 && dataForChart.some(_ => _ !== null))
        this.dataDatasets.push({
          label: _.description,
          data: dataForChart,
          backgroundColor: _.bgColor,
          borderColor: _.bgColor,
          borderWidth: 2,
          tension: 0.3,
          spanGaps: true,
          hidden: !(this.savedVisibility?.[_.id as eBodyPart] ?? true),
          visible: this.savedVisibility?.[_.id as eBodyPart] ?? true, // <-- for legend UI
          bodyPartId: _.id
        })
    });

    return this.dataDatasets;
  }

  private getBodyPartData(allDates: string[], bodyPartId: eBodyPart): (number | null)[] {
    const lookup = this.measurementLookup[bodyPartId] || {};
    return allDates.map(date => lookup[date] ?? null);
  }

  private buildMeasurementLookup() {
    this.measurementLookup = {} as Partial<Record<eBodyPart, Record<string, number>>>;

    for (const m of this.measurementsChart.data) {
      const localDate = this.sharedService.getLocalDate(m.logDate);
      const dateKey = DateTime.fromJSDate(localDate).toFormat('MMM dd yyyy');

      if (!this.measurementLookup[m.bodyPartId])
        this.measurementLookup[m.bodyPartId] = {};

      this.measurementLookup[m.bodyPartId]![dateKey] = parseFloat(this.measurementConverterPipe.transform(m.size, m.measurementUnitId));
    }
  }

  private getGoalDatasets(allDates: string[]) {
    if (!this.measurementGoalsChart?.data?.length)
      return [];

    const datasets: any[] = [];

    this.measurementGoalsChart.data.forEach((goal, idx) => {
      let goalData: (number | null)[] = new Array(allDates.length).fill(null);

      // End date
      const goalEndDate = DateTime.fromJSDate(new Date(goal.endDate)).toFormat('MMM dd yyyy');
      const endIdx = allDates.indexOf(goalEndDate);
      if (endIdx !== -1) goalData[endIdx] = parseFloat(this.measurementConverterPipe.transform(goal.size, goal.measurementUnitId));

      // Start date
      let goalStartMeasurement: number | null = null;
      const goalStartDate = DateTime.fromJSDate(new Date(goal.startDate)).toFormat('MMM dd yyyy');
      const startIdx = allDates.indexOf(goalStartDate);

      if (startIdx !== -1) {
        const log = this.measurementsChart.data.find(log =>
          DateTime.fromJSDate(this.sharedService.getLocalDate(log.logDate)).toFormat('MMM dd yyyy') === goalStartDate && log.bodyPartId === goal.bodyPartId
        );

        goalStartMeasurement = log
          ? parseFloat(this.measurementConverterPipe.transform(log.size, log.measurementUnitId))
          : null; // setting a start of the goal to measurement at that time
      }

      if (!goalStartMeasurement) {
        // <
        const closestLog = [...this.measurementsChart.data.filter(_ => _.bodyPartId === goal.bodyPartId)]
          .filter(log => this.sharedService.getLocalDate(log.logDate) < this.sharedService.getLocalDate(goal.startDate))
          .sort((a, b) =>
            DateTime.fromJSDate(this.sharedService.getLocalDate(b.logDate))
              .diff(DateTime.fromJSDate(this.sharedService.getLocalDate(a.logDate)), 'milliseconds')
              .milliseconds
          )[0];

        goalStartMeasurement = closestLog
          ? parseFloat(this.measurementConverterPipe.transform(closestLog.size, closestLog.measurementUnitId))
          : null; // setting a start of the goal to closest size at that time

        if (!goalStartMeasurement) {
          // >
          const closestLog = [...this.measurementsChart.data.filter(_ => _.bodyPartId === goal.bodyPartId)]
            .filter(log => this.sharedService.getLocalDate(log.logDate) > this.sharedService.getLocalDate(goal.startDate))
            .sort((a, b) =>
              DateTime.fromJSDate(this.sharedService.getLocalDate(a.logDate))
                .diff(DateTime.fromJSDate(this.sharedService.getLocalDate(b.logDate)), 'milliseconds')
                .milliseconds
            )[0];

          goalStartMeasurement = closestLog
            ? parseFloat(this.measurementConverterPipe.transform(closestLog.size, closestLog.measurementUnitId))
            : null; // setting a start of the goal to closest size at that time
        }
      }

      if (startIdx !== -1 && goalStartMeasurement !== null)
        goalData[startIdx] = goalStartMeasurement;

      // Push a separate dataset for each goal
      datasets.push({
        label: `Goal ${this.enumNamePipe.transform(goal.bodyPartId, 'BodyParts')}`,
        data: goalData,
        backgroundColor: 'rgba(255, 0, 0, 1)',
        borderColor: 'rgba(255, 0, 0, 1)',
        borderWidth: 2,
        borderDash: [10, 5],
        fill: false,
        tension: 0.3,
        spanGaps: true,
        hidden: !(this.savedVisibility?.[goal.bodyPartId as eBodyPart] ?? true),
        bodyPartId: goal.bodyPartId
      });
    });

    return datasets;
  }

  private infoInit() {
    this.measurementController.GetCurrentMeasurementInfo().toPromise()
      .then(_ => {
        if (!_?.isSuccess)
          return;

        this.currentMeasurements = _.data;
      })
      .catch(ex => { throw ex; })
  }

  private destroyChart() {
    if (!this.chart)
      return;

    this.saveDatasetVisibility();

    this.chart.destroy();
  }

  private saveDatasetVisibility() {
    this.chart.data.datasets.forEach((ds: any) => {
      if (ds.bodyPartId != null)
        this.savedVisibility[ds.bodyPartId as eBodyPart] = !ds.hidden as boolean; // true if visible
    })
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
