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
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    this.form = this.fb.group({
      reason: ['']
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
