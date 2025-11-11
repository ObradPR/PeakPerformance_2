using PeakPerformance.Application.Dtos.MeasurementGoals;

namespace PeakPerformance.Application.BusinessLogic.MeasurementGoals.Queries;

public class SearchMeasurementGoalQuery(MeasurementGoalSearchOptions options) : IRequest<ResponseWrapper<PagingResult<MeasurementGoalDto>>>
{
    public MeasurementGoalSearchOptions Options { get; set; } = options;

    public class SearchMeasurementGoalQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<SearchMeasurementGoalQuery, ResponseWrapper<PagingResult<MeasurementGoalDto>>>
    {
        public async Task<ResponseWrapper<PagingResult<MeasurementGoalDto>>> Handle(SearchMeasurementGoalQuery request, CancellationToken cancellationToken)
        {
            var options = request.Options;

            var userId = options.UserId ?? identityUser.Id;

            var predicates = new List<Expression<Func<MeasurementGoal, bool>>>();

            if (userId.IsNotEmpty())
                predicates.Add(_ => _.UserId == userId);

            if (options.FromDate.IsNotNullOrEmpty())
                predicates.Add(_ => _.StartDate >= options.FromDate.Value);

            if (options.ToDate.IsNotNullOrEmpty())
                predicates.Add(_ => _.EndDate <= options.ToDate.Value);

            if (options.ChartTimespanId.HasValue)
            {
                var chartTimespanId = options.ChartTimespanId.Value;
                var today = Functions.TODAY;

                predicates.Add(_ => _.StartDate <= today);

                if (chartTimespanId == eChartTimespan.Last3Months)
                    predicates.Add(_ => _.StartDate >= today.AddMonths(-3));
                else if (chartTimespanId == eChartTimespan.Last6Months)
                    predicates.Add(_ => _.StartDate >= today.AddMonths(-6));
                else if (chartTimespanId == eChartTimespan.Last12Months)
                    predicates.Add(_ => _.StartDate >= today.AddMonths(-12));
            }

            var result = await db.MeasurementGoals.SearchAsync(options, _ => _.StartDate, false, predicates, null);

            return new(new()
            {
                Data = mapper.Map<IEnumerable<MeasurementGoalDto>>(result.Data),
                Total = result.Total
            });
        }
    }
}