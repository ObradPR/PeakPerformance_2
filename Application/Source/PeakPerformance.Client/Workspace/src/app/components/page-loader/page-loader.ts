import { Component, Signal } from '@angular/core';
import { LoaderService } from '../../services/loader.service';

@Component({
  selector: 'app-page-loader',
  standalone: true,
  imports: [],
  template: `
    @if (isVisible()) {
      <div class="backdrop">
        <span class="loader"></span>
      </div>
    }
  `,
  styleUrl: './page-loader.css'
})
export class PageLoader {
  isVisible: Signal<boolean>;

  constructor(private loaderService: LoaderService) {
    this.isVisible = this.loaderService.pageLoaderSignal;
  }
}
