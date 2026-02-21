import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { UserController } from '../../../_generated/services';
import { AuthService } from '../../../services/auth.service';
import { LoaderService } from '../../../services/loader.service';
import { IModalMethods } from '../interfaces/modal-methods.interface';
import { ModalService } from '../../../services/modal.service';
import { IDeactivateReasonDto } from '../../../_generated/interfaces';

@Component({
  selector: 'app-deactivate-user-modal',
  imports: [FormsModule, ReactiveFormsModule],
  templateUrl: './deactivate-user-modal.html',
  styleUrl: './deactivate-user-modal.css'
})
export class DeactivateUserModal implements IModalMethods, OnInit {
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;

  userId: number = 0;

  isActivation: boolean = false;

  constructor(
    private fb: FormBuilder,

    private userController: UserController,

    private loaderService: LoaderService,
    private authService: AuthService,
    private modalService: ModalService,
  ) { }

  ngOnInit(): void {
    this.formInit();
    this.userId = this.modalService.userIdSignal();
    if (this.modalService.deactivateReasonSignal())
      this.isActivation = true;
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    this.form = this.fb.group({
      reason: [this.modalService.deactivateReasonSignal()]
    });
  }

  activate() {
    this.loaderService.showPageLoader();

    this.userController.ActivateUser(this.userId).toPromise()
      .then(_ => {
        if(_?.isSuccess)
          this.modalService.hideDeactivateUserModal();

      })
      .catch(ex => { throw ex; })
      .finally(() => {
        this.loaderService.hidePageLoader();
      });
  }

  submit() {
    this.loaderService.showPageLoader();

    let method;

    if (this.userId) {
      const payload = {
        ...this.form.value,
        userId: this.userId
      } as IDeactivateReasonDto;
      method = this.userController.DeactivateUser(payload);
    }
    else {
      method = this.userController.Deactivate(this.form.value);
    }

    method.toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          if (!this.userId)
            this.authService.signOut();

          this.modalService.hideDeactivateUserModal();
        }
      })
      .catch(ex => { throw ex; })
      .finally(() => {
        this.loaderService.hidePageLoader();
      });
  }
}
