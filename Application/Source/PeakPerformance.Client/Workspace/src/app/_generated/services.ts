import { Injectable } from '@angular/core';
import { HttpParams, HttpClient } from '@angular/common/http';
import { SettingsService } from '../services/settings.service';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { IResponseWrapper } from './interfaces';
import { IAuthorizationDto } from './interfaces';
import { IRegistrationDto } from './interfaces';
import { ILoginDto } from './interfaces';
import { ICurrentBodyInfoDto } from './interfaces';
import { IPagingResult } from './interfaces';
import { IBodyweightDto } from './interfaces';
import { IBodyweightSearchOptions } from './interfaces';
import { IBaseResponseWrapper } from './interfaces';
import { IBodyweightGoalDto } from './interfaces';
import { IBodyweightGoalSearchOptions } from './interfaces';
import { ICountryDto } from './interfaces';
import { IExerciseStatsDto } from './interfaces';
import { IExerciseSearchOptions } from './interfaces';
import { IExerciseDto } from './interfaces';
import { IWorkoutExerciseDto } from './interfaces';
import { IBaseExerciseDto } from './interfaces';
import { IExerciseGoalDto } from './interfaces';
import { IExerciseGoalSearchOptions } from './interfaces';
import { IMeasurementDto } from './interfaces';
import { IMeasurementSearchOptions } from './interfaces';
import { IMeasurementCreateDto } from './interfaces';
import { IMeasurementGoalDto } from './interfaces';
import { IMeasurementGoalSearchOptions } from './interfaces';
import { IMeasurementGoalCreateDto } from './interfaces';
import { IWorkoutExerciseSetDto } from './interfaces';
import { IUserDto } from './interfaces';
import { IUserSearchOptions } from './interfaces';
import { IChangePasswordDto } from './interfaces';
import { IWorkoutDto } from './interfaces';
import { IWorkoutSearchOptions } from './interfaces';
import { IWorkoutLogDto } from './interfaces';

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
	public GetCurrentBodyweightInfo() : Observable<IResponseWrapper<ICurrentBodyInfoDto> | null>
	{
		return this.httpClient.get<IResponseWrapper<ICurrentBodyInfoDto>>(
		this.settingsService.createApiUrl('Bodyweight/GetCurrentBodyweightInfo'),
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Search(options: IBodyweightSearchOptions) : Observable<IResponseWrapper<IPagingResult<IBodyweightDto>> | null>
	{
		const body = <any>options;
		return this.httpClient.post<IResponseWrapper<IPagingResult<IBodyweightDto>>>(
		this.settingsService.createApiUrl('Bodyweight/Search'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Save(data: IBodyweightDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Bodyweight/Save'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
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
	constructor (httpClient: HttpClient, settingsService: SettingsService)
	{
		super(httpClient, settingsService);
	}
}
@Injectable({ providedIn: 'root' }) export class BodyweightGoalController extends BaseController
{
	public Search(options: IBodyweightGoalSearchOptions) : Observable<IResponseWrapper<IPagingResult<IBodyweightGoalDto>> | null>
	{
		const body = <any>options;
		return this.httpClient.post<IResponseWrapper<IPagingResult<IBodyweightGoalDto>>>(
		this.settingsService.createApiUrl('BodyweightGoal/Search'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Save(data: IBodyweightGoalDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('BodyweightGoal/Save'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Delete(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('BodyweightGoal/Delete'),
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
@Injectable({ providedIn: 'root' }) export class CountryController extends BaseController
{
	public GetList() : Observable<IResponseWrapper<ICountryDto[]> | null>
	{
		return this.httpClient.get<IResponseWrapper<ICountryDto[]>>(
		this.settingsService.createApiUrl('Country/GetList'),
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public GetSingle(id: number) : Observable<IResponseWrapper<ICountryDto> | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.get<IResponseWrapper<ICountryDto>>(
		this.settingsService.createApiUrl('Country/GetSingle'),
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
@Injectable({ providedIn: 'root' }) export class ExerciseController extends BaseController
{
	public Search(options: IExerciseSearchOptions) : Observable<IResponseWrapper<IPagingResult<IExerciseStatsDto>> | null>
	{
		const body = <any>options;
		return this.httpClient.post<IResponseWrapper<IPagingResult<IExerciseStatsDto>>>(
		this.settingsService.createApiUrl('Exercise/Search'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public GetList(options: IExerciseSearchOptions) : Observable<IResponseWrapper<IPagingResult<IExerciseDto>> | null>
	{
		const body = <any>options;
		return this.httpClient.post<IResponseWrapper<IPagingResult<IExerciseDto>>>(
		this.settingsService.createApiUrl('Exercise/GetList'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public GetSingle(id: number) : Observable<IResponseWrapper<IExerciseDto> | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.get<IResponseWrapper<IExerciseDto>>(
		this.settingsService.createApiUrl('Exercise/GetSingle'),
		{
			params: new HttpParams({ fromObject: body }),
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Save(data: IWorkoutExerciseDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Exercise/Save'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Delete(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Exercise/Delete'),
		{
			params: new HttpParams({ fromObject: body }),
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public GetSelectedExercises(userId: number) : Observable<IResponseWrapper<IBaseExerciseDto[]> | null>
	{
		const body = <any>{'userId': userId};
		return this.httpClient.get<IResponseWrapper<IBaseExerciseDto[]>>(
		this.settingsService.createApiUrl('Exercise/GetSelectedExercises'),
		{
			params: new HttpParams({ fromObject: body }),
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Select(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>id;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Exercise/Select'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Remove(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Exercise/Remove'),
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
@Injectable({ providedIn: 'root' }) export class ExerciseGoalController extends BaseController
{
	public Search(options: IExerciseGoalSearchOptions) : Observable<IResponseWrapper<IPagingResult<IExerciseGoalDto>> | null>
	{
		const body = <any>options;
		return this.httpClient.post<IResponseWrapper<IPagingResult<IExerciseGoalDto>>>(
		this.settingsService.createApiUrl('ExerciseGoal/Search'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Save(data: IExerciseGoalDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('ExerciseGoal/Save'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Delete(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('ExerciseGoal/Delete'),
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
@Injectable({ providedIn: 'root' }) export class MeasurementController extends BaseController
{
	public GetCurrentMeasurementInfo() : Observable<IResponseWrapper<ICurrentBodyInfoDto> | null>
	{
		return this.httpClient.get<IResponseWrapper<ICurrentBodyInfoDto>>(
		this.settingsService.createApiUrl('Measurement/GetCurrentMeasurementInfo'),
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Search(options: IMeasurementSearchOptions) : Observable<IResponseWrapper<IPagingResult<IMeasurementDto>> | null>
	{
		const body = <any>options;
		return this.httpClient.post<IResponseWrapper<IPagingResult<IMeasurementDto>>>(
		this.settingsService.createApiUrl('Measurement/Search'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Create(data: IMeasurementCreateDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Measurement/Create'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Update(data: IMeasurementDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Measurement/Update'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Delete(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Measurement/Delete'),
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
@Injectable({ providedIn: 'root' }) export class MeasurementGoalController extends BaseController
{
	public Search(options: IMeasurementGoalSearchOptions) : Observable<IResponseWrapper<IPagingResult<IMeasurementGoalDto>> | null>
	{
		const body = <any>options;
		return this.httpClient.post<IResponseWrapper<IPagingResult<IMeasurementGoalDto>>>(
		this.settingsService.createApiUrl('MeasurementGoal/Search'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Create(data: IMeasurementGoalCreateDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('MeasurementGoal/Create'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Update(data: IMeasurementGoalDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('MeasurementGoal/Update'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Delete(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('MeasurementGoal/Delete'),
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
@Injectable({ providedIn: 'root' }) export class SetController extends BaseController
{
	public Save(data: IWorkoutExerciseSetDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Set/Save'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Delete(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Set/Delete'),
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
	public GetSingle(id: number) : Observable<IResponseWrapper<IUserDto> | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.get<IResponseWrapper<IUserDto>>(
		this.settingsService.createApiUrl('User/GetSingle'),
		{
			params: new HttpParams({ fromObject: body }),
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Search(options: IUserSearchOptions) : Observable<IResponseWrapper<IPagingResult<IUserDto>> | null>
	{
		const body = <any>options;
		return this.httpClient.post<IResponseWrapper<IPagingResult<IUserDto>>>(
		this.settingsService.createApiUrl('User/Search'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public UpdatePersonalDetails(data: IUserDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('User/UpdatePersonalDetails'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public UpdateProfilePicture(userId: FormData) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>userId;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('User/UpdateProfilePicture'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public UpdateMeasurementUnits(data: IUserDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('User/UpdateMeasurementUnits'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public ChangePassword(data: IChangePasswordDto) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>data;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('User/ChangePassword'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Deactivate() : Observable<IBaseResponseWrapper | null>
	{
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('User/Deactivate'),
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public DeleteProfilePicture() : Observable<IBaseResponseWrapper | null>
	{
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('User/DeleteProfilePicture'),
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
@Injectable({ providedIn: 'root' }) export class WorkoutController extends BaseController
{
	public GetSingle(options: IWorkoutSearchOptions) : Observable<IResponseWrapper<IWorkoutDto> | null>
	{
		const body = <any>options;
		return this.httpClient.post<IResponseWrapper<IWorkoutDto>>(
		this.settingsService.createApiUrl('Workout/GetSingle'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public GetRecent() : Observable<IResponseWrapper<IWorkoutDto[]> | null>
	{
		return this.httpClient.get<IResponseWrapper<IWorkoutDto[]>>(
		this.settingsService.createApiUrl('Workout/GetRecent'),
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public GetAllWorkoutLogs(userId: number) : Observable<IResponseWrapper<IWorkoutLogDto[]> | null>
	{
		const body = <any>{'userId': userId};
		return this.httpClient.get<IResponseWrapper<IWorkoutLogDto[]>>(
		this.settingsService.createApiUrl('Workout/GetAllWorkoutLogs'),
		{
			params: new HttpParams({ fromObject: body }),
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Search(options: IWorkoutSearchOptions) : Observable<IResponseWrapper<IPagingResult<IWorkoutDto>> | null>
	{
		const body = <any>options;
		return this.httpClient.post<IResponseWrapper<IPagingResult<IWorkoutDto>>>(
		this.settingsService.createApiUrl('Workout/Search'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Save(data: IWorkoutDto) : Observable<IResponseWrapper<number> | null>
	{
		const body = <any>data;
		return this.httpClient.post<IResponseWrapper<number>>(
		this.settingsService.createApiUrl('Workout/Save'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public UpdateCompleteStatus(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>id;
		return this.httpClient.post<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Workout/UpdateCompleteStatus'),
		body,
		{
			responseType: 'json',
			observe: 'response',
			withCredentials: true
		})
		.pipe(map(response => response.body));
		
	}
	public Delete(id: number) : Observable<IBaseResponseWrapper | null>
	{
		const body = <any>{'id': id};
		return this.httpClient.delete<IBaseResponseWrapper>(
		this.settingsService.createApiUrl('Workout/Delete'),
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
