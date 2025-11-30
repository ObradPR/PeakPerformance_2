import { NgClass } from '@angular/common';
import { Component, input } from '@angular/core';

@Component({
  selector: 'app-short-info-stats',
  imports: [NgClass],
  templateUrl: './short-info-stats.html',
  styleUrl: './short-info-stats.css'
})
export class ShortInfoStats {
  name = input<string>('');
  value = input<number | string | undefined>(0);
  diff = input<number | undefined>(0);
  templateAddon = input<string>('');
}
