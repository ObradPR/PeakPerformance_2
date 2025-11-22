export class Functions {
    static toPounds(kg: number): number {
        return Number((kg * 2.20462).toFixed(1));
    }

    static toKilograms(lbs: number): number {
        return Number((lbs / 2.20462).toFixed(1));
    }

    static toInches(cm: number): number {
        return Number((cm / 2.54).toFixed(1));
    }

    static toCentimeters(inch: number): number {
        return Number((inch * 2.54).toFixed(1));
    }

    static inchesToFeet(inches: number): number {
        const feet = Math.floor(inches / 12);
        const remainingInches = inches % 12;

        // Format: feet.inches (e.g., 5.11)
        const formatted = Number(`${feet}.${remainingInches.toFixed(0)}`);
        return formatted;
    }

    static feetToInches(value: number): number {
        return Number((value * 12).toFixed(2));;
    }

    static formatRequestDates(data: any): void {
        // Ignore things that aren't objects.
        if (typeof data !== 'object')
            return data;

        for (let key in data) {
            if (data.hasOwnProperty(key)) {
                const value = data[key];

                if (value instanceof Date) {
                    data[key] = value.toISOString();
                } else if (typeof value === 'object') {
                    this.formatRequestDates(value);
                }
            }
        }
    }

    static appendFormData(formData: FormData, data: any, parentKey = '') {
        for (const key in data) {
            if (data.hasOwnProperty(key)) {
                const value = data[key];
                const fullKey = parentKey ? `${parentKey}.${key}` : key;

                if (value instanceof Date) {
                    formData.append(fullKey, value.toISOString());
                }
                else if (typeof value === 'object' && value != null) {
                    this.appendFormData(formData, value, fullKey);
                }
                else {
                    if (value !== null && value !== undefined) {
                        formData.append(fullKey, value as any);
                    }
                }
            }
        }
    }
}