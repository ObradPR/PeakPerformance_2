using PeakPerformance.Application.Dtos.Sets;

namespace PeakPerformance.Application.Dtos.Exercises;

public class WorkoutExerciseDto
{
    public long Id { get; set; }

    public long? ExerciseId { get; set; }

    public string ApiExerciseId { get; set; }

    public string Name { get; set; }

    public string EquipmentName { get; set; }

    public string[] PrimaryMuscles { get; set; }

    public string[] SecondaryMuscles { get; set; }

    public List<string> BodyParts { get; set; }

    public bool? IsCardio { get; set; }

    public bool? IsBodyweight { get; set; }

    public bool? IsStrength { get; set; }

    public string Notes { get; set; }

    public int Order { get; set; }

    [Display(Name = "Workout")]
    public long WorkoutId { get; set; }

    public List<WorkoutExerciseSetDto> Sets { get; set; }

    // method

    public void ToModel(WorkoutExercise model, long userId)
    {
        model.WorkoutId = WorkoutId;
        model.Notes = Notes;
        model.Order = Order;
    }
}