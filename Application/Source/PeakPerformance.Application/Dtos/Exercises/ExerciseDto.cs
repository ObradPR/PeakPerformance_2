namespace PeakPerformance.Application.Dtos.Exercises;

public class ExerciseDto
{
    public long Id { get; set; }

    public string ApiExerciseId { get; set; }

    public string Name { get; set; }

    [Display(Name = "Equipment name")]
    public string EquipmentName { get; set; }

    [Display(Name = "Body part")]
    public string BodyPart { get; set; }

    public string[] Instructions { get; set; }

    public bool? IsCardio { get; set; }

    public bool? IsBodyweight { get; set; }

    public bool? IsStrength { get; set; }

    [Display(Name = "Exercise type")]
    public eExerciseType? ExerciseTypeId { get; set; }

    public string[] PrimaryMuscleGroups { get; set; }

    [Display(Name = "Primary muscle group")]
    public List<eMuscleGroup> PrimaryMuscleGroupIds { get; set; }

    public string[] SecondaryMuscleGroups { get; set; }

    public List<eMuscleGroup> SecondaryMuscleGroupIds { get; set; }

    // Image

    public string PictureUrl { get; set; }

    public bool? RemovePicture { get; set; }

    // methods

    public void ToModel(Exercise model)
    {
        model.Id = Id;
        model.ApiExerciseId = ApiExerciseId;
        model.Name = Name;
        model.EquipmentName = EquipmentName;
        model.BodyPart = BodyPart;
        model.Instructions = Instructions.SerializeJsonObject();

        if (ExerciseTypeId.HasValue)
        {
            if (ExerciseTypeId == eExerciseType.Cardio)
                model.IsCardio = true;
            else if (ExerciseTypeId == eExerciseType.Bodyweight)
                model.IsBodyweight = true;
            else
                model.IsStrength = true;
        }

        foreach (var item in PrimaryMuscleGroupIds)
        {
            model.PrimaryMuscleGroupId |= item;
        }

        if (SecondaryMuscleGroupIds != null && SecondaryMuscleGroupIds.Count > 0)
            model.SecondaryMuscleGroupId = eMuscleGroup.None;

        foreach (var item in SecondaryMuscleGroupIds)
        {
            model.SecondaryMuscleGroupId |= item;
        }
    }
}