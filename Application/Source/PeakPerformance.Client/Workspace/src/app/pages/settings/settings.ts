import { Component, effect, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DateTime } from 'luxon';
import { finalize, take } from 'rxjs';
import { eMeasurementUnit } from '../../_generated/enums';
import { ICountryDto, IEnumProvider, IUserDto } from '../../_generated/interfaces';
import { Providers } from '../../_generated/providers';
import { CountryController, UserController } from '../../_generated/services';
import { ValidationDirective } from '../../directives/validation.directive';
import { Functions } from '../../functions';
import { AuthService } from '../../services/auth.service';
import { FileUploadService } from '../../services/file-upload.service';
import { LoaderService } from '../../services/loader.service';
import { BaseValidationComponent } from '../_base/base.component/base-validation.component';
import { ModalService } from '../../services/modal.service';
import { Router } from '@angular/router';
import { NgClass } from '@angular/common';

@Component({
  selector: 'app-settings',
  imports: [FormsModule, ReactiveFormsModule, ValidationDirective, NgClass],
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
  showPasswords = false;

  // Units of measure
  formMeasurements: FormGroup<any>;
  measurementUnits: IEnumProvider[] = [];
  lbsId: eMeasurementUnit = 0;
  kgId: eMeasurementUnit = 0;
  cmId: eMeasurementUnit = 0;
  inId: eMeasurementUnit = 0;

  // Sharing Settings
  formSharingSettings: FormGroup<any>;

  // Profile Picture
  formProfilePicture: FormGroup<any>;

  previewImage: string | null = null;
  originalImage: string | null = null;
  hasUnsavedChange = false;

  constructor(
    private fb: FormBuilder,
    private router: Router,

    private authService: AuthService,
    private providers: Providers,
    private loaderService: LoaderService,
    private fileUploadService: FileUploadService,
    private modalService: ModalService,

    private countryController: CountryController,
    private userController: UserController,
  ) {
    super();

    effect(() => {
      const user = this.authService.currentUserSource();

      if (user) {
        this.user = user;
        this.formsInit();

        this.updateHeightUnit();
        this.updatePicture();

        this.selectedIso2 = this.countries.find(_ => _.id === this.user?.countryId)?.isO2 ?? null;
      }
    })

    this.genders = this.providers.getUserGenders();
    this.measurementUnits = this.providers.getMeasurementUnits();

    this.lbsId = this.getMeasurementId('lbs');
    this.kgId = this.getMeasurementId('kg');
    this.cmId = this.getMeasurementId('cm');
    this.inId = this.getMeasurementId('in');

    this.minDob = DateTime.now().minus({ years: 80 }).toISODate();
    this.maxDob = DateTime.now().minus({ years: 14 }).toISODate();
  }

  ngOnInit(): void {
    this.countryController.GetList().toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.countries = _.data
          this.selectedIso2 = this.countries.find(_ => _.id === this.user?.countryId)?.isO2 ?? null;
        }
      });
  }

  formsInit() {
    this.formInit_PersonalDetails();
    this.formInit_Email();
    this.formInit_Password();
    this.formInit_Measurements();
    this.formInit_SharingSettings();
    this.formInit_ProfilePicture();
  }

  updateHeightUnit() {
    this.userHeightMeasurementPreference = this.measurementUnits.find(_ => _.id === this.user?.measurementUnitId)!.description;
    if (this.userHeightMeasurementPreference === 'in')
      this.userHeightMeasurementPreference = 'ft';
  }

  updatePicture() {
    this.originalImage = this.user?.profilePictureUrl ?? null;
    this.previewImage = this.originalImage;
  }

  // events

  onCountryChanged(event: any) {
    const selectedId = Number(event.target.value);
    const country = this.countries.find(c => c.id === selectedId);
    this.selectedIso2 = country?.isO2 ?? null;
  }

  onFileSelected(event: any) {
    const file: File = event.target.files[0];
    if (!file) return;

    this.formProfilePicture.patchValue({ profileImage: file });
    this.hasUnsavedChange = true;

    // Load preview
    const reader = new FileReader();
    reader.onload = () => this.previewImage = reader.result as string;
    reader.readAsDataURL(file);
  }

  cancelChanges() {
    this.previewImage = this.originalImage;
    this.formProfilePicture.patchValue({ profileImage: null });
    this.hasUnsavedChange = false;
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
  }

  submitPersonalDetails(form: FormGroup, isMainForm: boolean = false) {
    this.loaderService.showPageLoader();

    const payload = {
      ...this.user,
      ...form.value,
      isPrivate: this.formSharingSettings.value.isPrivate === 1,
      isMainDetailsUpdate: isMainForm,
    };

    if (isMainForm) {
      if (this.user?.heightMeasurementUnitId) {
        if (this.user?.measurementUnitId !== this.user?.heightMeasurementUnitId) {
          if (this.user?.measurementUnitId === eMeasurementUnit.Centimeters) {
            // dont do anythign, since we presented this in cm (as measurementUnitId is cm)
          }
          else if (this.user?.measurementUnitId === eMeasurementUnit.Inches) {
            // if we presented to feets just return them back to inches
            payload.height = Functions.feetToInches(payload.height);
          }
        }
        else {
          if (this.user?.measurementUnitId === eMeasurementUnit.Inches) {
            payload.height = Functions.feetToInches(payload.height);
          }
        }
      }
      else {
        if (this.user?.measurementUnitId === eMeasurementUnit.Inches) {
          payload.height = Functions.feetToInches(payload.height!);
        }
      }
  
      payload.height = payload.height <= 0 ? null : payload.height;
    } 

    this.userController.UpdatePersonalDetails(payload).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.authService.loadCurrentUser();
          this.cleanErrors();
        }
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => this.loaderService.hidePageLoader());
  }

  getHeightValue(): number | undefined {
    let value = this.user?.height;

    if (this.user?.heightMeasurementUnitId) {
      if (this.user?.measurementUnitId !== this.user?.heightMeasurementUnitId) {
        if (this.user?.measurementUnitId === eMeasurementUnit.Inches) {
          value = Functions.toInches(value!);
          value = Functions.inchesToFeet(value);
        }
        else if (this.user?.measurementUnitId === eMeasurementUnit.Centimeters) {
          value = Functions.toCentimeters(value!);
        }
      }
      else if (this.user?.measurementUnitId === eMeasurementUnit.Inches) {
        value = Functions.inchesToFeet(value!);
      }
    }
    else {
      if (this.user?.measurementUnitId === eMeasurementUnit.Inches) {
        console.log('usao u else', value);
        value = Functions.feetToInches(value!);
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
        if (_?.isSuccess) {
          this.formPassword.reset();
          this.cleanErrors();
        }
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

  // Password

  formInit_SharingSettings() {
    this.formSharingSettings = this.fb.group({
      isPrivate: [this.user?.isPrivate ? 1 : 0]
    });
  }

  togglePasswordsVisibility() {
    this.showPasswords = !this.showPasswords;
  }

  // Profile Picture

  formInit_ProfilePicture() {
    this.formProfilePicture = this.fb.group({
      profileImage: [null]
    });
  }

  submitProfilePicture() {
    const file = this.formProfilePicture.value.profileImage;
    if (!file) return;

    this.loaderService.showPageLoader();
    this.fileUploadService.upload('/User/UpdateProfilePicture', file, { userId: this.user!.id })
      .pipe(
        take(1),
        finalize(() => this.loaderService.hidePageLoader())
      ).subscribe({
        next: () => {
          this.authService.loadCurrentUser();
          this.originalImage = this.previewImage;
          this.hasUnsavedChange = false;
        }
      });
  }

  deletePicture() {
    this.loaderService.showPageLoader();

    this.userController.DeleteProfilePicture().toPromise()
      .then(_ => {
        if (_?.isSuccess)
          this.authService.loadCurrentUser(); // + show modal for success
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => this.loaderService.hidePageLoader());
  }

  // Deactivating Account

  onAccountDeactivating() {
    const ok = window.confirm(
      `Deactivate your account?\n\nYour profile will be hidden and you won't be able to access anything until you reactivate.`
    );

    if (!ok) return;

    this.modalService.showDeactivateUserModal();
  }

  // Activating Account

  onAccountActivating() {
    this.loaderService.showPageLoader();

    this.userController.Activate().toPromise()
      .then(_ => {
        if(_?.isSuccess)
          this.router.navigateByUrl('/', { skipLocationChange: true })
            .then(() => this.authService.loadCurrentUser(true));
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => this.loaderService.hidePageLoader());
  }
}
