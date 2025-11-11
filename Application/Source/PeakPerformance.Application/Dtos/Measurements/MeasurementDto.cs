namespace PeakPerformance.Application.Dtos.Measurements;

public class MeasurementDto
{
    public long Id { get; set; }

    public decimal? Waist { get; set; }

    public decimal? Hips { get; set; }

    public decimal? Neck { get; set; }

    public decimal? Chest { get; set; }

    public decimal? Shoulders { get; set; }

    [Display(Name = "Right bicep")]
    public decimal? RightBicep { get; set; }

    [Display(Name = "Left bicep")]
    public decimal? LeftBicep { get; set; }

    [Display(Name = "Right forearm")]
    public decimal? RightForearm { get; set; }

    [Display(Name = "Left forearm")]
    public decimal? LeftForearm { get; set; }

    [Display(Name = "Right thigh")]
    public decimal? RightThigh { get; set; }

    [Display(Name = "Left thigh")]
    public decimal? LeftThigh { get; set; }

    [Display(Name = "Right calf")]
    public decimal? RightCalf { get; set; }

    [Display(Name = "Left calf")]
    public decimal? LeftCalf { get; set; }

    [Display(Name = "Measurement unit")]
    public eMeasurementUnit MeasurementUnitId { get; set; }

    // methods

    public void ToModel(Measurement model, long userId)
    {
        model.Waist = Waist;
        model.Hips = Hips;
        model.Neck = Neck;
        model.Chest = Chest;
        model.Shoulders = Shoulders;
        model.RightBicep = RightBicep;
        model.LeftBicep = LeftBicep;
        model.RightForearm = RightForearm;
        model.LeftForearm = LeftForearm;
        model.RightThigh = RightThigh;
        model.LeftThigh = LeftThigh;
        model.RightCalf = RightCalf;
        model.LeftCalf = LeftCalf;
        model.MeasurementUnitId = MeasurementUnitId;
        model.UserId = userId;
    }
}