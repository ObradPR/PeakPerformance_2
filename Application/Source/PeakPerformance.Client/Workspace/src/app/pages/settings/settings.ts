import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BaseValidationComponent } from '../_base/base.component/base-validation.component';
import { AuthService } from '../../services/auth.service';
import { ICountryDto, IEnumProvider, IUserDto } from '../../_generated/interfaces';
import { ValidationDirective } from '../../directives/validation.directive';
import { Providers } from '../../_generated/providers';
import { DateTime } from 'luxon';
import { MeasurementUnitDescriptionPipe } from '../../pipes/measurement-unit-description.pipe';
import { eMeasurementUnit } from '../../_generated/enums';
import { CountryController, UserController } from '../../_generated/services';
import { LoaderService } from '../../services/loader.service';
import { MeasurementConverterPipe } from '../../pipes/measurement-converter.pipe';
import { Functions } from '../../functions';

@Component({
  selector: 'app-settings',
  imports: [FormsModule, ReactiveFormsModule, ValidationDirective],
  templateUrl: './settings.html',
  styleUrl: './settings.css'
})
export class Settings extends BaseValidationComponent implements OnInit {
  override errors: Record<string, string>;

  // Personal details
  form: FormGroup<any>;
  user: IUserDto | null;
  genders: IEnumProvider[] = [];
  countries: ICountryDto[] = [];
  selectedIso2: string | null = null;
  minDob: string;
  maxDob: string;
  userHeightMeasurementPreference: string = '';

  // Email
  formEmail: FormGroup<any>;

  // Password
  formPassword: FormGroup<any>;

  // Units of measure
  formMeasurements: FormGroup<any>;
  measurementUnits: IEnumProvider[] = [];
  lbsId: eMeasurementUnit = 0;
  kgId: eMeasurementUnit = 0;
  cmId: eMeasurementUnit = 0;
  inId: eMeasurementUnit = 0;

  constructor(
    private fb: FormBuilder,

    private authService: AuthService,
    private providers: Providers,
    private loaderService: LoaderService,

    private countryController: CountryController,
    private userController: UserController,

    private measurementConverterPipe: MeasurementConverterPipe
  ) {
    super();

    this.user = this.authService.currentUserSource();

    this.genders = this.providers.getUserGenders();
    this.measurementUnits = this.providers.getMeasurementUnits();

    this.userHeightMeasurementPreference = this.measurementUnits.find(_ => _.id === this.user?.measurementUnitId)!.description;
    if (this.userHeightMeasurementPreference === 'in')
      this.userHeightMeasurementPreference = 'ft';

    this.lbsId = this.getMeasurementId('lbs');
    this.kgId = this.getMeasurementId('kg');
    this.cmId = this.getMeasurementId('cm');
    this.inId = this.getMeasurementId('in');

    this.minDob = DateTime.now().minus({ years: 80 }).toISODate();
    this.maxDob = DateTime.now().minus({ years: 14 }).toISODate();
  }

  ngOnInit(): void {
    this.formInit_PersonalDetails();
    this.formInit_Email();
    this.formInit_Password();
    this.formInit_Measurements();

  }

  // events

  onCountryChanged(event: any) {
    const selectedId = Number(event.target.value);
    const country = this.countries.find(c => c.id === selectedId);
    this.selectedIso2 = country?.isO2 ?? null;
  }

  // Personal Details

  formInit_PersonalDetails() {
    let dob = null;

    if (this.user?.dateOfBirth) {
      const date = new Date(this.user.dateOfBirth);
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, '0');
      const day = String(date.getDate()).padStart(2, '0');

      dob = `${year}-${month}-${day}`;
    }

    this.form = this.fb.group({
      username: [this.user?.username],
      fullName: [this.user?.fullName],
      dateOfBirth: [dob],
      description: [this.user?.description],
      genderId: [this.user?.genderId],
      countryId: [this.user?.countryId],
      height: [this.getHeightValue()],
      heightMeasurementUnitId: [this.user?.heightMeasurementUnitId]
    });

    this.countryController.GetList().toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.countries = _.data
          this.selectedIso2 = this.countries.find(_ => _.id === this.user?.countryId)?.isO2 ?? null;
        }
      });
  }

  submitPersonalDetails(form: FormGroup) {
    this.loaderService.showPageLoader();


    const payload = {
      ...this.user,
      ...form.value
    };

    if (this.user?.heightMeasurementUnitId) {
      if (this.user?.measurementUnitId !== this.user?.heightMeasurementUnitId) {
        if (this.user?.heightMeasurementUnitId === eMeasurementUnit.Centimeters) {
          payload.height = Functions.feetToInches(payload.height);
          payload.height = Functions.toCentimeters(payload.height);
        }
        else if (this.user?.heightMeasurementUnitId === eMeasurementUnit.Inches) {
          payload.height = Functions.toInches(payload.height);
        }
      }
    }

    this.userController.UpdatePersonalDetails(payload).toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.authService.loadCurrentUser();
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => this.loaderService.hidePageLoader());
  }

  getHeightValue(): number | undefined {
    let value = this.user?.height;

    if (this.user?.heightMeasurementUnitId) {
      if (this.user?.measurementUnitId !== this.user?.heightMeasurementUnitId) {
        if (this.user?.heightMeasurementUnitId === eMeasurementUnit.Centimeters) {
          value = Functions.toInches(value!);
          value = Functions.inchesToFeet(value);
        }
        else if (this.user?.heightMeasurementUnitId === eMeasurementUnit.Inches) {
          value = Functions.toCentimeters(value!);
        }
      }
    }

    return value;
  }

  // Email

  formInit_Email() {
    this.formEmail = this.fb.group({
      email: [this.user?.email],
    });
  }

  // Password

  formInit_Password() {
    this.formPassword = this.fb.group({
      oldPassword: [],
      newPassword: [],
      repeatPassword: [],
    });
  }

  submitNewPassword() {
    this.loaderService.showPageLoader();

    this.userController.ChangePassword(this.formPassword.value).toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.formPassword.reset();
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => this.loaderService.hidePageLoader());
  }

  // Units of measure

  getMeasurementId(description: string): eMeasurementUnit {
    return this.measurementUnits.find(_ => _.description === description)?.id ?? 0;
  }

  formInit_Measurements() {
    this.formMeasurements = this.fb.group({
      weightUnitId: [this.user?.weightUnitId],
      measurementUnitId: [this.user?.measurementUnitId],
    });
  }

  submitMeasurementUnits() {
    this.loaderService.showPageLoader();

    this.userController.UpdateMeasurementUnits(this.formMeasurements.value).toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.authService.loadCurrentUser();
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => this.loaderService.hidePageLoader());
  }
}
