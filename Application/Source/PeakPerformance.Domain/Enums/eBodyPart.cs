using PeakPerformance.Domain.Attributes;

namespace PeakPerformance.Domain.Enums;

public enum eBodyPart
{
    [BgColor("#FF6B6B")]
    [Description("Waist")]
    Waist = 1,

    [BgColor("#FFA94D")]
    [Description("Hips")]
    Hips = 2,

    [BgColor("#FFD43B")]
    [Description("Neck")]
    Neck = 3,

    [BgColor("#69DB7C")]
    [Description("Chest")]
    Chest = 4,

    [BgColor("#38D9A9")]
    [Description("Shoulders")]
    Shoulders = 5,

    [BgColor("#4DABF7")]
    [Description("Right bicep")]
    RightBicep = 6,

    [BgColor("#74C0FC")]
    [Description("Left bicep")]
    LeftBicep = 7,

    [BgColor("#9775FA")]
    [Description("Right forearm")]
    RightForearm = 8,

    [BgColor("#B197FC")]
    [Description("Left forearm")]
    LeftForearm = 9,

    [BgColor("#F783AC")]
    [Description("Right thigh")]
    RightThigh = 10,

    [BgColor("#F8C2D8")]
    [Description("Left thigh")]
    LeftThigh = 11,

    [BgColor("#ADB5BD")]
    [Description("Right calf")]
    RightCalf = 12,

    [BgColor("#CED4DA")]
    [Description("Left calf")]
    LeftCalf = 13
}