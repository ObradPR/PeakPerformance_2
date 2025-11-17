namespace PeakPerformance.Application.Dtos.Users;

public class ChangePasswordDto
{
    [Display(Name = "Old password")]
    public string OldPassword { get; set; }

    [Display(Name = "New password")]
    public string NewPassword { get; set; }

    [Display(Name = "Repeat password")]
    public string RepeatPassword { get; set; }
}