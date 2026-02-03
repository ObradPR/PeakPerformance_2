import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { UserController } from '../../../_generated/services';
import { AuthService } from '../../../services/auth.service';
import { LoaderService } from '../../../services/loader.service';
import { IModalMethods } from '../interfaces/modal-methods.interface';
import { ModalService } from '../../../services/modal.service';

@Component({
  selector: 'app-deactivate-user-modal',
  imports: [FormsModule, ReactiveFormsModule],
  templateUrl: './deactivate-user-modal.html',
  styleUrl: './deactivate-user-modal.css'
})
export class DeactivateUserModal implements IModalMethods, OnInit {
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;

  constructor(
    private fb: FormBuilder,

    private userController: UserController,

    private loaderService: LoaderService,
    private authService: AuthService,
    private modalService: ModalService,
  ) { }

   ngOnInit(): void {
    this.formInit();
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

    this.userController.Deactivate(this.form.value).toPromise()
      .then(_ => {
        if (_?.isSuccess) {
          this.modalService.hideDeactivateUserModal();
          this.authService.signOut();
        }
      })
      .catch(ex => { throw ex; })
      .finally(() => {
        this.loaderService.hidePageLoader();
      });
  }
}
