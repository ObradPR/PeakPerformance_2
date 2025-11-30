namespace PeakPerformance.Application.Dtos.Workouts;

public class TotalDto
{
    public int? Sets { get; set; }

    public int? SetsDiff { get; set; }

    public int? Reps { get; set; }

    public int? RepsDiff { get; set; }

    public decimal? Volume { get; set; }

    public decimal? VolumeDiff { get; set; }

    public int? CardioTime { get; set; }

    public int? CardioTimeDiff { get; set; }
}