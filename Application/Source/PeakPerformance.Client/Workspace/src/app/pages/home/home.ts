import { Component, Signal } from '@angular/core';
import { IUserDto } from '../../_generated/interfaces';
import { AuthService } from '../../services/auth.service';
import { MeasurementConverterPipe } from '../../pipes/measurement-converter.pipe';
import { EnumNamePipe } from "../../pipes/enum-name.pipe";
import { DateTime } from 'luxon';
import { CountryController } from '../../_generated/services';

@Component({
  selector: 'app-home',
  imports: [MeasurementConverterPipe, EnumNamePipe],
  templateUrl: './home.html',
  styleUrl: './home.css'
})
export class Home {
  user: Signal<IUserDto | null>;
  age: number | null;
  countryIso2: string | null;

  constructor(
    private authService: AuthService,

    private countryController: CountryController,
  ) {
    this.user = this.authService.currentUserSource;

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
}
