namespace PeakPerformance.Domain.ValueObjects;

public class CurrentBodyInfo
{
    public decimal? Bodyweight { get; set; }

    public eMeasurementUnit? BodyweightUnitId { get; set; }

    public decimal? BodyweightGoal { get; set; }

    public eMeasurementUnit? BodyweightGoalUnitId { get; set; }

    public decimal? BodyFatPercentage { get; set; }

    // Measurements

    public decimal? Waist { get; set; }

    public decimal? Chest { get; set; }

    public decimal? Thighs { get; set; }

    public decimal? Biceps { get; set; }

    public eMeasurementUnit? MeasurementUnitId { get; set; }
}