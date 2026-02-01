using PeakPerformance.Application.Dtos.Exercises;

namespace PeakPerformance.Application.BusinessLogic.Exercises.Queries;

public class GetExercisesQuery(ExerciseSearchOptions options) : IRequest<ResponseWrapper<PagingResult<ExerciseDto>>>
{
    public ExerciseSearchOptions Options { get; set; } = options;

    public class GetExercisesQueryHandler(IDatabaseContext db, IMapper mapper) : IRequestHandler<GetExercisesQuery, ResponseWrapper<PagingResult<ExerciseDto>>>
    {
        public async Task<ResponseWrapper<PagingResult<ExerciseDto>>> Handle(GetExercisesQuery request, CancellationToken cancellationToken)
        {
            var options = request.Options;

            var predicates = new List<Expression<Func<Exercise, bool>>>();

            if (options.Filter.IsNotNullOrEmpty())
                predicates.Add(_ => _.Name.Contains(options.Filter));

            if (options.ExerciseIds.IsNotNullOrEmpty())
                predicates.Add(_ => options.ExerciseIds.Contains(_.Id));

            if (options.TakeSelectedExercises.HasValue && options.TakeSelectedExercises == true)
            {
                var exerciseIds = await db.UserSelectedExercises
                    .Take(5)
                    .Where(_ => _.UserId == request.Options.UserId)
                    .Select(_ => _.ExerciseId)
                    .Distinct()
                    .ToListAsync(cancellationToken);

                predicates.Add(_ => exerciseIds.Contains(_.Id));
            }

            var result = await db.Exercises.SearchAsync(options, _ => _.Id, false, predicates);

            return new(new()
            {
                Data = mapper.Map<IEnumerable<ExerciseDto>>(result.Data),
                Total = result.Total
            });
        }
    }
}