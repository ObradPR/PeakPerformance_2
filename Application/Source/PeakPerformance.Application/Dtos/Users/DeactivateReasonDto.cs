namespace PeakPerformance.Application.Dtos.Users;

public class DeactivateReasonDto
{
    public long? UserId { get; set; }

    public string Reason { get; set; }
}