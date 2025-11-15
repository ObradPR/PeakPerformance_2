using PeakPerformance.Application.Dtos.Bodyweights;
using PeakPerformance.Domain.ValueObjects;

namespace PeakPerformance.Application.BusinessLogic.Bodyweights.Queries;

public class GetCurrentBodyweightInfoQuery() : IRequest<ResponseWrapper<CurrentBodyInfoDto>>
{
    public class GetCurrentBodyweightInfoQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetCurrentBodyweightInfoQuery, ResponseWrapper<CurrentBodyInfoDto>>
    {
        public async Task<ResponseWrapper<CurrentBodyInfoDto>> Handle(GetCurrentBodyweightInfoQuery request, CancellationToken cancellationToken)
        {
            var userId = identityUser.Id;

            var bodyweight = await db.Bodyweights
                .Where(_ => _.UserId == userId)
                .OrderByDescending(_ => _.LogDate)
                .FirstOrDefaultAsync(cancellationToken);

            var today = Functions.TODAY;

            var activeGoal = await db.BodyweightGoals
                .Where(_ => _.UserId == userId &&
                            _.StartDate <= today &&
                            _.EndDate >= today)
                .OrderBy(_ => _.EndDate)
                .FirstOrDefaultAsync(cancellationToken);

            var result = new CurrentBodyInfo
            {
                Bodyweight = bodyweight?.Value,
                BodyweightUnitId = bodyweight?.WeightUnitId,
                BodyFatPercentage = bodyweight?.BodyFatPercentage,
                BodyweightGoal = activeGoal?.Target,
                BodyweightGoalUnitId = activeGoal?.WeightUnitId
            };

            return new(mapper.Map<CurrentBodyInfoDto>(result));
        }
    }
}