namespace PeakPerformance.Application.Dtos.Bodyweights;

public class CurrentBodyInfoDto
{
    public decimal? Bodyweight { get; set; }

    public eMeasurementUnit? BodyweightUnitId { get; set; }

    public decimal? BodyweightGoal { get; set; }

    public eMeasurementUnit? BodyweightGoalUnitId { get; set; }

    public decimal? BodyFatPercentage { get; set; }

    // Measurements

    public decimal? Waist { get; set; }

    public eMeasurementUnit? WaistMeasurementUnitId { get; set; }

    public decimal? Chest { get; set; }

    public eMeasurementUnit? ChestMeasurementUnitId { get; set; }

    public decimal? Thighs { get; set; }

    public eMeasurementUnit? ThighsMeasurementUnitId { get; set; }

    public decimal? Biceps { get; set; }

    public eMeasurementUnit? BicepsMeasurementUnitId { get; set; }
}