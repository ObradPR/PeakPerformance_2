import { Component, Signal } from '@angular/core';
import { RouterLink } from '@angular/router';
import { DateTime } from 'luxon';
import { eMeasurementUnit } from '../../_generated/enums';
import { IEnumProvider, IUserDto } from '../../_generated/interfaces';
import { Providers } from '../../_generated/providers';
import { CountryController } from '../../_generated/services';
import { Functions } from '../../functions';
import { EnumNamePipe } from "../../pipes/enum-name.pipe";
import { MeasurementConverterPipe } from '../../pipes/measurement-converter.pipe';
import { AuthService } from '../../services/auth.service';
import { WorkoutsCalendar } from "../workout/workouts-calendar/workouts-calendar";

@Component({
  selector: 'app-home',
  imports: [EnumNamePipe, RouterLink, WorkoutsCalendar],
  templateUrl: './home.html',
  styleUrl: './home.css'
})
export class Home {
  user: Signal<IUserDto | null>;
  age: number | null;
  countryIso2: string | null;

  measurementUnits: IEnumProvider[] = [];
  userHeight: number = 0;
  userHeightMeasurementPreference: string = '';

  constructor(
    private authService: AuthService,
    private providers: Providers,

    private countryController: CountryController,

    private measurementConverterPipe: MeasurementConverterPipe
  ) {
    this.user = this.authService.currentUserSource;
    
    this.setUserHeight();
    this.setUserCountry();
    this.setUserAge();
  }

  private setUserCountry() {
    if (!this.user()?.countryId) return;
    this.countryController.GetSingle(this.user()!.countryId!).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
           this.countryIso2 = _.data.isO2;
        }
      });
  }

  private setUserAge() {
    if (!this.user()?.dateOfBirth) return;

    this.age = Math.floor(
      DateTime.now().diff(DateTime.fromJSDate(new Date(this.user()!.dateOfBirth)), 'years').years
    );
  }

  private setUserHeight() {
    if (!this.user()?.height) return;

    this.measurementUnits = this.providers.getMeasurementUnits();

    this.userHeightMeasurementPreference = this.measurementUnits.find(_ => _.id === this.user()?.measurementUnitId)!.description;
    if (this.userHeightMeasurementPreference === 'in') {
      this.userHeightMeasurementPreference = 'ft';
      this.userHeight = Functions.inchesToFeet(parseFloat(this.measurementConverterPipe.transform(this.user()!.height, this.user()!.heightMeasurementUnitId)));
    }
    this.userHeight = this.getHeightValue();
  }

   private getHeightValue(): number {
      let value = this.user()?.height;
  
      if (this.user()?.heightMeasurementUnitId) {
        if (this.user()?.measurementUnitId !== this.user()?.heightMeasurementUnitId) {
          if (this.user()?.measurementUnitId === eMeasurementUnit.Inches) {
            value = Functions.toInches(value!);
            value = Functions.inchesToFeet(value);
          }
          else if (this.user()?.measurementUnitId === eMeasurementUnit.Centimeters) {
            value = Functions.toCentimeters(value!);
          }
        }
        else if (this.user()?.measurementUnitId === eMeasurementUnit.Inches) {
          value = Functions.inchesToFeet(value!);
        }
      }
  
      return value ?? 0;
    }
}
