using PeakPerformance.Application.Dtos.Exercises;
using PeakPerformance.Domain.Exceptions;

namespace PeakPerformance.Application.BusinessLogic.Exercises.Queries;

public class AdminSearchExerciseQuery(ExerciseSearchOptions options) : IRequest<ResponseWrapper<PagingResult<ExerciseDto>>>
{
    public ExerciseSearchOptions Options { get; set; } = options;

    public class AdminSearchExerciseQueryHandler(IIdentityUser identityUser, IDatabaseContext db, IMapper mapper) : IRequestHandler<AdminSearchExerciseQuery, ResponseWrapper<PagingResult<ExerciseDto>>>
    {
        public async Task<ResponseWrapper<PagingResult<ExerciseDto>>> Handle(AdminSearchExerciseQuery request, CancellationToken cancellationToken)
        {
            if (!identityUser.HasRole([eSystemRole.Admin]))
            {
                throw new ForbiddenException();
            }

            var options = request.Options;

            var predicates = new List<Expression<Func<Exercise, bool>>>();

            if (options.Id.IsNotNullOrEmpty())
                predicates.Add(_ => _.Id == options.Id);

            if (options.Filter.IsNotNullOrWhiteSpace())
                predicates.Add(_ => _.Name.Contains(options.Filter) || _.ApiExerciseId.Contains(options.Filter));

            var result = await db.Exercises.SearchAsync(options, _ => _.Name, false, predicates);

            return new(new()
            {
                Data = mapper.Map<IEnumerable<ExerciseDto>>(result.Data),
                Total = result.Total
            });
        }
    }
}