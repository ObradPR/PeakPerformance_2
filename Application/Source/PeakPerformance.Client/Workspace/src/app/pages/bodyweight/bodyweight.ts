import { Component, effect } from '@angular/core';
import { ModalService } from '../../services/modal.service';
import { CommonModule } from '@angular/common';
import { IBodyweightDto, IBodyweightGoalDto, IBodyweightGoalSearchOptions, IBodyweightSearchOptions, IPagingResult, ISortingOptions } from '../../_generated/interfaces';
import { UtcToLocalPipe } from '../../pipes/utc-to-local.pipe';
import { MeasurementConverterPipe } from '../../pipes/measurement-converter.pipe';
import { ClickOutsideDirective } from '../../directives/click-outside.directive';
import { BodyweightController, BodyweightGoalController } from '../../_generated/services';
import { BodyweightService } from '../../services/bodyweight.service';
import { Paginator, PaginatorState } from 'primeng/paginator';

enum eBodyweightInfoTab {
  Bodyweights = 0,
  Goals = 1,
}

@Component({
  selector: 'app-bodyweight',
  imports: [CommonModule, UtcToLocalPipe, MeasurementConverterPipe, ClickOutsideDirective, Paginator],
  templateUrl: './bodyweight.html',
  styleUrl: './bodyweight.css'
})
export class Bodyweight {
  bodyweights?: IPagingResult<IBodyweightDto>;
  bodyweightGoals?: IPagingResult<IBodyweightGoalDto>;


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

    private bodyweightController: BodyweightController,
    private bodyweightGoalController: BodyweightGoalController
  ) {
    effect(() => {
      this.bodyweightService.bodyweightsSignal();
      this.getBodyweights();
      this.getBodyweightGoals();
    }, { allowSignalWrites: true })
  }

  // events

  onSelectTab = (idx: number) => this.selectedTab = idx;
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
    // this.getBodyweightsAndGoalsChart();
    this.getPaginatedBodyweights(this.bodyweightsFirst, this.rows);
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
}
