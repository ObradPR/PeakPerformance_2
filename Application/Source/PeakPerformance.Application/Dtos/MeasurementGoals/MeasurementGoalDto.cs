namespace PeakPerformance.Application.Dtos.MeasurementGoals;

public class MeasurementGoalDto
{
    public long Id { get; set; }

    [Display(Name = "Body part")]
    public eBodyPart BodyPartId { get; set; }

    public decimal Size { get; set; }

    [Display(Name = "Measurement unit")]
    public eMeasurementUnit MeasurementUnitId { get; set; }

    [Display(Name = "Start date")]
    public DateTime StartDate { get; set; }

    [Display(Name = "End date")]
    public DateTime EndDate { get; set; }

    // methods

    public void ToModel(MeasurementGoal model)
    {
        model.BodyPartId = BodyPartId;
        model.Size = Size;
        model.MeasurementUnitId = MeasurementUnitId;
        model.StartDate = StartDate;
        model.EndDate = EndDate;
    }
}