using PeakPerformance.Application.Dtos._Base;
using PeakPerformance.Application.Dtos.BodyweightGoals;
using PeakPerformance.Application.Dtos.Bodyweights;
using PeakPerformance.Application.Dtos.Countries;
using PeakPerformance.Application.Dtos.ExerciseGoals;
using PeakPerformance.Application.Dtos.Exercises;
using PeakPerformance.Application.Dtos.MeasurementGoals;
using PeakPerformance.Application.Dtos.Measurements;
using PeakPerformance.Application.Dtos.Sets;
using PeakPerformance.Application.Dtos.Users;
using PeakPerformance.Application.Dtos.Workouts;
using PeakPerformance.Domain.ValueObjects;

namespace PeakPerformance.Application.Mappers;

public abstract class BaseAutoMapperProfile : Profile
{ }

public class AutoMappingProfiles : BaseAutoMapperProfile
{
    public AutoMappingProfiles()
    {
        CreateMap<User, UserDto>()
            .ForMember(dest => dest.WeightUnitId, opt => opt.MapFrom(src => src.UserMeasurementPreferences.FirstOrDefault(_ => _.IsActive).WeightUnitId))
            .ForMember(dest => dest.MeasurementUnitId, opt => opt.MapFrom(src => src.UserMeasurementPreferences.FirstOrDefault(_ => _.IsActive).MeasurementUnitId));

        CreateMap<Bodyweight, BodyweightDto>();
        CreateMap<BodyweightGoal, BodyweightGoalDto>();

        CreateMap<Measurement, MeasurementDto>();
        CreateMap<MeasurementGoal, MeasurementGoalDto>();

        CreateMap<Country, CountryDto>();

        CreateMap<Workout, WorkoutDto>()
            .ForMember(dest => dest.Exercises, opt => opt.MapFrom(src => src.WorkoutExercises.OrderBy(_ => _.Order).ToList()))
            .ForMember(dest => dest.DisplayName, opt => opt.MapFrom(src => $"{src.LogDate: d MMMM yyyy} - {src.Name}"))
            .ForMember(dest => dest.DurationTime, opt => opt.MapFrom(src => src.StartAt.HasValue && src.FinishAt.HasValue
                ? TimeOnly.FromTimeSpan(src.FinishAt.Value - src.StartAt.Value)
                : (TimeOnly?)null));
        CreateMap<WorkoutExercise, WorkoutExerciseDto>()
            .ForMember(dest => dest.Sets, opt => opt.MapFrom(src => src.WorkoutExerciseSets.OrderBy(_ => _.Order).ToList()))
            .ForMember(dest => dest.ApiExerciseId, opt => opt.MapFrom(src => src.Exercise.ApiExerciseId))
            .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Exercise.Name))
            .ForMember(dest => dest.IsCardio, opt => opt.MapFrom(src => src.Exercise.IsCardio))
            .ForMember(dest => dest.IsBodyweight, opt => opt.MapFrom(src => src.Exercise.IsBodyweight))
            .ForMember(dest => dest.IsStrength, opt => opt.MapFrom(src => src.Exercise.IsStrength))
            .ForMember(dest => dest.PrimaryMuscleGroupId, opt => opt.MapFrom(src => src.Exercise.PrimaryMuscleGroupId))
            .ForMember(dest => dest.SecondaryMuscleGroupId, opt => opt.MapFrom(src => src.Exercise.SecondaryMuscleGroupId));
        CreateMap<WorkoutExerciseSet, WorkoutExerciseSetDto>();

        CreateMap<Exercise, ExerciseDto>()
            .ForMember(dest => dest.Instructions, opt => opt.MapFrom(src => src.ParseInstructions()))
            .ForMember(d => d.PrimaryMuscleGroups,
                opt => opt.MapFrom(src => src.PrimaryMuscleGroupId.FlagsToNames()))
            .ForMember(d => d.SecondaryMuscleGroups, opt => opt.MapFrom(src => src.SecondaryMuscleGroupId.FlagsToNamesNullable()));
        CreateMap<ExerciseGoal, ExerciseGoalDto>();

        // Value objects
        CreateMap<CurrentBodyInfo, CurrentBodyInfoDto>();
        CreateMap<FileInformation, FileInformationDto>().ReverseMap();
    }
}