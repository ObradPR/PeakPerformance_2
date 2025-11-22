namespace PeakPerformance.Application.Dtos.Sets;

public class WorkoutExerciseSetDto
{
    public long Id { get; set; }

    public long WorkoutExerciseId { get; set; }

    public decimal? Weight { get; set; }

    public eMeasurementUnit? WeightMeasurementUnitId { get; set; }

    public int Reps { get; set; }

    public eSetRpe? RpeTypeId { get; set; }

    public eSetType? TypeId { get; set; }

    public int? Rest { get; set; }

    public string Notes { get; set; }

    // method

    public void ToModel(WorkoutExerciseSet model, long userId)
    {
        model.WorkoutExerciseId = WorkoutExerciseId;
        model.Weight = Weight;
        model.WeightMeasurementUnitId = WeightMeasurementUnitId;
        model.Reps = Reps;
        model.RpeTypeId = RpeTypeId;
        model.TypeId = TypeId;
        model.Rest = Rest.Value; // remove after migration
        model.Notes = Notes;
    }
}