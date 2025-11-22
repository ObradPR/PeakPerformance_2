using PeakPerformance.Domain.Attributes;

namespace PeakPerformance.Domain.Enums;

public enum eSetRpe
{
    [BgColor("#64C8C8")] // teal
    [Description("Very light")]
    Rpe_1 = 1,

    [BgColor("#4FC0E0")] // light blue
    [Description("Light")]
    Rpe_2 = 2,

    [BgColor("#3DA9A9")] // blue-green
    [Description("Moderate")]
    Rpe_3 = 3,

    [BgColor("#7AC74F")] // light green
    [Description("Somewhat heavy")]
    Rpe_4 = 4,

    [BgColor("#FFD93D")] // yellow
    [Description("Heavy")]
    Rpe_5 = 5,

    [BgColor("#FFA500")] // orange
    [Description("6")]
    Rpe_6 = 6,

    [BgColor("#FF4500")] // red-orange
    [Description("Very heavy")]
    Rpe_7 = 7,

    [BgColor("#FF0000")] // red
    [Description("8")]
    Rpe_8 = 8,

    [BgColor("#B22222")] // dark red
    [Description("9")]
    Rpe_9 = 9,

    [BgColor("#800000")] // maroon / almost max
    [Description("Very, very heavy (almost max)")]
    Rpe_10 = 10,
}