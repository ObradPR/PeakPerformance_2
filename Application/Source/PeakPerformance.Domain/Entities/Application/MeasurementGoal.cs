using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class MeasurementGoal : BaseAuditedDomain<long>, IConfigurableEntity
{
    public long UserId { get; set; }

    public decimal? Waist { get; set; }

    public decimal? Hips { get; set; }

    public decimal? Neck { get; set; }

    public decimal? Chest { get; set; }

    public decimal? Shoulders { get; set; }

    public decimal? RightBicep { get; set; }

    public decimal? LeftBicep { get; set; }

    public decimal? RightForearm { get; set; }

    public decimal? LeftForearm { get; set; }

    public decimal? RightThigh { get; set; }

    public decimal? LeftThigh { get; set; }

    public decimal? RightCalf { get; set; }

    public decimal? LeftCalf { get; set; }

    public eMeasurementUnit MeasurementUnitId { get; set; }

    [Column(TypeName = Constants.DB_TYPE_DATE)]
    public DateTime StartDate { get; set; }

    [Column(TypeName = Constants.DB_TYPE_DATE)]
    public DateTime EndDate { get; set; }

    //
    // Relationships
    //

    #region Relationships

    [ForeignKey(nameof(UserId))]
    public virtual User User { get; set; }

    #endregion Relationships

    //
    // Configuration
    //

    public void Configure(ModelBuilder builder)
    {
        builder.Entity<MeasurementGoal>(_ =>
        {
            _.Property(_ => _.Waist).HasPrecision(4, 1);
            _.Property(_ => _.Hips).HasPrecision(4, 1);
            _.Property(_ => _.Neck).HasPrecision(4, 1);
            _.Property(_ => _.Chest).HasPrecision(4, 1);
            _.Property(_ => _.Shoulders).HasPrecision(4, 1);
            _.Property(_ => _.RightBicep).HasPrecision(4, 1);
            _.Property(_ => _.LeftBicep).HasPrecision(4, 1);
            _.Property(_ => _.RightForearm).HasPrecision(4, 1);
            _.Property(_ => _.LeftForearm).HasPrecision(4, 1);
            _.Property(_ => _.RightThigh).HasPrecision(4, 1);
            _.Property(_ => _.LeftThigh).HasPrecision(4, 1);
            _.Property(_ => _.RightCalf).HasPrecision(4, 1);
            _.Property(_ => _.LeftCalf).HasPrecision(4, 1);
        });
    }
}