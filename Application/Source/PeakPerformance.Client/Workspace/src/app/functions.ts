export class Functions {
    static toPounds(kg: number): number {
        return Number((kg * 2.20462).toFixed(1));
    }

    static toKilograms(lbs: number): number {
        return Number((lbs / 2.20462).toFixed(2));
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
}