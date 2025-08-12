import { computed, Injectable, signal } from '@angular/core';
import { IAuthorizationDto, IUserDto } from '../_generated/interfaces';
import { UserController } from '../_generated/services';
import { LoaderService } from './loader.service';
import { StorageService } from './storage.service';
import { Constants, RouteConstants } from '../constants';
import { DateTime } from 'luxon';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  currentUserSource = signal<IUserDto | null>(null);
  isAuthenticated = computed(() => !!this.currentUserSource());

  constructor(
    private router: Router,
    private userController: UserController,
    private loaderService: LoaderService,
    private storageService: StorageService,
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

  setUser(data: IAuthorizationDto) {
    this.setToken(data.token);

    const token = this.getToken();

    if (token) {
      this.router.navigateByUrl(RouteConstants.ROUTE_HOME);
      this.loadCurrentUser();
    }
  }

  // JWT TOKEN

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

  signOut() {
    this.storageService.remove(Constants.AUTH_TOKEN);
    this.currentUserSource.set(null);
    this.router.navigateByUrl(RouteConstants.ROUTE_AUTH);
  }
}
