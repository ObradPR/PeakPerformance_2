import { Component } from '@angular/core';

@Component({
  selector: 'app-base-validation.component',
  imports: [],
  template: '',
  styles: ''
})
export abstract class BaseValidationComponent {
  abstract errors: Record<string, string>;

  protected setErrors(ex: any) {
    if (ex?.error?.errors?.length) {
      this.errors = {};
      for (const err of ex.error.errors)
        this.errors[err.key] = err.value;
    }
  }

  protected cleanErrors() {
    this.errors = {};
  }
}
