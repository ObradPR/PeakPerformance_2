using PeakPerformance.Application.Dtos.BodyweightGoals;
using PeakPerformance.Application.Dtos.Bodyweights;
using PeakPerformance.Application.Dtos.MeasurementGoals;
using PeakPerformance.Application.Dtos.Measurements;
using PeakPerformance.Application.Dtos.Users;
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

        CreateMap<Measurement, MeasurementCreateDto>();
        CreateMap<MeasurementGoal, MeasurementGoalCreateDto>();

        // Value objects
        CreateMap<CurrentBodyInfo, CurrentBodyInfoDto>();
    }
}