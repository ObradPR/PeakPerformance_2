export interface IAuthorizationDto
{
	token: string;
}
export interface ILoginDto
{
	username: string;
	password: string;
}
export interface IUserDto
{
	fullName: string;
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
