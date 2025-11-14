import { Injectable, signal } from '@angular/core';

@Injectable({
    providedIn: 'root'
})
export class MeasurementService {

    // Chart - Measurement
    private measurements = signal<boolean>(false);
    readonly measurementsSignal = this.measurements.asReadonly();

    triggerMeasurements() {
        this.measurements.set(!this.measurements());
    }
}
