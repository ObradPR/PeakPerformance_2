namespace PeakPerformance.Application.Dtos.BodyweightGoals;

public class BodyweightGoalDto
{
    public long Id { get; set; }

    [Display(Name = "Target")]
    public decimal Target { get; set; }

    [Display(Name = "Weight unit")]
    public eMeasurementUnit WeightUnitId { get; set; }

    [Display(Name = "Start date")]
    public DateTime StartDate { get; set; }

    [Display(Name = "End date")]
    public DateTime EndDate { get; set; }

    // methods

    public void ToModel(BodyweightGoal model, long userId)
    {
        model.Target = Target;
        model.WeightUnitId = WeightUnitId;
        model.StartDate = StartDate;
        model.EndDate = EndDate;
        model.UserId = userId;
    }
}