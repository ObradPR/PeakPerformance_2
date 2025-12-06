namespace PeakPerformance.Application.Dtos.Exercises;

public class ExerciseStatsDto
{
    public long Id { get; set; }

    public string Name { get; set; }

    public bool? IsCardio { get; set; }

    public bool? IsBodyweight { get; set; }

    public bool? IsStrength { get; set; }

    public decimal? Bodyweight { get; set; }

    public eMeasurementUnit? BodyweightUnitId { get; set; }

    public DateTime LogDate { get; set; } // Workout log date

    public ExerciseTotalDto Total { get; set; }
}