import { Injectable, Pipe, PipeTransform } from '@angular/core';
import { Providers } from '../_generated/providers';
import { IEnumProvider } from '../_generated/interfaces';

@Pipe({
  name: 'enumName',
  standalone: true
})
@Injectable({
  providedIn: 'root'
})
export class EnumNamePipe implements PipeTransform {
  private cache = new Map<string, IEnumProvider[]>();

  constructor(private providers: Providers) { }

  transform(value: number | null | undefined, enumName: string): string {
    if (value == null || value == undefined || !enumName) return '';

    if (!this.cache.has(enumName)) {
      // Build method name dynamically
      const methodName = `get${enumName}` as keyof Providers;

      // Check if Providers actually has this method
      const method = this.providers[methodName];
      if (typeof method !== 'function') {
        console.warn(`EnumNamePipe: No provider method "${methodName}" found.`);
        return '';
      }

      this.cache.set(enumName, method.call(this.providers));
    }

    // Call it and get list
    const list = this.cache.get(enumName)!;
    const obj = list.find(_ => _.id === value);
    return obj ? obj.description : '';
  }

}
