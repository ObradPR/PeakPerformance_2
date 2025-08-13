using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class Bodyweight : BaseAuditedDomain<long>, IConfigurableEntity
{
    public long UserId { get; set; }

    public decimal Value { get; set; }

    public eMeasurementUnit WeightUnitId { get; set; }

    public decimal? BodyFatPercentage { get; set; }

    public DateTime LogDate { get; set; }

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
        builder.Entity<Bodyweight>(_ =>
        {
            _.Property(_ => _.Value).HasPrecision(4, 1).IsRequired();
            _.Property(_ => _.BodyFatPercentage).HasPrecision(3, 1);
        });
    }
}