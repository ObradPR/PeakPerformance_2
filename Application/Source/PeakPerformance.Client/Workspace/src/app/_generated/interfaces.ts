import { eUserGender } from './enums';
import { eMeasurementUnit } from './enums';
import { eBodyPart } from './enums';
import { eSetRpeType } from './enums';
import { eSetType } from './enums';
import { eChartTimespan } from './enums';
import { eAgeRange } from './enums';

export interface IAuthorizationDto
{
	token: string;
}
export interface IChangePasswordDto
{
	oldPassword: string;
	newPassword: string;
	repeatPassword: string;
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
	id: number;
	fullName: string;
	username: string;
	email: string;
	dateOfBirth: Date;
	description: string;
	genderId?: eUserGender;
	countryId?: number;
	height?: number;
	heightMeasurementUnitId?: eMeasurementUnit;
	isPrivate?: boolean;
	profilePictureUrl: string;
	weightUnitId: eMeasurementUnit;
	measurementUnitId: eMeasurementUnit;
	isMainDetailsUpdate?: boolean;
	workoutsCount?: number;
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
	waist?: number;
	waistMeasurementUnitId?: eMeasurementUnit;
	chest?: number;
	chestMeasurementUnitId?: eMeasurementUnit;
	thighs?: number;
	thighsMeasurementUnitId?: eMeasurementUnit;
	biceps?: number;
	bicepsMeasurementUnitId?: eMeasurementUnit;
}
export interface IBodyweightGoalDto
{
	id: number;
	target: number;
	weightUnitId: eMeasurementUnit;
	startDate: Date;
	endDate: Date;
}
export interface ICountryDto
{
	id: number;
	isO2: string;
	isO3: string;
	name: string;
}
export interface IExerciseDbApiDataDto
{
	exerciseId: string;
	name: string;
	gifUrl: string;
	targetMuscles: string[];
	bodyParts: string[];
	equipments: string[];
	secondaryMuscles: string[];
	instructions: string[];
}
export interface IExerciseDbApiDto
{
	success: boolean;
	metadata: IExerciseDbApiMetadataDto;
	data: IExerciseDbApiDataDto[];
}
export interface IExerciseDbApiMetadataDto
{
	totalPages?: number;
	totalExercises?: number;
	currentPage?: number;
	previousPage: string;
	nextPage: string;
}
export interface IExerciseDto
{
	id: number;
	apiExerciseId: string;
	name: string;
	equipmentName: string;
	bodyPart: string;
	instructions: string[];
	isCardio?: boolean;
	isBodyweight?: boolean;
	isStrength?: boolean;
	primaryMuscleGroups: string[];
	secondaryMuscleGroups: string[];
}
export interface IExerciseStatsDto
{
	id: number;
	name: string;
	isCardio?: boolean;
	isBodyweight?: boolean;
	isStrength?: boolean;
	bodyweight?: number;
	bodyweightUnitId?: eMeasurementUnit;
	logDate: Date;
	total: IExerciseTotalDto;
}
export interface IExerciseTotalDto
{
	oneRepMax?: number;
	maxWeight?: number;
	totalReps?: number;
	maxReps?: number;
	volume?: number;
	totalCardioTime?: number;
}
export interface IWorkoutExerciseDto
{
	id: number;
	exerciseId?: number;
	apiExerciseId: string;
	name: string;
	equipmentName: string;
	primaryMuscles: string[];
	secondaryMuscles: string[];
	bodyParts: string[];
	isCardio?: boolean;
	isBodyweight?: boolean;
	isStrength?: boolean;
	notes: string;
	order: number;
	workoutId: number;
	primaryMuscleGroupId: number;
	secondaryMuscleGroupId?: number;
	sets: IWorkoutExerciseSetDto[];
}
export interface IExerciseGoalDto
{
	id: number;
	exerciseId: number;
	isStrength?: boolean;
	weight?: number;
	weightUnitId?: eMeasurementUnit;
	reps: number;
	startDate: Date;
	endDate: Date;
}
export interface IFileInformationDto
{
	fileName: string;
	type: string;
	buffer: number[];
	size?: number;
}
export interface ILookupValueDto
{
	id: number;
	name: string;
	description: string;
}
export interface IEnumProvider
{
	id: number;
	name: string;
	description: string;
	bgColor: string;
}
export interface IMeasurementCreateDto
{
	id: number;
	waist?: number;
	hips?: number;
	neck?: number;
	chest?: number;
	shoulders?: number;
	rightBicep?: number;
	leftBicep?: number;
	rightForearm?: number;
	leftForearm?: number;
	rightThigh?: number;
	leftThigh?: number;
	rightCalf?: number;
	leftCalf?: number;
	measurementUnitId: eMeasurementUnit;
	logDate?: Date | null;
}
export interface IMeasurementDto
{
	id: number;
	userId: number;
	bodyPartId: eBodyPart;
	size: number;
	measurementUnitId: eMeasurementUnit;
	logDate?: Date | null;
}
export interface IMeasurementGoalCreateDto
{
	id: number;
	waist?: number;
	hips?: number;
	neck?: number;
	chest?: number;
	shoulders?: number;
	rightBicep?: number;
	leftBicep?: number;
	rightForearm?: number;
	leftForearm?: number;
	rightThigh?: number;
	leftThigh?: number;
	rightCalf?: number;
	leftCalf?: number;
	measurementUnitId: eMeasurementUnit;
	startDate: Date;
	endDate: Date;
}
export interface IMeasurementGoalDto
{
	id: number;
	bodyPartId: eBodyPart;
	size: number;
	measurementUnitId: eMeasurementUnit;
	startDate: Date;
	endDate: Date;
}
export interface IMuscleGroupTotalVolumeDto
{
	name: string;
	volume?: number;
}
export interface ITotalDto
{
	sets?: number;
	setsDiff?: number;
	reps?: number;
	repsDiff?: number;
	volume?: number;
	volumeDiff?: number;
	cardioTime?: number;
	cardioTimeDiff?: number;
}
export interface IWorkoutDto
{
	id: number;
	userId: number;
	name: string;
	notes: string;
	copiedFromId?: number;
	logDate: Date;
	startAt?: any;
	finishAt?: any;
	bodyweight?: number;
	bodyweightUnitId?: eMeasurementUnit;
	isCompleted?: boolean;
	exercises: IWorkoutExerciseDto[];
	total: ITotalDto;
	displayName: string;
	durationTime?: any;
	previousWorkoutId?: number;
	nextWorkoutId?: number;
	muscleGroupsTotalVolume: IMuscleGroupTotalVolumeDto[];
	previousWorkoutTotal: ITotalDto;
}
export interface IWorkoutLogDto
{
	id: number;
	logDate: Date;
	name: string;
}
export interface IWorkoutExerciseSetDto
{
	id: number;
	workoutExerciseId: number;
	weight?: number;
	weightUnitId?: eMeasurementUnit;
	reps?: number;
	rpeTypeId?: eSetRpeType;
	typeId?: eSetType;
	rest?: number;
	notes: string;
	order: number;
	durationMinutes?: number;
	sets: number;
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
export interface IExerciseGoalSearchOptions extends ISearchOptions
{
	userId?: number;
	exerciseId?: number;
	chartTimespanId?: eChartTimespan;
}
export interface IExerciseSearchOptions extends ISearchOptions
{
	userId?: number;
	chartTimespanId?: eChartTimespan;
	exerciseIds: number[];
}
export interface IMeasurementGoalSearchOptions extends ISearchOptions
{
	userId?: number;
	fromDate?: Date | null;
	toDate?: Date | null;
	chartTimespanId?: eChartTimespan;
}
export interface IMeasurementSearchOptions extends ISearchOptions
{
	userId?: number;
	fromDate?: Date | null;
	toDate?: Date | null;
	chartTimespanId?: eChartTimespan;
}
export interface IUserSearchOptions extends ISearchOptions
{
	userId?: number;
	genderId?: eUserGender;
	ageRangeId?: eAgeRange;
	countryId?: number;
}
export interface IWorkoutSearchOptions extends ISearchOptions
{
	id?: number;
	userId?: number;
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
