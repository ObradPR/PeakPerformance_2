using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class Measurement : BaseAuditedDomain<long>, IConfigurableEntity
{
    public long UserId { get; set; }

    public eBodyPart BodyPartId { get; set; }

    public decimal Size { get; set; }

    public eMeasurementUnit MeasurementUnitId { get; set; }

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
        builder.Entity<Measurement>(_ =>
        {
            _.Property(_ => _.Size).IsRequired().HasPrecision(4, 1);
        });
    }
}