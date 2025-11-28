import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { DateTime } from 'luxon';
import { IRegistrationDto } from '../../../_generated/interfaces';
import { AuthController } from '../../../_generated/services';
import { ValidationDirective } from '../../../directives/validation.directive';
import { AuthService } from '../../../services/auth.service';
import { LoaderService } from '../../../services/loader.service';
import { ToastService } from '../../../services/toast.service';
import { BaseValidationComponent } from '../../_base/base.component/base-validation.component';

@Component({
  selector: 'app-register',
  imports: [CommonModule, FormsModule, ReactiveFormsModule, ValidationDirective, RouterLink],
  templateUrl: './register.html',
  styleUrl: './register.css'
})
export class Register extends BaseValidationComponent implements OnInit {
  override errors: Record<string, string>;
  form: FormGroup;
  minDob: string;
  maxDob: string;

  constructor(
    private fb: FormBuilder,

    private authService: AuthService,
    private toastService: ToastService,
    private loaderService: LoaderService,

    private authController: AuthController,
  ) {
    super();
    this.minDob = DateTime.now().minus({ years: 80 }).toISODate();
    this.maxDob = DateTime.now().minus({ years: 14 }).toISODate();
  }

  ngOnInit(): void {
    this.formInit();
  }

  private formInit() {
    this.form = this.fb.group({
      username: [''],
      fullName: [''],
      email: [''],
      password: [''],
      confirmPassword: [''],
      dateOfBirth: [null]
    });
  }

  onRegister() {
    this.loaderService.showPageLoader();

    const data: IRegistrationDto = this.form.value;

    this.authController.Registration(data).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.authService.setUser(_.data);
          this.toastService.showSuccess('Success', 'Successfully registered');
        }
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => this.loaderService.hidePageLoader());
  }
}
