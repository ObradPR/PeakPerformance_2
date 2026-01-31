using PeakPerformance.Application.Dtos.Exercises;

namespace PeakPerformance.Application.BusinessLogic.Exercises.Queries;

public class GetSelectedExercisesQuery(long userId) : IRequest<ResponseWrapper<IEnumerable<BaseExerciseDto>>>
{
    public long UserId { get; set; } = userId;

    public class GetSelectedExercisesQueryHandler(IDatabaseContext db, IMapper mapper) : IRequestHandler<GetSelectedExercisesQuery, ResponseWrapper<IEnumerable<BaseExerciseDto>>>
    {
        public async Task<ResponseWrapper<IEnumerable<BaseExerciseDto>>> Handle(GetSelectedExercisesQuery request, CancellationToken cancellationToken)
        {
            if (request.UserId.IsEmpty())
                return new();

            var result = await db.UserSelectedExercises
                    .Take(5)
                    .Where(_ => _.UserId == request.UserId)
                    .Select(_ => new BaseExerciseDto { Id = _.ExerciseId, Name = _.Exercise.Name })
                    .Distinct()
                    .ToListAsync(cancellationToken);

            return new(mapper.Map<IEnumerable<BaseExerciseDto>>(result));
        }
    }
}