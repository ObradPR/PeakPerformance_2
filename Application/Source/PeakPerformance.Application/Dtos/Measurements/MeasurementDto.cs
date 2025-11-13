namespace PeakPerformance.Application.Dtos.Measurements;

public class MeasurementDto
{
    public long Id { get; set; }

    public long UserId { get; set; }

    [Display(Name = "Body part")]
    public eBodyPart BodyPartId { get; set; }

    public decimal Size { get; set; }

    [Display(Name = "Measurement unit")]
    public eMeasurementUnit MeasurementUnitId { get; set; }

    [Display(Name = "Log date")]
    public DateTime? LogDate { get; set; }

    // methods

    public void ToModel(Measurement model)
    {
        model.BodyPartId = BodyPartId;
        model.Size = Size;
        model.MeasurementUnitId = MeasurementUnitId;
        model.LogDate = LogDate ?? DateTime.UtcNow;
    }
}