using PeakPerformance.Application.Dtos.Users;

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
    }
}