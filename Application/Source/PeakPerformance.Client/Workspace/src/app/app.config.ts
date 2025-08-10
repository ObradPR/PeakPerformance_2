import { ApplicationConfig, provideBrowserGlobalErrorListeners, Provider, provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';

import { routes } from './app.routes';
import { provideHttpClient, withFetch, withInterceptors } from '@angular/common/http';
import './extensions/observable.extension';
import { AuthController, UserController } from './_generated/services';

export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideHttpClient(
      withFetch(),
      // withInterceptors([jwtInterceptor, errorInterceptor])
    ),
    controllersProvider(),
  ]
};


function controllersProvider(): Provider[] {
  return [
    AuthController,
    UserController,
  ];
}