import { Routes } from '@angular/router';
import { RouteConstants } from './constants';

export const routes: Routes = [
    ///
    /// AUTH
    ///
    // {
    //     path: RouteConstants.ROUTE_AUTH,
    //     canActivate: [authGuard],
    //     children: [
    //         {
    //             path: '',
    //             redirectTo: RouteConstants.ROUTE_SIGN_IN,
    //             pathMatch: 'full'
    //         },
    //         {
    //             path: ':type',
    //             title: RouteConstants.TITLE_AUTH,
    //             loadComponent: () =>
    //                 import('./pages/auth/auth.component').then(_ => _.AuthComponent),
    //         }
    //     ],
    // },
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
