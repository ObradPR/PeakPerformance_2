using PeakPerformance.Application.Dtos.Countries;

namespace PeakPerformance.Application.BusinessLogic.Countries.Queries;

public class GetCountriesQuery : IRequest<ResponseWrapper<CountryDto>>
{
    public class GetCountriesQueryHandler(IDatabaseContext db, IMapper mapper) : IRequestHandler<GetCountriesQuery, ResponseWrapper<CountryDto>>
    {
        public async Task<ResponseWrapper<CountryDto>> Handle(GetCountriesQuery request, CancellationToken cancellationToken)
        {
            var models = await db.Countries.GetListAsync(cancellationToken);

            return new(mapper.Map<CountryDto>(models));
        }
    }
}