namespace PeakPerformance.Application.Dtos.ExerciseGoals;

public class ExerciseGoalDto
{
    public long Id { get; set; }

    public long ExerciseId { get; set; }

    public bool? IsStrength { get; set; }

    public decimal? Weight { get; set; }

    public eMeasurementUnit? WeightUnitId { get; set; }

    public int Reps { get; set; }

    [Display(Name = "Start date")]
    public DateTime StartDate { get; set; }

    [Display(Name = "End date")]
    public DateTime EndDate { get; set; }

    // methods

    public void ToModel(ExerciseGoal model, long userId)
    {
        model.ExerciseId = ExerciseId;
        model.UserId = userId;
        model.Weight = Weight;
        model.WeightUnitId = WeightUnitId;
        model.Reps = Reps;
        model.StartDate = StartDate;
        model.EndDate = EndDate;
    }
}