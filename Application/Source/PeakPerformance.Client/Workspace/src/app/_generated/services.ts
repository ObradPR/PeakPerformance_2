import { Injectable } from '@angular/core';
import { HttpParams, HttpClient } from '@angular/common/http';
import { SettingsService } from '../services/settings.service';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { IResponseWrapper } from './interfaces';
import { IAuthorizationDto } from './interfaces';
import { IRegistrationDto } from './interfaces';
import { ILoginDto } from './interfaces';
import { IBaseResponseWrapper } from './interfaces';
import { IUserDto } from './interfaces';

@Injectable({ providedIn: 'root' }) export abstract class BaseController
{
	constructor (protected httpClient: HttpClient, protected settingsService: SettingsService) { } 
}
@Injectable({ providedIn: 'root' }) export class AuthController extends BaseController
{
	public Registration(data: IRegistrationDto) : Observable<IResponseWrapper<IAuthorizationDto> | null>
	{
		const body = <any>data;
		return this.httpClient.post<IResponseWrapper<IAuthorizationDto>>(
		this.settingsService.createApiUrl('Auth/Registration'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Login(data: ILoginDto) : Observable<IResponseWrapper<IAuthorizationDto> | null>
	{
		const body = <any>data;
		return this.httpClient.post<IResponseWrapper<IAuthorizationDto>>(
		this.settingsService.createApiUrl('Auth/Login'),
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
@Injectable({ providedIn: 'root' }) export class BodyweightController extends BaseController
{
	public Delete(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Bodyweight/Delete'),
		{
			params: new HttpParams({ fromObject: body }),
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public DeleteGoal(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Bodyweight/DeleteGoal'),
		{
			params: new HttpParams({ fromObject: body }),
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
@Injectable({ providedIn: 'root' }) export class UserController extends BaseController
{
	public GetCurrent() : Observable<IResponseWrapper<IUserDto> | null>
	{
		return this.httpClient.get<IResponseWrapper<IUserDto>>(
		this.settingsService.createApiUrl('User/GetCurrent'),
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
