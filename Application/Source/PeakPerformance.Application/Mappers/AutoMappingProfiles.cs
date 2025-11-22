using PeakPerformance.Application.Dtos._Base;
using PeakPerformance.Application.Dtos.BodyweightGoals;
using PeakPerformance.Application.Dtos.Bodyweights;
using PeakPerformance.Application.Dtos.Countries;
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

        CreateMap<Workout, WorkoutDto>();
        CreateMap<WorkoutExercise, WorkoutExerciseDto>();
        CreateMap<WorkoutExerciseSet, WorkoutExerciseSetDto>();

        // Value objects
        CreateMap<CurrentBodyInfo, CurrentBodyInfoDto>();
        CreateMap<FileInformation, FileInformationDto>().ReverseMap();
    }
}