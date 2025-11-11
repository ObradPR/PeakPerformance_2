using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class MeasurementGoal : BaseAuditedDomain<long>, IConfigurableEntity
{
    public long UserId { get; set; }

    public eBodyPart BodyPartId { get; set; }

    public decimal Size { get; set; }

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
            _.Property(_ => _.Size).IsRequired().HasPrecision(4, 1);
        });
    }
}