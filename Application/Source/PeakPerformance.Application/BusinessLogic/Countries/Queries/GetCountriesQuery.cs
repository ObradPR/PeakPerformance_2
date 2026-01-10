using PeakPerformance.Application.Dtos.Countries;

namespace PeakPerformance.Application.BusinessLogic.Countries.Queries;

public class GetCountriesQuery(long? id = null) : IRequest<ResponseWrapper<IEnumerable<CountryDto>>>
{
    public long? Id { get; set; } = id;

    public class GetCountriesQueryHandler(IDatabaseContext db, IMapper mapper) : IRequestHandler<GetCountriesQuery, ResponseWrapper<IEnumerable<CountryDto>>>
    {
        public async Task<ResponseWrapper<IEnumerable<CountryDto>>> Handle(GetCountriesQuery request, CancellationToken cancellationToken)
        {
            var models = await db.Countries.GetListAsync(_ => !request.Id.HasValue || _.Id == request.Id);

            return new(mapper.Map<IEnumerable<CountryDto>>(models));
        }
    }
}