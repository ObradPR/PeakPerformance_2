import { Injectable, signal } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class LoaderService {
  private pageLoader = signal<boolean>(false);
  readonly pageLoaderSignal = this.pageLoader.asReadonly();

  // Page Loader
  showPageLoader() {
    this.pageLoader.set(true);
  }
  hidePageLoader() {
    this.pageLoader.set(false);
  }
}
