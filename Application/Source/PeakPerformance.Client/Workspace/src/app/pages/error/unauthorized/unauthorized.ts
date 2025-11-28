import { Component } from '@angular/core';

@Component({
  selector: 'app-unauthorized',
  imports: [],
  template: `
    <div class="error-page-container">
      <h1>401</h1>
      <p>Unauthorized Access</p>
    </div>
  `,
  styles: ``
})
export class Unauthorized {

}
