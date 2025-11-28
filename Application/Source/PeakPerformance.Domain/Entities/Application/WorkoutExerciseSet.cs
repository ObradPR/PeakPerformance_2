using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class WorkoutExerciseSet : BaseAuditedDomain<long>
{
    public long WorkoutExerciseId { get; set; }

    public decimal? Weight { get; set; }

    public eMeasurementUnit? WeightUnitId { get; set; }

    public int? Reps { get; set; }

    public eSetRpeType? RpeTypeId { get; set; }

    public eSetType? TypeId { get; set; }

    public int? Rest { get; set; }

    public string Notes { get; set; }

    public int Order { get; set; }

    public int? DurationMinutes { get; set; }

    //
    // Relationships
    //

    #region Relationships

    [ForeignKey(nameof(WorkoutExerciseId))]
    public virtual WorkoutExercise WorkoutExercise { get; set; }

    #endregion Relationships
}