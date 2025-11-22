namespace PeakPerformance.Application.Extensions;

public static partial class Extensions
{
    /// <summary>
    /// Number of pounds in one kilogram.
    /// </summary>
    private const decimal KilogramsToPounds = 2.20462m;

    /// <summary>
    /// Number of centimeters in one inch.
    /// </summary>
    private const decimal InchesToCentimeters = 2.54m;

    private static readonly Dictionary<eMeasurementUnit, Func<decimal, eMeasurementUnit, decimal>> conversions =
        new()
        {
            { eMeasurementUnit.Kilograms,       (value, preferredUnit) => preferredUnit == eMeasurementUnit.Pounds      ? value.ToPounds()      : value },
            { eMeasurementUnit.Pounds,          (value, preferredUnit) => preferredUnit == eMeasurementUnit.Kilograms   ? value.ToKilograms()   : value },
            { eMeasurementUnit.Centimeters,     (value, preferredUnit) => preferredUnit == eMeasurementUnit.Inches      ? value.ToInches()      : value },
            { eMeasurementUnit.Inches,          (value, preferredUnit) => preferredUnit == eMeasurementUnit.Centimeters ? value.ToCentimeters() : value },
        };

    public static decimal ConvertUnitValue(this decimal value, eMeasurementUnit valueUnitId, eMeasurementUnit preferredUnitId)
        => conversions[valueUnitId](value, preferredUnitId);

    public static decimal ToPounds(this decimal kilos)
        => Math.Round(kilos * KilogramsToPounds, 1);

    public static decimal ToKilograms(this decimal pounds)
        => Math.Round(pounds / KilogramsToPounds, 1);

    public static decimal ToInches(this decimal centimeters)
        => Math.Round(centimeters / InchesToCentimeters, 1);

    public static decimal ToCentimeters(this decimal inches)
        => Math.Round(inches * InchesToCentimeters, 1);
}