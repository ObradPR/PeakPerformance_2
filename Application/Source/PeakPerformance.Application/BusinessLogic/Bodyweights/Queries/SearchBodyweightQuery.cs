using PeakPerformance.Application.Dtos.Bodyweights;

namespace PeakPerformance.Application.BusinessLogic.Bodyweights.Queries;

public class SearchBodyweightQuery(BodyweightSearchOptions options) : IRequest<ResponseWrapper<PagingResult<BodyweightDto>>>
{
    public BodyweightSearchOptions Options { get; set; } = options;

    public class SearchBodyweightQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<SearchBodyweightQuery, ResponseWrapper<PagingResult<BodyweightDto>>>
    {
        public async Task<ResponseWrapper<PagingResult<BodyweightDto>>> Handle(SearchBodyweightQuery request, CancellationToken cancellationToken)
        {
            var options = request.Options;

            var userId = options.UserId ?? identityUser.Id;

            var predicates = new List<Expression<Func<Bodyweight, bool>>>();

            if (userId.IsNotEmpty())
                predicates.Add(_ => _.UserId == userId);

            if (options.FromDate.IsNotNullOrEmpty())
                predicates.Add(_ => _.LogDate >= options.FromDate.Value);

            if (options.ToDate.IsNotNullOrEmpty())
                predicates.Add(_ => _.LogDate <= options.ToDate.Value);

            if (options.ChartTimespanId.HasValue)
            {
                var chartTimespanId = options.ChartTimespanId.Value;
                var today = Functions.TODAY;

                predicates.Add(_ => _.LogDate <= today);

                if (chartTimespanId == eChartTimespan.Last3Months)
                    predicates.Add(_ => _.LogDate >= today.AddMonths(-3));
                else if (chartTimespanId == eChartTimespan.Last6Months)
                    predicates.Add(_ => _.LogDate >= today.AddMonths(-6));
                else if (chartTimespanId == eChartTimespan.Last12Months)
                    predicates.Add(_ => _.LogDate >= today.AddMonths(-12));
            }

            var result = await db.Bodyweights.SearchAsync(options, _ => _.LogDate, false, predicates, null);

            return new(new()
            {
                Data = mapper.Map<IEnumerable<BodyweightDto>>(result.Data),
                Total = result.Total
            });
        }
    }
}