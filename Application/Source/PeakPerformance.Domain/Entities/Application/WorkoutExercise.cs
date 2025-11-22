using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class WorkoutExercise : BaseAuditedDomain<long>
{
    public long WorkoutId { get; set; }

    public long ExerciseId { get; set; }

    public string Notes { get; set; }

    //
    // Relationships
    //

    #region Relationships

    [ForeignKey(nameof(WorkoutId))]
    public virtual Workout Workout { get; set; }

    [ForeignKey(nameof(ExerciseId))]
    public virtual Exercise Exercise { get; set; }

    [InverseProperty(nameof(WorkoutExerciseSet.WorkoutExercise))]
    public virtual ICollection<WorkoutExerciseSet> WorkoutExerciseSets { get; set; } = [];

    #endregion Relationships
}