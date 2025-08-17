import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SharedService {
  // Nunmber

  roundToNearestTen(value: number): number {
    return Math.round(value / 10) * 10;
  }

  // Date

  getLocalDate(value: Date | null | undefined): Date {
    if (!value)
      return new Date();

    const date = new Date(value as Date);
    return new Date(date.getTime() - date.getTimezoneOffset() * 60000);
  }
}
