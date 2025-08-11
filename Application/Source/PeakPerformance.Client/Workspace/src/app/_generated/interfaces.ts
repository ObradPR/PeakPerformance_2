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
