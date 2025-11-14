import { Injectable } from '@angular/core';
import { IEnumProvider } from './interfaces';

@Injectable({ providedIn: 'root' }) export class Providers
{
	getMeasurementUnits() : IEnumProvider[]
	{
		return [
		    { id: 0, name: 'NotSet', description: '' },
		    { id: 1, name: 'Kilograms', description: 'kg' },
		    { id: 2, name: 'Pounds', description: 'lbs' },
		    { id: 3, name: 'Centimeters', description: 'cm' },
		    { id: 4, name: 'Inches', description: 'in' }
		];
	}
	getChartTimespans() : IEnumProvider[]
	{
		return [
		    { id: 3, name: 'Last3Months', description: 'Last 3 Months' },
		    { id: 6, name: 'Last6Months', description: 'Last 6 Months' },
		    { id: 12, name: 'Last12Months', description: 'Last 12 Months' },
		    { id: 100, name: 'AllTime', description: 'All Time' }
		];
	}
	getBodyParts() : IEnumProvider[]
	{
		return [
		    { id: 1, name: 'Waist', description: 'Waist' },
		    { id: 2, name: 'Hips', description: 'Hips' },
		    { id: 3, name: 'Neck', description: 'Neck' },
		    { id: 4, name: 'Chest', description: 'Chest' },
		    { id: 5, name: 'Shoulders', description: 'Shoulders' },
		    { id: 6, name: 'RightBicep', description: 'Right bicep' },
		    { id: 7, name: 'LeftBicep', description: 'Left bicep' },
		    { id: 8, name: 'RightForearm', description: 'Right forearm' },
		    { id: 9, name: 'LeftForearm', description: 'Left forearm' },
		    { id: 10, name: 'RightThigh', description: 'Right thigh' },
		    { id: 11, name: 'LeftThigh', description: 'Left thigh' },
		    { id: 12, name: 'RightCalf', description: 'Right calf' },
		    { id: 13, name: 'LeftCalf', description: 'Left calf' }
		];
	}
}
