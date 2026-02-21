import { Component, effect, OnInit } from '@angular/core';
import { Paginator, PaginatorState } from 'primeng/paginator';
import { ICountryDto, IEnumProvider, IPagingResult, IUserDto, IUserSearchOptions } from '../../../_generated/interfaces';
import { CountryController, UserController } from '../../../_generated/services';
import { LoaderService } from '../../../services/loader.service';
import { CommonModule } from '@angular/common';
import { DateTime } from 'luxon';
import { EnumNamePipe } from '../../../pipes/enum-name.pipe';
import { AuthService } from '../../../services/auth.service';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Providers } from '../../../_generated/providers';
import { debounceTime, distinctUntilChanged } from 'rxjs';
import { ModalService } from '../../../services/modal.service';

@Component({
  selector: 'app-admin-users',
  imports: [Paginator, CommonModule, EnumNamePipe, FormsModule, ReactiveFormsModule],
  templateUrl: './admin-users.html',
  styleUrl: './admin-users.css'
})
export class AdminUsers implements OnInit {
  form: FormGroup<any>;

  currentUserId: number | undefined;
  countries: ICountryDto[];
  users: IPagingResult<IUserDto> = {
    data: [],
    total: 0,
  };

  first = 0;
  rows = 25;

  genders: IEnumProvider[] = [];
  ageRanges: IEnumProvider[] = [];

  constructor(
    private fb: FormBuilder,

    private loaderService: LoaderService,
    private authService: AuthService,
    private providers: Providers,
    private modalService: ModalService,
    
    private countryController: CountryController,
    private userController: UserController,
  ) {
    this.genders = this.providers.getUserGenders();
    this.ageRanges = this.providers.getAgeRanges();

    effect(() => {
      this.modalService.reloadSignal();
      this.getUsers(this.first, this.rows);
    }, { allowSignalWrites: true })
  }

  ngOnInit(): void {
    this.formInit();
    this.setupFilterListener();

    this.currentUserId = this.authService.currentUserSource()?.id;
    this.getCountries();
  }

  private formInit() {
    this.form = this.fb.group({
      userId: [],
      search: [],
      ageRangeId: [],
      genderId: [],
      countryId: [],
    })
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
      ...this.form.value,
      filter: this.form.value.search,
      includeCurrent: true,
      includeAll: true,
      take,
      skip,
      sortingOptions: [{ field: 'IsActive', dir: 'desc'}, { field: 'Id', dir: 'asc' }]
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

  setupFilterListener() {
    this.form.valueChanges
      .pipe(
        debounceTime(300),
        distinctUntilChanged()
      )
      .subscribe(value => {
        this.first = 0;
        this.getUsers(this.first, this.rows);
      })
  }

  // Deactivating Account

  onAccountDeactivating(userId: number) {
    const ok = window.confirm(`Deactivate account?`);

    if (!ok) return;

    this.modalService.showDeactivateUserModal(userId);
  }
}
