namespace PeakPerformance.Application.Dtos.Workouts;

public class WorkoutDto
{
    public long Id { get; set; }

    public long UserId { get; set; }

    public string Name { get; set; }

    public string Notes { get; set; }

    public long? CopiedFromId { get; set; }

    [Display(Name = "Log date")]
    public DateTime LogDate { get; set; }

    public TimeOnly? StartAt { get; set; }

    public TimeOnly? FinishAt { get; set; }

    public decimal? Bodyweight { get; set; }

    public eMeasurementUnit? BodyweightMeasurementUnitId { get; set; }

    // methods

    public void ToModel(Workout model, long userId)
    {
        model.UserId = userId;
        model.Name = Name;
        model.Notes = Notes;
        model.CopiedFromId = CopiedFromId;
        model.LogDate = LogDate;
        model.StartAt = StartAt;
        model.FinishAt = FinishAt;
        model.Bodyweight = Bodyweight;
        model.BodyweightMeasurementUnitId = BodyweightMeasurementUnitId;
    }
}