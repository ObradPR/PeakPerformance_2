namespace PeakPerformance.Api.ReinforcedTypings;

public enum Providers
{
    [EnumProvider<eMeasurementUnit>]
    MeasurementUnits,

    [EnumProvider<eChartTimespan>]
    ChartTimespans,

    [EnumProvider<eBodyPart>]
    BodyParts,

    [EnumProvider<eUserGender>]
    UserGenders,

    [EnumProvider<eSetRpeType>]
    SetRpeTypes,

    [EnumProvider<eSetType>]
    SetTypes,

    [EnumProvider<eAgeRange>]
    AgeRanges,
}