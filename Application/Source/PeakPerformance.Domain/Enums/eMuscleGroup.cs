namespace PeakPerformance.Domain.Enums;

[Flags]
public enum eMuscleGroup
{
    [Description("")]
    None = 0,

    Back = 1 << 0,
    Arms = 1 << 1,
    Chest = 1 << 2,
    Shoulders = 1 << 3,
    Legs = 1 << 4,
    Core = 1 << 5,
}