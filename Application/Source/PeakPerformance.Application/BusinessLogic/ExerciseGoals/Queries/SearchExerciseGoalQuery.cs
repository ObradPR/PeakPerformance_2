using PeakPerformance.Application.Dtos.ExerciseGoals;

namespace PeakPerformance.Application.BusinessLogic.ExerciseGoals.Queries;

public class SearchExerciseGoalQuery(ExerciseGoalSearchOptions options) : IRequest<ResponseWrapper<PagingResult<ExerciseGoalDto>>>
{
    public ExerciseGoalSearchOptions Options { get; set; } = options;

    public class SearchExerciseGoalQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<SearchExerciseGoalQuery, ResponseWrapper<PagingResult<ExerciseGoalDto>>>
    {
        public async Task<ResponseWrapper<PagingResult<ExerciseGoalDto>>> Handle(SearchExerciseGoalQuery request, CancellationToken cancellationToken)
        {
            var options = request.Options;

            var userId = options.UserId ?? identityUser.Id;

            var predicates = new List<Expression<Func<ExerciseGoal, bool>>>();

            if (userId.IsNotEmpty())
                predicates.Add(_ => _.UserId == userId);

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

            var result = await db.ExerciseGoals.SearchAsync(options, _ => _.StartDate, false, predicates, null);

            return new(new()
            {
                Data = mapper.Map<IEnumerable<ExerciseGoalDto>>(result.Data),
                Total = result.Total
            });
        }
    }
}