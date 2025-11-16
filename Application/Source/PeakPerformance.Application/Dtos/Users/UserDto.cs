namespace PeakPerformance.Application.Dtos.Users;

public class UserDto
{
    public string FullName { get; set; }

    public string Username { get; set; }

    public string Email { get; set; }

    public DateTime DateOfBirth { get; set; }

    public string Description { get; set; }

    public eUserGender? GenderId { get; set; }

    public long? CountryId { get; set; }

    public int? Height { get; set; }

    public bool? IsPrivate { get; set; }

    // Units

    public eMeasurementUnit? WeightUnitId { get; set; }

    public eMeasurementUnit? MeasurementUnitId { get; set; }

    // methods

    public void ToModel(User model)
    {
        model.FullName = FullName;
        model.Username = Username;
        model.Email = Email;
        model.GenderId = GenderId;
        model.CountryId = CountryId;
        model.Height = Height;
        model.IsPrivate = IsPrivate;
    }
}