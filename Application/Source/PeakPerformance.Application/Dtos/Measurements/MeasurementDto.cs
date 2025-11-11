namespace PeakPerformance.Application.Dtos.Measurements;

public class MeasurementDto
{
    public string Id { get; set; }

    [Display(Name = "Body part")]
    public eBodyPart BodyPartId { get; set; }

    public decimal Size { get; set; }

    [Display(Name = "Measurement unit")]
    public eMeasurementUnit MeasurementUnitId { get; set; }

    [Display(Name = "Log date")]
    public DateTime? LogDate { get; set; }
}