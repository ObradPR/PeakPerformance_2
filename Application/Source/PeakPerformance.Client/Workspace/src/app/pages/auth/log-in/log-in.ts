import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ILoginDto } from '../../../_generated/interfaces';
import { AuthController } from '../../../_generated/services';
import { AuthService } from '../../../services/auth.service';
import { LoaderService } from '../../../services/loader.service';
import { ToastService } from '../../../services/toast.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-log-in',
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './log-in.html',
  styleUrl: './log-in.css'
})
export class LogIn implements OnInit {
  form: FormGroup;

  constructor(
    private fb: FormBuilder,
    private authController: AuthController,
    private authService: AuthService,
    private toastService: ToastService,
    private loaderService: LoaderService
  ) {
    this.form = this.fb.group({});
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
        if (_) {
          this.authService.setUser(_.data);
          this.toastService.showSuccess('Success', 'Successfully logged in');
        }
      })
      .catch(ex => {
        console.log(ex);
      })
      .finally(() => this.loaderService.hidePageLoader());
  }
}
