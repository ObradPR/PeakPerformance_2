import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { IModalMethods } from '../interfaces/modal-methods.interface';
import { ModalService } from '../../../services/modal.service';
import { LoaderService } from '../../../services/loader.service';
import { CountryController, UserController } from '../../../_generated/services';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Paginator, PaginatorState } from 'primeng/paginator';
import { ICountryDto, IEnumProvider, IPagingResult, IUserDto, IUserSearchOptions } from '../../../_generated/interfaces';
import { Providers } from '../../../_generated/providers';
import { debounceTime, distinctUntilChanged } from 'rxjs';
import { EnumNamePipe } from '../../../pipes/enum-name.pipe';
import { DateTime } from 'luxon';
import { AuthService } from '../../../services/auth.service';
import { Functions } from '../../../functions';
import { MeasurementConverterPipe } from '../../../pipes/measurement-converter.pipe';
import { eMeasurementUnit } from '../../../_generated/enums';

@Component({
  selector: 'app-find-lifters-modal',
  imports: [FormsModule, ReactiveFormsModule, Paginator, EnumNamePipe],
  templateUrl: './find-lifters-modal.html',
  styleUrl: './find-lifters-modal.css'
})
export class FindLiftersModal implements IModalMethods, OnInit {
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;
  
  showFilters: boolean = false;

  countries: ICountryDto[] = [];
  selectedIso2: string | null = null;

  genders: IEnumProvider[] = [];
  ageRanges: IEnumProvider[] = [];

  offset = 0;
  limit = 10;
  users: {
    data: IUserDto[],
    total: number
  } = { data: [], total: 0 };

  userHeightMeasurementPreferenceId: eMeasurementUnit;
  userHeightMeasurementPreference: string = '';
  

  constructor(
    private router: Router,
    private fb: FormBuilder,

    private userController: UserController,
    private countryController: CountryController,

    private modalService: ModalService,
    private loaderService: LoaderService,
    private providers: Providers,
    private authService: AuthService,

    private measurementConverterPipe: MeasurementConverterPipe
  ) {
    this.genders = this.providers.getUserGenders();
    this.ageRanges = this.providers.getAgeRanges();

    const user = this.authService.currentUserSource();
    const measurementUnits = this.providers.getMeasurementUnits();

    this.userHeightMeasurementPreference = measurementUnits.find(_ => _.id === user?.measurementUnitId)!.description;
    this.userHeightMeasurementPreferenceId = measurementUnits.find(_ => _.id === user?.measurementUnitId)!.id;
  }

  ngOnInit(): void {
    this.formInit();
    this.setupFilterListener();

    this.countryController.GetList().toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.countries = _.data;
        }
      });

    this.getUsers();
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    this.form = this.fb.group({
      search: [''],
      genderId: [],
      ageRangeId: [],
      countryId: [],
    })
  }

  getUsers(offset = this.offset, limit = this.limit) {
    const options = {
      ...this.form.value,
      filter: this.form.value.search,
      skip: offset,
      take: limit,
    } as IUserSearchOptions;

    this.userController.Search(options).toPromise()
        .then(_ => {
          if(_?.isSuccess)
            this.users = _.data;
        });
  }

  getUserCountryIso2(userId: number): string | null {
    const country = this.countries.find(c => c.id === this.users.data.find(u => u.id === userId)?.countryId);
    return country?.isO2 ?? null;
  }

  getUserAge(userId: number): number | null {
    const user = this.users.data.find(_ => _.id === userId);

    if (!user?.dateOfBirth) return null;

    return Math.floor(
      DateTime.now().diff(DateTime.fromJSDate(new Date(user!.dateOfBirth)), 'years').years
    );
  }

  getUserHeight(userId: number): number | null {
    const user = this.users.data.find(_ => _.id === userId);

    if (!user?.height) return null;

    if (this.userHeightMeasurementPreference === 'in') {
      this.userHeightMeasurementPreference = 'ft';
      // return Functions.inchesToFeet(parseFloat(this.measurementConverterPipe.transform(user!.height, user!.heightMeasurementUnitId)));
    }
    return this.getHeightValue(user!);
  }

  private getHeightValue(user: IUserDto): number | null {
    let value = user?.height;

    if (user?.heightMeasurementUnitId) {
      if (this.userHeightMeasurementPreferenceId !== user?.heightMeasurementUnitId) {
        if (this.userHeightMeasurementPreferenceId === eMeasurementUnit.Inches) {
          value = Functions.toInches(value!);
          value = Functions.inchesToFeet(value);
        }
        else if (this.userHeightMeasurementPreferenceId === eMeasurementUnit.Centimeters) {
          value = Functions.toCentimeters(value!);
        }
      }
      else if (this.userHeightMeasurementPreferenceId === eMeasurementUnit.Inches) {
        value = Functions.inchesToFeet(value!);
      }
    }

    return value ?? 0;
  }

  selectUser(userId: number) {
    this.router.navigateByUrl('/', { skipLocationChange: true })
      .then(() => this.router.navigateByUrl(`/user/${userId}`))
      .then(() => this.modalService.hideFindLiftersModal());
  }


  // events

  onCountryChanged(event: any) {
    const selectedId = Number(event.target.value);
    const country = this.countries.find(c => c.id === selectedId);
    this.selectedIso2 = country?.isO2 ?? null;

    this.form.get('countryId')?.setValue(selectedId);
  }

  onPageChange(event: PaginatorState) {
    const offset = event.first ?? this.offset;
    const limit = event.rows ?? this.limit;

    this.getUsers(offset, limit);
  }

  setupFilterListener() {
    this.form.valueChanges
      .pipe(
        debounceTime(300),
        distinctUntilChanged()
      )
      .subscribe(value => {
        this.offset = 0;
        this.getUsers(this.offset);
      })
  }
}
