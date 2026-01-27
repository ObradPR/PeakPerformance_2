import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { IModalMethods } from '../interfaces/modal-methods.interface';
import { ModalService } from '../../../services/modal.service';
import { LoaderService } from '../../../services/loader.service';
import { CountryController, UserController } from '../../../_generated/services';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Paginator } from 'primeng/paginator';
import { ICountryDto, IEnumProvider } from '../../../_generated/interfaces';
import { Providers } from '../../../_generated/providers';

@Component({
  selector: 'app-find-lifters-modal',
  imports: [FormsModule, ReactiveFormsModule, Paginator],
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
  

  constructor(
    private router: Router,
    private fb: FormBuilder,

    private userController: UserController,
    private countryController: CountryController,

    private modalService: ModalService,
    private loaderService: LoaderService,
    private providers: Providers
  ) {
    this.genders = this.providers.getUserGenders();
    this.ageRanges = this.providers.getAgeRanges();
  }

  ngOnInit(): void {
    this.formInit();

    this.countryController.GetList().toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.countries = _.data;
        }
      });
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

  // events

  onCountryChanged(event: any) {
    const selectedId = Number(event.target.value);
    const country = this.countries.find(c => c.id === selectedId);
    this.selectedIso2 = country?.isO2 ?? null;

    this.form.get('countryId')?.setValue(selectedId);
  }
}
