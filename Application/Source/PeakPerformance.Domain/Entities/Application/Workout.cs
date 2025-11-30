using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class Workout : BaseAuditedDomain<long>, IConfigurableEntity
{
    public long UserId { get; set; }

    public string Name { get; set; }

    public string Notes { get; set; }

    public long? CopiedFromId { get; set; }

    [Column(TypeName = Constants.DB_TYPE_DATE)]
    public DateTime LogDate { get; set; }

    public TimeOnly? StartAt { get; set; }

    public TimeOnly? FinishAt { get; set; }

    public decimal? Bodyweight { get; set; }

    public eMeasurementUnit? BodyweightUnitId { get; set; }

    public bool? IsCompleted { get; set; }

    //
    // Relationships
    //

    #region Relationships

    [ForeignKey(nameof(UserId))]
    public virtual User User { get; set; }

    [ForeignKey(nameof(CopiedFromId))]
    public virtual Workout CopiedFromWorkout { get; set; }

    [InverseProperty(nameof(WorkoutExercise.Workout))]
    public virtual ICollection<WorkoutExercise> WorkoutExercises { get; set; } = [];

    #endregion Relationships

    //
    // Configuration
    //

    public void Configure(ModelBuilder builder)
    {
        builder.Entity<Workout>(_ =>
        {
            _.Property(_ => _.Name).IsRequired();
        });
    }
}