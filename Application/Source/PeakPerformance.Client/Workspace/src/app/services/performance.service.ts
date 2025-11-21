import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class PerformanceService {

  start(key: string) {
    performance.mark(key + '-start');
  }

  end(key: string) {
    performance.mark(key + '-end');
    performance.measure(key, key + '-start', key + '-end');

    const result = performance.getEntriesByName(key)[0];
    console.log(`${key} took: ${result.duration} ms`);
  }
}
