using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class BodyweightGoal : BaseAuditedDomain<long>, IConfigurableEntity
{
    public long UserId { get; set; }

    public decimal Target { get; set; }

    public eMeasurementUnit WeightUnitId { get; set; }

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
        builder.Entity<BodyweightGoal>(_ =>
        {
            _.Property(_ => _.Target).HasPrecision(4, 1).IsRequired();
        });
    }
}