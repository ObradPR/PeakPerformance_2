namespace PeakPerformance.Application.Dtos.Exercises;

public class ExerciseDto
{
    public long Id { get; set; }

    public string ApiExerciseId { get; set; }

    public string Name { get; set; }

    public string EquipmentName { get; set; }

    public string BodyPart { get; set; }

    public string[] Instructions { get; set; }

    public bool? IsCardio { get; set; }

    public bool? IsBodyweight { get; set; }

    public bool? IsStrength { get; set; }

    public string[] PrimaryMuscleGroups { get; set; }

    public string[] SecondaryMuscleGroups { get; set; }
}