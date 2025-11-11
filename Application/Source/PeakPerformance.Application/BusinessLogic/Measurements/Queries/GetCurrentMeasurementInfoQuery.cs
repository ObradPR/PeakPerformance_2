using PeakPerformance.Application.Dtos.Bodyweights;

namespace PeakPerformance.Application.BusinessLogic.Measurements.Queries;

public class GetCurrentMeasurementInfoQuery() : IRequest<ResponseWrapper<CurrentBodyInfoDto>>
{
    public class GetCurrentMeasurementInfoQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetCurrentMeasurementInfoQuery, ResponseWrapper<CurrentBodyInfoDto>>
    {
        public async Task<ResponseWrapper<CurrentBodyInfoDto>> Handle(GetCurrentMeasurementInfoQuery request, CancellationToken cancellationToken)
        {
            var userId = identityUser.Id;

            //var measurement = await db.Measurements
            //.Where(_ => _.UserId == userId)
            //.OrderByDescending(_ => _.LogDate)
            //.FirstOrDefaultAsync(cancellationToken);

            //var result = new CurrentBodyInfo
            //{
            //    Waist = bodyweight?.Value,
            //    Chest = bodyweight?.WeightUnitId,
            //    Thighs = bodyweight?.BodyFatPercentage,
            //    Biceps = bodyweightGoal?.Target,
            //    MeasurementUnitId = bodyweightGoal?.WeightUnitId
            //};

            //return new(mapper.Map<CurrentBodyInfoDto>(result));

            return new();
        }
    }
}