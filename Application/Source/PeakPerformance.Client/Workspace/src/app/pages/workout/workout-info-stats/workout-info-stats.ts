import { NgClass } from '@angular/common';
import { Component, input } from '@angular/core';

@Component({
  selector: 'app-workout-info-stats',
  imports: [NgClass],
  templateUrl: './workout-info-stats.html',
  styleUrl: './workout-info-stats.css'
})
export class WorkoutInfoStats {
  label = input<string>('');
  value = input<number>(0);
  diff = input<number>(0);

  get iconClass() {
    if (this.diff() === 0) return 'fa-equals';
    if (this.diff() > 0) return 'fa-arrow-up';
    if (this.diff() < 0) return 'fa-arrow-down';
    return 'fa-equals';
  }

  get textClass() {
    if (this.diff() === 0) return 'neutral';
    if (this.diff() > 0) return 'success';
    if (this.diff() < 0) return 'fail';
    return 'neutral';
  }
}
