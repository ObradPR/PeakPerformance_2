namespace PeakPerformance.Domain.Searches;

public class WorkoutSearchOptions : SearchOptions
{
    public long? Id { get; set; }

    public long? UserId { get; set; }

    public long? ExerciseId { get; set; }
}