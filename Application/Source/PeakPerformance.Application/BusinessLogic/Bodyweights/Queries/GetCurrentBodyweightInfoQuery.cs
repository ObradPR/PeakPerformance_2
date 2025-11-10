using PeakPerformance.Application.Dtos.Bodyweights;

namespace PeakPerformance.Application.BusinessLogic.Bodyweights.Queries;

public class GetCurrentBodyweightInfoQuery() : IRequest<ResponseWrapper<CurrentBodyInfoDto>>
{
    public class GetCurrentBodyweightInfoQueryHandler(IUnitOfWork unitOfWork, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetCurrentBodyweightInfoQuery, ResponseWrapper<CurrentBodyInfoDto>>
    {
        public async Task<ResponseWrapper<CurrentBodyInfoDto>> Handle(GetCurrentBodyweightInfoQuery request, CancellationToken cancellationToken)
        {
            var userId = identityUser.Id;

            var result = await unitOfWork.Bodyweights.GetCurrentInfoAsync(userId);

            return new(mapper.Map<CurrentBodyInfoDto>(result));
        }
    }
}