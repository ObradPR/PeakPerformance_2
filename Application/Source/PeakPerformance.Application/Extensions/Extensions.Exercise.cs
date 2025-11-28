using PeakPerformance.Application.Dtos.Exercises;

namespace PeakPerformance.Application.Extensions;

public static partial class Extensions
{
    private static readonly string[] bodyweightEquipmentMap = ["body weight", "resistance band", "band", "bosu ball", "stability ball", "roller", "wheel roller", "assisted"];

    public static (bool IsCardio, bool IsBodyweight, bool IsStrength) Classify(this WorkoutExerciseDto exercise)
    {
        var equipment = exercise?.EquipmentName?.ToLower() ?? string.Empty;
        var bp = exercise.BodyParts?.Select(_ => _.ToLower()).ToList() ?? [];

        if (bp.Contains("cardio"))
        {
            return (true, false, false);
        }

        if (bodyweightEquipmentMap.Contains(equipment))
        {
            return (false, true, false);
        }

        return (false, false, true);
    }
}