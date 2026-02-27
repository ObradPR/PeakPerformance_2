import { Pipe, PipeTransform } from "@angular/core";
import { DateTime } from "luxon";

@Pipe({
  name: 'age',
  standalone: true,
})
export class AgePipe implements PipeTransform {

  transform(dob: string | Date | null | undefined): string {
    if (!dob) return '';

    return Math.floor(
      DateTime.now().diff(DateTime.fromJSDate(new Date(dob)), 'years').years
    ).toString();
  }
}
