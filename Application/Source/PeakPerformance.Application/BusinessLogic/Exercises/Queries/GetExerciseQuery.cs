using PeakPerformance.Application.Dtos.Exercises;

namespace PeakPerformance.Application.BusinessLogic.Exercises.Queries;

public class GetExerciseQuery(long id) : IRequest<ResponseWrapper<ExerciseDto>>
{
    public long Id { get; set; } = id;

    public class GetExerciseQueryHandler(IDatabaseContext db, IMapper mapper) : IRequestHandler<GetExerciseQuery, ResponseWrapper<ExerciseDto>>
    {
        public async Task<ResponseWrapper<ExerciseDto>> Handle(GetExerciseQuery request, CancellationToken cancellationToken)
        {
            if (request.Id.IsEmpty())
                return new();

            var result = await db.Exercises.FirstOrDefaultAsync(_ => _.Id == request.Id, cancellationToken);

            return new(mapper.Map<ExerciseDto>(result));
        }
    }
}