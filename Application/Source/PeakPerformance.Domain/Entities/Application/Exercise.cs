using PeakPerformance.Domain.Entities._Base;
using PeakPerformance.Domain.ExerciseDbApiMap;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class Exercise : BaseDomain<long>, IConfigurableEntity
{
    public string ApiExerciseId { get; set; }

    public string Name { get; set; }

    public string EquipmentName { get; set; }

    public string BodyPart { get; set; }

    public string Instructions { get; set; }

    public bool? IsCardio { get; set; }

    public bool? IsBodyweight { get; set; }

    public bool? IsStrength { get; set; }

    public eMuscleGroup PrimaryMuscleGroupId { get; set; }

    public eMuscleGroup? SecondaryMuscleGroupId { get; set; }

    //
    // Relationships
    //

    #region Relationships

    [InverseProperty(nameof(WorkoutExercise.Exercise))]
    public virtual ICollection<WorkoutExercise> WorkoutExercises { get; set; } = [];

    [InverseProperty(nameof(ExerciseGoal.Exercise))]
    public virtual ICollection<ExerciseGoal> ExerciseGoals { get; set; } = [];

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

    // methods

    public string[] ParseInstructions()
    {
        if (Instructions.IsNullOrEmpty())
            return [];

        try
        {
            return Instructions.DeserializeJsonObject<string[]>();
        }
        catch
        {
            return [];
        }
    }
}