import { Component, effect } from '@angular/core';
import { ModalService } from '../../services/modal.service';
import { CommonModule } from '@angular/common';
import { UtcToLocalPipe } from '../../pipes/utc-to-local.pipe';
import { MeasurementConverterPipe } from '../../pipes/measurement-converter.pipe';
import { MeasurementController, MeasurementGoalController } from '../../_generated/services';
import { ICurrentBodyInfoDto, IMeasurementDto, IMeasurementGoalDto, IMeasurementGoalSearchOptions, IMeasurementSearchOptions, IPagingResult, ISortingOptions } from '../../_generated/interfaces';
import { MeasurementService } from '../../services/measurement.service';
import { EnumNamePipe } from '../../pipes/enum-name.pipe';
import { Paginator, PaginatorState } from 'primeng/paginator';

enum eMeasurementInfoTab {
  Measurements = 0,
  Goals = 1,
}

@Component({
  selector: 'app-measurement',
  imports: [CommonModule, UtcToLocalPipe, MeasurementConverterPipe, EnumNamePipe, Paginator],
  templateUrl: './measurement.html',
  styleUrl: './measurement.css'
})
export class Measurement {

  measurements?: IPagingResult<IMeasurementDto>;

  measurementGoals?: IPagingResult<IMeasurementGoalDto>;

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


    private measurementController: MeasurementController,
    private measurementGoalController: MeasurementGoalController,
  ) {
    effect(() => {
      this.measurementService.measurementsSignal();
      this.getMeasurements();
      this.getMeasurementGoals();
    }, { allowSignalWrites: true });

    // this.chartTimespans = this.referenceService.getChartTimespans();
  }

  // events

  onSelectTab = (idx: number) => this.selectedTab = idx;
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
    // this.getMeasurementAndGoalsChart();
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

  private infoInit() {
    this.measurementController.GetCurrentMeasurementInfo().toPromise()
      .then(_ => {
        if (!_?.isSuccess)
          return;

        this.currentMeasurements = _.data;
      })
      .catch(ex => { throw ex; })
  }
}
