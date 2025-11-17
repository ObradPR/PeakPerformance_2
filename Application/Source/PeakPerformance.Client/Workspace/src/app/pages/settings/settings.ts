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

@Component({
  selector: 'app-settings',
  imports: [FormsModule, ReactiveFormsModule, ValidationDirective, MeasurementUnitDescriptionPipe],
  templateUrl: './settings.html',
  styleUrl: './settings.css'
})
export class Settings extends BaseValidationComponent implements OnInit {
  override errors: Record<string, string>;
  form: FormGroup<any>; // Personal details

  user: IUserDto | null;
  genders: IEnumProvider[] = [];
  countries: ICountryDto[] = [];
  selectedIso2: string | null = null;
  minDob: string;
  maxDob: string;

  userMeasurementPreference: eMeasurementUnit | undefined;

  constructor(
    private fb: FormBuilder,

    private authService: AuthService,
    private providers: Providers,
    private loaderService: LoaderService,

    private countryController: CountryController,
    private userController: UserController,
  ) {
    super();

    this.user = this.authService.currentUserSource();
    this.userMeasurementPreference = this.user?.measurementUnitId;

    this.genders = this.providers.getUserGenders();

    this.minDob = DateTime.now().minus({ years: 80 }).toISODate();
    this.maxDob = DateTime.now().minus({ years: 14 }).toISODate();
  }

  ngOnInit(): void {
    this.formInit_PersonalDetails();

    this.countryController.GetList().toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.countries = _.data
          this.selectedIso2 = this.countries.find(_ => _.id === this.user?.countryId)?.isO2 ?? null;
        }
      });


  }

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
      height: [this.user?.height],
    });
  }

  submitPersonalDetails() {
    this.loaderService.showPageLoader();

    const payload = {
      ...this.user,
      ...this.form.value
    };

    this.userController.UpdatePersonalDetails(payload).toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.authService.loadCurrentUser();
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => this.loaderService.hidePageLoader());
  }
}
