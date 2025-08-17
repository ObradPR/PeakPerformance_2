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
}
