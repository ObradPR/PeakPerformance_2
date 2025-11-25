namespace PeakPerformance.Application.Dtos.Exercises;

public class ExerciseDbApiDto
{
    public bool Success { get; set; }

    public ExerciseDbApiMetadataDto Metadata { get; set; }

    public ExerciseDbApiDataDto[] Data { get; set; }
}

public class ExerciseDbApiMetadataDto
{
    public int? TotalPages { get; set; }

    public int? TotalExercises { get; set; }

    public int? CurrentPage { get; set; }

    public string PreviousPage { get; set; }

    public string NextPage { get; set; }
}

public class ExerciseDbApiDataDto
{
    public string ExerciseId { get; set; }

    public string Name { get; set; }

    public string GifUrl { get; set; }

    public string[] TargetMuscles { get; set; }

    public string[] BodyParts { get; set; }

    public string[] Equipments { get; set; }

    public string[] SecondaryMuscles { get; set; }

    public string[] Instructions { get; set; }
}