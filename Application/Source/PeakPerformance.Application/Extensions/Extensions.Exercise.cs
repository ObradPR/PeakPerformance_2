using PeakPerformance.Application.Dtos.Exercises;
using PeakPerformance.Domain.ExerciseDbApiMap;

namespace PeakPerformance.Application.Extensions;

public static partial class Extensions
{
    public static (bool IsCardio, bool IsBodyweight, bool IsStrength) Classify(this WorkoutExerciseDto exercise)
    {
        var equipment = exercise?.EquipmentName?.ToLower() ?? string.Empty;
        var bp = exercise.BodyParts?.Select(_ => _.ToLower()).ToList() ?? [];

        if (bp.Contains("cardio"))
        {
            return (true, false, false);
        }

        if (ExerciseDbApiMap.BodyweightEquipments.Contains(equipment))
        {
            return (false, true, false);
        }

        return (false, false, true);
    }

    public static eMuscleGroup ToMuscleGroupFlags(this string[] groups)
    {
        var flags = eMuscleGroup.None;

        foreach (var muscle in groups)
        {
            if (ExerciseDbApiMap.MuscleGroups.TryGetValue(muscle, out var muscleGroup))
                flags |= muscleGroup;
        }

        return flags;
    }
}