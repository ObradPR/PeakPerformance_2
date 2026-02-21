import { Component, OnInit } from '@angular/core';
import { Paginator, PaginatorState } from 'primeng/paginator';
import { ICountryDto, IPagingResult, IUserDto, IUserSearchOptions } from '../../../_generated/interfaces';
import { CountryController, UserController } from '../../../_generated/services';
import { LoaderService } from '../../../services/loader.service';
import { CommonModule } from '@angular/common';
import { DateTime } from 'luxon';
import { EnumNamePipe } from '../../../pipes/enum-name.pipe';
import { AuthService } from '../../../services/auth.service';

@Component({
  selector: 'app-admin-users',
  imports: [Paginator, CommonModule, EnumNamePipe],
  templateUrl: './admin-users.html',
  styleUrl: './admin-users.css'
})
export class AdminUsers implements OnInit {
  currentUserId: number | undefined;
  countries: ICountryDto[];
  users: IPagingResult<IUserDto> = {
    data: [],
    total: 0,
  };

  first = 0;
  rows = 25;

  constructor(
    private loaderService: LoaderService,
    private authService: AuthService,

    private countryController: CountryController,
    private userController: UserController,
  ) {}

  ngOnInit(): void {
    this.currentUserId = this.authService.currentUserSource()?.id;

    this.getUsers(this.first, this.rows);
    this.getCountries();
  }

  // events

  onPageChange(event: PaginatorState) {
    this.first = event.first ?? this.first;
    this.rows = event.rows ?? this.rows;
    this.getUsers(this.first, this.rows);
  }

  // methods

  private getUsers(skip: number, take: number) {
    this.loaderService.showPageLoader();

    const options = {
      includeCurrent: true,
      take,
      skip,
      sortingOptions: [{ field: 'Id', dir: 'asc' }]
    } as IUserSearchOptions;

    this.userController.Search(options).toPromise()
      .then(_ => {
        if(_?.isSuccess) {
          this.users = _.data;
          this.users.data = [
            ...this.users.data.filter(_ => _.id === this.currentUserId),
            ...this.users.data.filter(_ => _.id !== this.currentUserId)
          ]
        }
      })
      .catch(ex => {throw ex;})
      .finally(() => this.loaderService.hidePageLoader());
  }

  private getCountries() {
    this.countryController.GetList().toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.countries = _.data;
        }
      });
  }

  getUserAge(dob: string | Date): string {
    if (!dob) return '';
    
    return Math.floor(
      DateTime.now().diff(DateTime.fromJSDate(new Date(dob)), 'years').years
    ).toString();
  }

  getUserCountryIso2(userId: number): string | null {
    const country = this.countries.find(c => c.id === this.users.data.find(u => u.id === userId)?.countryId);
    return country?.isO2 ?? null;
  }
}
