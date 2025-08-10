import { Injectable, signal } from '@angular/core';
import { IUserDto } from '../_generated/interfaces';
import { UserController } from '../_generated/services';
import { LoaderService } from './loader.service';
import { StorageService } from './storage.service';
import { Constants } from '../constants';
import { DateTime } from 'luxon';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  currentUserSource = signal<IUserDto | null>(null);

  constructor(
    private loaderService: LoaderService,
    private storageService: StorageService,
    private userController: UserController,
  ) { }

  loadCurrentUser() {
    const token = this.getToken();
    if (!token) return;

    this.loaderService.showPageLoader();
    this.userController.GetCurrent().toPromise()
      .then(_ => this.currentUserSource.set(_!.data))
      .catch(ex => { throw ex; })
      .finally(() => this.loaderService.hidePageLoader());
  }

  getDecodedToken(token: string) {
    return JSON.parse(atob(token.split('.')[1]));
  }

  setToken(token: string) {
    this.storageService.set(Constants.AUTH_TOKEN, token);
  }

  getToken(): string | null {
    const token = this.storageService.get(Constants.AUTH_TOKEN);
    if (!token)
      return null;

    const decodedToken = this.getDecodedToken(token);
    if (!decodedToken.exp)
      return null;

    const currentTimestamp = DateTime.now().toSeconds();
    if (currentTimestamp >= decodedToken.exp)
      return null;

    return token;
  }
}
