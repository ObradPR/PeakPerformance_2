using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class ExerciseGoal : BaseAuditedDomain<long>
{
    public long ExerciseId { get; set; }

    public long UserId { get; set; }

    public decimal? Weight { get; set; }

    public eMeasurementUnit? WeightUnitId { get; set; }

    public int Reps { get; set; }

    [Column(TypeName = Constants.DB_TYPE_DATE)]
    public DateTime StartDate { get; set; }

    [Column(TypeName = Constants.DB_TYPE_DATE)]
    public DateTime EndDate { get; set; }

    //
    // Relationships
    //

    #region Relationships

    [ForeignKey(nameof(ExerciseId))]
    public virtual Exercise Exercise { get; set; }

    [ForeignKey(nameof(UserId))]
    public virtual User User { get; set; }

    #endregion Relationships
}