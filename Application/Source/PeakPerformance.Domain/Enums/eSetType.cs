using PeakPerformance.Domain.Attributes;

namespace PeakPerformance.Domain.Enums;

public enum eSetType
{
    [Description("")]
    NotSet = 0,

    [BgColor("#FFA500")]
    [Description("Warmup")]
    Warmup = 1,

    [Description("Normal")]
    Normal = 2,

    [BgColor("#800000")]
    [Description("Failure")]
    Failure = 3,

    [BgColor("#4FC0E0")]
    [Description("Dropset")]
    Dropset = 4,
}