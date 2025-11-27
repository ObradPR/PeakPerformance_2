import { Injectable } from '@angular/core';
import { IEnumProvider } from './interfaces';

@Injectable({ providedIn: 'root' }) export class Providers
{
	getMeasurementUnits() : IEnumProvider[]
	{
		return [
		    { id: 0, name: 'NotSet', description: '', bgColor: '' },
		    { id: 1, name: 'Kilograms', description: 'kg', bgColor: '' },
		    { id: 2, name: 'Pounds', description: 'lbs', bgColor: '' },
		    { id: 3, name: 'Centimeters', description: 'cm', bgColor: '' },
		    { id: 4, name: 'Inches', description: 'in', bgColor: '' }
		];
	}
	getChartTimespans() : IEnumProvider[]
	{
		return [
		    { id: 3, name: 'Last3Months', description: 'Last 3 Months', bgColor: '' },
		    { id: 6, name: 'Last6Months', description: 'Last 6 Months', bgColor: '' },
		    { id: 12, name: 'Last12Months', description: 'Last 12 Months', bgColor: '' },
		    { id: 100, name: 'AllTime', description: 'All Time', bgColor: '' }
		];
	}
	getBodyParts() : IEnumProvider[]
	{
		return [
		    { id: 1, name: 'Waist', description: 'Waist', bgColor: '#FF6B6B' },
		    { id: 2, name: 'Hips', description: 'Hips', bgColor: '#FFA94D' },
		    { id: 3, name: 'Neck', description: 'Neck', bgColor: '#FFD43B' },
		    { id: 4, name: 'Chest', description: 'Chest', bgColor: '#69DB7C' },
		    { id: 5, name: 'Shoulders', description: 'Shoulders', bgColor: '#38D9A9' },
		    { id: 6, name: 'RightBicep', description: 'Right bicep', bgColor: '#4DABF7' },
		    { id: 7, name: 'LeftBicep', description: 'Left bicep', bgColor: '#74C0FC' },
		    { id: 8, name: 'RightForearm', description: 'Right forearm', bgColor: '#9775FA' },
		    { id: 9, name: 'LeftForearm', description: 'Left forearm', bgColor: '#B197FC' },
		    { id: 10, name: 'RightThigh', description: 'Right thigh', bgColor: '#F783AC' },
		    { id: 11, name: 'LeftThigh', description: 'Left thigh', bgColor: '#F8C2D8' },
		    { id: 12, name: 'RightCalf', description: 'Right calf', bgColor: '#ADB5BD' },
		    { id: 13, name: 'LeftCalf', description: 'Left calf', bgColor: '#CED4DA' }
		];
	}
	getUserGenders() : IEnumProvider[]
	{
		return [
		    { id: 0, name: 'NotSet', description: '', bgColor: '' },
		    { id: 1, name: 'Male', description: 'Male', bgColor: '' },
		    { id: 2, name: 'Female', description: 'Female', bgColor: '' }
		];
	}
	getSetRpeTypes() : IEnumProvider[]
	{
		return [
		    { id: 0, name: 'NotSet', description: '', bgColor: '' },
		    { id: 1, name: 'Rpe_1', description: 'Very light', bgColor: '#64C8C8' },
		    { id: 2, name: 'Rpe_2', description: 'Light', bgColor: '#4FC0E0' },
		    { id: 3, name: 'Rpe_3', description: 'Moderate', bgColor: '#3DA9A9' },
		    { id: 4, name: 'Rpe_4', description: 'Somewhat heavy', bgColor: '#7AC74F' },
		    { id: 5, name: 'Rpe_5', description: 'Heavy', bgColor: '#FFD93D' },
		    { id: 6, name: 'Rpe_6', description: '6', bgColor: '#FFA500' },
		    { id: 7, name: 'Rpe_7', description: 'Very heavy', bgColor: '#FF4500' },
		    { id: 8, name: 'Rpe_8', description: '8', bgColor: '#FF0000' },
		    { id: 9, name: 'Rpe_9', description: '9', bgColor: '#B22222' },
		    { id: 10, name: 'Rpe_10', description: 'Very, very heavy (almost max)', bgColor: '#800000' }
		];
	}
	getSetTypes() : IEnumProvider[]
	{
		return [
		    { id: 0, name: 'NotSet', description: '', bgColor: '' },
		    { id: 1, name: 'Warmup', description: 'Warmup', bgColor: '' },
		    { id: 2, name: 'Normal', description: 'Normal', bgColor: '' },
		    { id: 3, name: 'Failure', description: 'Failure', bgColor: '' },
		    { id: 4, name: 'Dropset', description: 'Dropset', bgColor: '' }
		];
	}
}
