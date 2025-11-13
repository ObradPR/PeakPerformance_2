using PeakPerformance.Application.Attributes;
using System.Reflection;

namespace PeakPerformance.Application.Dtos.MeasurementGoals;

public class MeasurementGoalCreateDto
{
    public long Id { get; set; }

    [BodyPart(eBodyPart.Waist)]
    public decimal? Waist { get; set; }

    [BodyPart(eBodyPart.Hips)]
    public decimal? Hips { get; set; }

    [BodyPart(eBodyPart.Neck)]
    public decimal? Neck { get; set; }

    [BodyPart(eBodyPart.Chest)]
    public decimal? Chest { get; set; }

    [BodyPart(eBodyPart.Shoulders)]
    public decimal? Shoulders { get; set; }

    [Display(Name = "Right bicep")]
    [BodyPart(eBodyPart.RightBicep)]
    public decimal? RightBicep { get; set; }

    [Display(Name = "Left bicep")]
    [BodyPart(eBodyPart.LeftBicep)]
    public decimal? LeftBicep { get; set; }

    [Display(Name = "Right forearm")]
    [BodyPart(eBodyPart.RightForearm)]
    public decimal? RightForearm { get; set; }

    [Display(Name = "Left forearm")]
    [BodyPart(eBodyPart.LeftForearm)]
    public decimal? LeftForearm { get; set; }

    [Display(Name = "Right thigh")]
    [BodyPart(eBodyPart.RightThigh)]
    public decimal? RightThigh { get; set; }

    [Display(Name = "Left thigh")]
    [BodyPart(eBodyPart.LeftThigh)]
    public decimal? LeftThigh { get; set; }

    [Display(Name = "Right calf")]
    [BodyPart(eBodyPart.RightCalf)]
    public decimal? RightCalf { get; set; }

    [Display(Name = "Left calf")]
    [BodyPart(eBodyPart.LeftCalf)]
    public decimal? LeftCalf { get; set; }

    [Display(Name = "Measurement unit")]
    public eMeasurementUnit MeasurementUnitId { get; set; }

    [Display(Name = "Start date")]
    public DateTime StartDate { get; set; }

    [Display(Name = "End date")]
    public DateTime EndDate { get; set; }

    // methods

    public List<MeasurementGoal> ToModels(long userId)
    {
        var models = new List<MeasurementGoal>();

        foreach (var prop in typeof(MeasurementGoalCreateDto).GetProperties())
        {
            var attr = prop.GetCustomAttribute<BodyPartAttribute>();
            if (attr != null)
                continue;

            var value = prop.GetValue(this) as decimal?;
            if (value == null)
                continue;

            var model = new MeasurementGoal
            {
                UserId = userId,
                BodyPartId = attr.BodyPart,
                Size = value.Value,
                MeasurementUnitId = MeasurementUnitId,
                StartDate = StartDate,
                EndDate = EndDate,
            };

            models.Add(model);
        }

        return models;
    }
}