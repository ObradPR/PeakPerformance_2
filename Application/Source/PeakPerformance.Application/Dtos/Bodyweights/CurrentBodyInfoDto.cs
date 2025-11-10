namespace PeakPerformance.Application.Dtos.Bodyweights;

public class CurrentBodyInfoDto
{
    public decimal? Bodyweight { get; set; }

    public eMeasurementUnit? BodyweightUnitId { get; set; }

    public decimal? BodyweightGoal { get; set; }

    public eMeasurementUnit? BodyweightGoalUnitId { get; set; }

    public decimal? BodyFatPercentage { get; set; }
}