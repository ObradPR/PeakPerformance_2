namespace PeakPerformance.Domain.Searches;

public class UserSearchOptions : SearchOptions
{
    public long? UserId { get; set; }

    public eUserGender? GenderId { get; set; }

    public eAgeRange? AgeRangeId { get; set; }

    public long? CountryId { get; set; }

    public bool? IncludeCurrent { get; set; }
}