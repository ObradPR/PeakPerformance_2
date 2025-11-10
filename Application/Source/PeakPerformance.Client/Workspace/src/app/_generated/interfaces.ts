import { eMeasurementUnit } from './enums';
import { eChartTimespan } from './enums';

export interface IAuthorizationDto
{
	token: string;
}
export interface ILoginDto
{
	username: string;
	password: string;
}
export interface IRegistrationDto
{
	fullName: string;
	username: string;
	email: string;
	password: string;
	confirmPassword: string;
	dateOfBirth?: Date | null;
}
export interface IUserDto
{
	fullName: string;
	username: string;
	email: string;
	dateOfBirth: Date;
	description: string;
	weightUnitId?: eMeasurementUnit;
	measurementUnitId?: eMeasurementUnit;
}
export interface IBodyweightDto
{
	id: number;
	value: number;
	weightUnitId: eMeasurementUnit;
	bodyFatPercentage?: number;
	logDate?: Date | null;
}
export interface ICurrentBodyInfoDto
{
	bodyweight?: number;
	bodyweightUnitId?: eMeasurementUnit;
	bodyweightGoal?: number;
	bodyweightGoalUnitId?: eMeasurementUnit;
	bodyFatPercentage?: number;
}
export interface IBodyweightGoalDto
{
	id: number;
	target: number;
	weightUnitId: eMeasurementUnit;
	startDate: Date;
	endDate: Date;
}
export interface IEnumProvider
{
	id: number;
	name: string;
	description: string;
}
export interface ILookupValueDto
{
	id: number;
	name: string;
	description: string;
}
export interface IPagingResult<TEntity>
{
	data: TEntity[];
	total: number;
}
export interface ISearchOptions
{
	skip: number;
	take: number;
	sortingOptions: ISortingOptions[];
	filter: string;
	totalCount?: boolean;
}
export interface ISortingOptions
{
	field: string;
	dir: string;
	desc: boolean;
}
export interface IBodyweightSearchOptions extends ISearchOptions
{
	userId?: number;
	fromDate?: Date | null;
	toDate?: Date | null;
	chartTimespanId?: eChartTimespan;
}
export interface IBodyweightGoalSearchOptions extends ISearchOptions
{
	userId?: number;
	fromDate?: Date | null;
	toDate?: Date | null;
	chartTimespanId?: eChartTimespan;
}
export interface IBaseResponseWrapper
{
	isSuccess: boolean;
	errors: IError[];
	code: number;
}
export interface IError
{
	key: string;
	value: string;
}
export interface IResponseWrapper<T> extends IBaseResponseWrapper
{
	data: T;
}
