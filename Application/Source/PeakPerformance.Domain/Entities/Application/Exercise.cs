using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class Exercise : BaseDomain<long>, IConfigurableEntity
{
    public string ApiExerciseId { get; set; }

    public string Name { get; set; }

    public string EquipmentName { get; set; }

    public bool? IsCardio { get; set; }

    public bool? IsBodyweight { get; set; }

    public bool? IsStrength { get; set; }

    //
    // Relationships
    //

    #region Relationships

    [InverseProperty(nameof(WorkoutExercise.Exercise))]
    public virtual ICollection<WorkoutExercise> WorkoutExercises { get; set; } = [];

    #endregion Relationships

    //
    // Configuration
    //

    public void Configure(ModelBuilder builder)
    {
        builder.Entity<Exercise>(_ =>
        {
            _.HasIndex(_ => _.ApiExerciseId).IsUnique();
            _.Property(_ => _.ApiExerciseId).IsRequired();
            _.HasIndex(_ => _.Name).IsUnique();
            _.Property(_ => _.Name).IsRequired();
        });
    }
}