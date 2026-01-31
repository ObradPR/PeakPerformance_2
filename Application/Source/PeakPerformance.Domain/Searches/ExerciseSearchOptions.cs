namespace PeakPerformance.Domain.Searches;

public class ExerciseSearchOptions : SearchOptions
{
    public long? UserId { get; set; }

    public eChartTimespan? ChartTimespanId { get; set; }

    public long[] ExerciseIds { get; set; }

    public bool? TakeSelectedExercises { get; set; }
}