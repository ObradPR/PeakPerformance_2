﻿using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.Mappers;

public abstract class BaseAutoMapperProfile : Profile
{ }

public class AutoMappingProfiles : BaseAutoMapperProfile
{
    public AutoMappingProfiles()
    {

        CreateMap<User, UserDto>();
    }
}