namespace PeakPerformance.Application.Dtos.Sets;

public class WorkoutExerciseSetDto
{
    public long Id { get; set; }

    public long WorkoutExerciseId { get; set; }

    public decimal? Weight { get; set; }

    public eMeasurementUnit? WeightUnitId { get; set; }

    public int Reps { get; set; }

    [Display(Name = "Rpe")]
    public eSetRpeType? RpeTypeId { get; set; }

    [Display(Name = "Type")]
    public eSetType? TypeId { get; set; }

    public int? Rest { get; set; }

    public string Notes { get; set; }

    public int Order { get; set; }

    public int Sets { get; set; } = 1;

    // method

    public void ToModel(WorkoutExerciseSet model, long userId)
    {
        model.WorkoutExerciseId = WorkoutExerciseId;
        model.Weight = Weight;
        model.WeightUnitId = WeightUnitId;
        model.Reps = Reps;
        model.RpeTypeId = RpeTypeId == 0 ? null : RpeTypeId;
        model.TypeId = TypeId == 0 ? null : TypeId;
        model.Rest = Rest;
        model.Notes = Notes;
        model.Order = Order.IsEmpty() ? 1 : Order;
    }
}