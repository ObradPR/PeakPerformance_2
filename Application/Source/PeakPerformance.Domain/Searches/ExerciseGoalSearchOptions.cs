namespace PeakPerformance.Domain.Searches;

public class ExerciseGoalSearchOptions : SearchOptions
{
    public long? UserId { get; set; }

    public long? ExerciseId { get; set; }

    public eChartTimespan? ChartTimespanId { get; set; }
}