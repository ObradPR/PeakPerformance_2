namespace PeakPerformance.Application.Dtos.Users;

public class RegistrationDto
{
    [Display(Name = "Full name")]
    public string FullName { get; set; }

    public string Username { get; set; }

    public string Email { get; set; }

    public string Password { get; set; }

    [Display(Name = "Confirm password")]
    public string ConfirmPassword { get; set; }

    [Display(Name = "Date of birth")]
    public DateTime? DateOfBirth { get; set; }

    // methods

    public void ToModel(User user, IUserManager userManager)
    {
        user.FullName = FullName;
        user.Username = Username;
        user.Email = Email;
        user.Password = userManager.HashPassword(Password);
        user.DateOfBirth = DateOfBirth.Value;

        user.UserRoles.Add(new UserRole
        {
            RoleId = eSystemRole.User
        });

        user.UserMeasurementPreferences.Add(new UserMeasurementPreference
        {
            WeightUnitId = eMeasurementUnit.Kilograms,
            MeasurementUnitId = eMeasurementUnit.Centimeters,
        });
    }
}