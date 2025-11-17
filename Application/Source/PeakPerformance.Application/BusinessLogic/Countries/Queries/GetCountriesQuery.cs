using PeakPerformance.Application.Dtos.Countries;

namespace PeakPerformance.Application.BusinessLogic.Countries.Queries;

public class GetCountriesQuery : IRequest<ResponseWrapper<IEnumerable<CountryDto>>>
{
    public class GetCountriesQueryHandler(IDatabaseContext db, IMapper mapper) : IRequestHandler<GetCountriesQuery, ResponseWrapper<IEnumerable<CountryDto>>>
    {
        public async Task<ResponseWrapper<IEnumerable<CountryDto>>> Handle(GetCountriesQuery request, CancellationToken cancellationToken)
        {
            var models = await db.Countries.GetListAsync(cancellationToken);

            return new(mapper.Map<IEnumerable<CountryDto>>(models));
        }
    }
}