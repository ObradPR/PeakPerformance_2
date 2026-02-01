namespace PeakPerformance.Application.Dtos.Users;

public class UserDto
{
    public long Id { get; set; }

    public string FullName { get; set; }

    public string Username { get; set; }

    public string Email { get; set; }

    public DateTime DateOfBirth { get; set; }

    public string Description { get; set; }

    public eUserGender? GenderId { get; set; }

    public long? CountryId { get; set; }

    public decimal? Height { get; set; }

    public eMeasurementUnit? HeightMeasurementUnitId { get; set; }

    public bool? IsPrivate { get; set; }

    // Image

    public string ProfilePictureUrl { get; set; }

    // Units

    public eMeasurementUnit WeightUnitId { get; set; }

    public eMeasurementUnit MeasurementUnitId { get; set; }

    // Helpers

    public bool? IsMainDetailsUpdate { get; set; }

    public int? WorkoutsCount { get; set; }

    public bool? IsActive { get; set; }

    // methods

    public void ToModel(User model)
    {
        model.FullName = FullName;
        model.Username = Username;
        model.Email = Email;
        model.DateOfBirth = DateOfBirth;
        model.Description = Description;
        model.GenderId = GenderId;
        model.CountryId = CountryId;
        if (IsMainDetailsUpdate == true)
        {
            model.Height = Height;
            model.HeightMeasurementUnitId = Height == null
              ? null
              : MeasurementUnitId;
        }
        model.IsPrivate = IsPrivate;
    }
}