namespace PeakPerformance.Application.Dtos.Bodyweights;

public class BodyweightDto
{
    public long Id { get; set; }

    [Display(Name = "Weight")]
    public decimal Value { get; set; }

    [Display(Name = "Weight unit")]
    public eMeasurementUnit WeightUnitId { get; set; }

    [Display(Name = "Body fat percentage")]
    public decimal? BodyFatPercentage { get; set; }

    [Display(Name = "Log date")]
    public DateTime? LogDate { get; set; }

    // methods

    public void ToModel(Bodyweight model, long userId)
    {
        model.Value = Value;
        model.WeightUnitId = WeightUnitId;
        model.BodyFatPercentage = BodyFatPercentage;
        model.LogDate = LogDate ?? DateTime.UtcNow;
        model.UserId = userId;
    }
}