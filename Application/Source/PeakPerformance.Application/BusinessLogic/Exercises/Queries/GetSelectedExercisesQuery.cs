using PeakPerformance.Application.Dtos.Exercises;
using PeakPerformance.Domain.Exceptions;

namespace PeakPerformance.Application.BusinessLogic.Exercises.Queries;

public class GetSelectedExercisesQuery(long userId) : IRequest<ResponseWrapper<IEnumerable<BaseExerciseDto>>>
{
    public long UserId { get; set; } = userId;

    public class GetSelectedExercisesQueryHandler(IDatabaseContext db, IMapper mapper, IIdentityUser identityUser) : IRequestHandler<GetSelectedExercisesQuery, ResponseWrapper<IEnumerable<BaseExerciseDto>>>
    {
        public async Task<ResponseWrapper<IEnumerable<BaseExerciseDto>>> Handle(GetSelectedExercisesQuery request, CancellationToken cancellationToken)
        {
            if (request.UserId.IsEmpty())
                return new();

            if (!await db.Users.AnyAsync(_ => _.Id == request.UserId && (request.UserId == identityUser.Id || _.IsPrivate != true), cancellationToken))
            {
                throw new ForbiddenException();
            }

            var result = await db.UserSelectedExercises
                    .Where(_ => _.UserId == request.UserId)
                    .Select(_ => new BaseExerciseDto { Id = _.ExerciseId, Name = _.Exercise.Name })
                    .Distinct()
                    .Take(5)
                    .ToListAsync(cancellationToken);

            return new(mapper.Map<IEnumerable<BaseExerciseDto>>(result));
        }
    }
}