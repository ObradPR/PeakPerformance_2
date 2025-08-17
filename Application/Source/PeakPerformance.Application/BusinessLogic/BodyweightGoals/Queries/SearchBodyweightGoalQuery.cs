using PeakPerformance.Application.Dtos.BodyweightGoals;

namespace PeakPerformance.Application.BusinessLogic.BodyweightGoals.Queries;

public class SearchBodyweightGoalQuery(BodyweightGoalSearchOptions options) : IRequest<ResponseWrapper<PagingResult<BodyweightGoalDto>>>
{
    public BodyweightGoalSearchOptions Options { get; set; } = options;

    public class SearchBodyweightGoalQueryHandler(IUnitOfWork unitOfWork, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<SearchBodyweightGoalQuery, ResponseWrapper<PagingResult<BodyweightGoalDto>>>
    {
        public async Task<ResponseWrapper<PagingResult<BodyweightGoalDto>>> Handle(SearchBodyweightGoalQuery request, CancellationToken cancellationToken)
        {
            var options = request.Options;

            var userId = options.UserId ?? identityUser.Id;

            var predicates = new List<Expression<Func<BodyweightGoal, bool>>>();

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

            var result = await unitOfWork.BodyweightGoals.SearchAsync(options, predicates);

            return new(new()
            {
                Data = mapper.Map<IEnumerable<BodyweightGoalDto>>(result.Data),
                Total = result.Total
            });
        }
    }
}