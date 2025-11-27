namespace PeakPerformance.Domain.Enums;

public enum eSetType
{
    [Description("")]
    NotSet = 0,

    [Description("Warmup")]
    Warmup = 1,

    [Description("Normal")]
    Normal = 2,

    [Description("Failure")]
    Failure = 3,

    [Description("Dropset")]
    Dropset = 4,
}