using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class UserSelectedExercise : BaseDomain<long>
{
    public long UserId { get; set; }

    public long ExerciseId { get; set; }

    //
    // Relationships
    //

    #region Relationships

    [ForeignKey(nameof(UserId))]
    public virtual User User { get; set; }

    [ForeignKey(nameof(ExerciseId))]
    public virtual Exercise Exercise { get; set; }

    #endregion Relationships
}