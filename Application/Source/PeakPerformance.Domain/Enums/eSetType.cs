namespace PeakPerformance.Domain.Enums;

public enum eSetType
{
    [Description("Warmup")]
    Warmup = 1,

    [Description("Normal")]
    Normal = 2,

    [Description("Failure")]
    Failure = 3,
}