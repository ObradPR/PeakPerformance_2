namespace PeakPerformance.Domain.ExerciseDbApi;

public enum eExerciseDbApiEquipmentType
{
    Cardio,
    Strength,
    Bodyweight
}

public static class ExerciseDbApiEquipmentMap
{
    public static readonly Dictionary<string, eExerciseDbApiEquipmentType> EquipmentTypeMap = new()
    {
        { "stepmill machine", eExerciseDbApiEquipmentType.Cardio },
        { "elliptical machine", eExerciseDbApiEquipmentType.Cardio },
        { "stationary bike", eExerciseDbApiEquipmentType.Cardio },
        { "skierg machine", eExerciseDbApiEquipmentType.Cardio },
        { "upper body ergometer", eExerciseDbApiEquipmentType.Cardio },
        { "rope", eExerciseDbApiEquipmentType.Cardio },

        // Strength (includes machines, weighted, bars, etc.)
        { "trap bar", eExerciseDbApiEquipmentType.Strength },
        { "smith machine", eExerciseDbApiEquipmentType.Strength },
        { "olympic barbell", eExerciseDbApiEquipmentType.Strength },
        { "ez barbell", eExerciseDbApiEquipmentType.Strength },
        { "dumbbell", eExerciseDbApiEquipmentType.Strength },
        { "kettlebell", eExerciseDbApiEquipmentType.Strength },
        { "weighted", eExerciseDbApiEquipmentType.Strength },
        { "sled machine", eExerciseDbApiEquipmentType.Strength },
        { "hammer", eExerciseDbApiEquipmentType.Strength },
        { "medicine ball", eExerciseDbApiEquipmentType.Strength },
        { "leverage machine", eExerciseDbApiEquipmentType.Strength },
        { "cable", eExerciseDbApiEquipmentType.Strength },
        { "tire", eExerciseDbApiEquipmentType.Strength },

        // Bodyweight / bands / balance
        { "body weight", eExerciseDbApiEquipmentType.Bodyweight },
        { "resistance band", eExerciseDbApiEquipmentType.Bodyweight },
        { "band", eExerciseDbApiEquipmentType.Bodyweight },
        { "bosu ball", eExerciseDbApiEquipmentType.Bodyweight },
        { "stability ball", eExerciseDbApiEquipmentType.Bodyweight },
        { "roller", eExerciseDbApiEquipmentType.Bodyweight },
        { "wheel roller", eExerciseDbApiEquipmentType.Bodyweight },
        { "assisted", eExerciseDbApiEquipmentType.Bodyweight },
    };
}