import { Routes } from '@angular/router';
import { RouteConstants } from './constants';

export const routes: Routes = [
    ///
    /// AUTH
    ///
    {
        path: RouteConstants.ROUTE_LOG_IN,
        // canActivate: [authGuard],
        title: RouteConstants.TITLE_LOG_IN,
        loadComponent: () => import('./pages/auth/log-in/log-in').then(_ => _.LogIn)
    }
    ///
    /// Error Pages
    ///
    // {
    //     path: RouteConstants.ROUTE_NOT_FOUND,
    //     title: RouteConstants.TITLE_NOT_FOUND,
    //     loadComponent: () =>
    //         import('./pages/errors/not-found/not-found.component').then(_ => _.NotFoundComponent),
    // },
    // {
    //     path: RouteConstants.ROUTE_UNAUTHORIZED,
    //     title: RouteConstants.TITLE_UNAUTHORIZED,
    //     loadComponent: () =>
    //         import('./pages/errors/unauthorized/unauthorized.component').then(_ => _.UnauthorizedComponent),
    // },
    // {
    //     path: '**',
    //     redirectTo: RouteConstants.ROUTE_NOT_FOUND,
    //     pathMatch: 'full',
    // },
];
