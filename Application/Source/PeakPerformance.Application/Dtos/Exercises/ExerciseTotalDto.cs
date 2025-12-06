namespace PeakPerformance.Application.Dtos.Exercises;

public class ExerciseTotalDto
{
    // totals

    public decimal? OneRepMax { get; set; }

    public decimal? MaxWeight { get; set; }

    public int? TotalReps { get; set; }

    public int? MaxReps { get; set; }

    public decimal? Volume { get; set; }

    public int? TotalCardioTime { get; set; }
}