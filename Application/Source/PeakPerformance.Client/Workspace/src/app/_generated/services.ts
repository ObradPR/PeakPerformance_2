import { Injectable } from '@angular/core';
import { HttpParams, HttpClient } from '@angular/common/http';
import { SettingsService } from '../services/settings.service';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { IResponseWrapper } from './interfaces';
import { IAuthorizationDto } from './interfaces';
import { IRegistrationDto } from './interfaces';

@Injectable() export abstract class BaseController
{
	constructor (protected httpClient: HttpClient, protected settingsService: SettingsService) { } 
}
@Injectable() export class AuthController extends BaseController
{
	public Signup(data: IRegistrationDto) : Observable<IResponseWrapper<IAuthorizationDto> | null>
	{
		const body = <any>data;
		return this.httpClient.post<IResponseWrapper<IAuthorizationDto>>(
		this.settingsService.createApiUrl('Auth/Signup'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	constructor (httpClient: HttpClient, settingsService: SettingsService)
	{
		super(httpClient, settingsService);
	}
}
