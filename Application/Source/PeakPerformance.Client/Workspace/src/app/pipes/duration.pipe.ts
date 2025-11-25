import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'duration'
})
export class DurationPipe implements PipeTransform {

  transform(value: string | null | undefined): string {
    if (!value) return '';

    // value is something like "1:10:00"
    const [hours, minutes] = value.split(':').map(Number);

    let result = '';

    if (hours > 0) result += `${hours}h `;
    if (minutes > 0) result += `${minutes}m`;

    return result.trim();
  }

}
