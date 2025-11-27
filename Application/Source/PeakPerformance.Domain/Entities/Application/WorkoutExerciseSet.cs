using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class WorkoutExerciseSet : BaseAuditedDomain<long>, IConfigurableEntity
{
    public long WorkoutExerciseId { get; set; }

    public decimal? Weight { get; set; }

    public eMeasurementUnit? WeightUnitId { get; set; }

    public int Reps { get; set; }

    public eSetRpeType? RpeTypeId { get; set; }

    public eSetType? TypeId { get; set; }

    public int? Rest { get; set; }

    public string Notes { get; set; }

    public int Order { get; set; }

    // Adittional Weight / MeasurementUntiId
    // Cardio stats, and others
    // Later on maybe we will need to store and type of exercise so that we can change the structure of dat user can input for a set/exercise
    // maybe we can store that on the WorkoutExercise level or Exercise

    //
    // Relationships
    //

    #region Relationships

    [ForeignKey(nameof(WorkoutExerciseId))]
    public virtual WorkoutExercise WorkoutExercise { get; set; }

    #endregion Relationships

    //
    // Configuration
    //

    public void Configure(ModelBuilder builder)
    {
        builder.Entity<WorkoutExerciseSet>(_ =>
        {
            _.Property(_ => _.Reps).IsRequired();
        });
    }
}