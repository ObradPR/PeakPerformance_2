import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ILoginDto } from '../../../_generated/interfaces';
import { AuthController } from '../../../_generated/services';
import { ValidationDirective } from '../../../directives/validation.directive';
import { AuthService } from '../../../services/auth.service';
import { LoaderService } from '../../../services/loader.service';
import { ToastService } from '../../../services/toast.service';
import { BaseValidationComponent } from '../../_base/base.component/base-validation.component';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-log-in',
  imports: [CommonModule, FormsModule, ReactiveFormsModule, ValidationDirective, RouterLink],
  templateUrl: './log-in.html',
  styleUrl: './log-in.css'
})
export class LogIn extends BaseValidationComponent implements OnInit {
  override errors: Record<string, string>;
  form: FormGroup;

  constructor(
    private fb: FormBuilder,
    private authController: AuthController,
    private authService: AuthService,
    private toastService: ToastService,
    private loaderService: LoaderService
  ) {
    super();
  }

  ngOnInit(): void {
    this.formInit();
  }

  private formInit() {
    this.form = this.fb.group({
      username: [''],
      password: [''],
    });
  }

  onLogin() {
    this.loaderService.showPageLoader();

    const data: ILoginDto = this.form.value;

    this.authController.Login(data).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.authService.setUser(_.data);
          this.toastService.showSuccess('Success', 'Successfully logged in');
        }
      })
      .catch(ex => this.setErrors(ex))
      .finally(() => this.loaderService.hidePageLoader());
  }
}
