using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.BusinessLogic.Users.Queries;

public class GetSingleUserQuery(long? id) : IRequest<ResponseWrapper<UserDto>>
{
    public long? Id { get; set; } = id;

    public class GetCurrentUserQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetSingleUserQuery, ResponseWrapper<UserDto>>
    {
        public async Task<ResponseWrapper<UserDto>> Handle(GetSingleUserQuery request, CancellationToken cancellationToken)
        {
            var userId = request.Id ?? identityUser.Id;

            var query = db.Users.AsQueryable();
            query = request.Id == null
                ? query.IgnoreQueryFilters().Where(_ => _.Id == identityUser.Id)
                : query.Where(_ => _.Id == userId);

            var model = await query
                .Include(_ => _.UserRoles)
                .Include(_ => _.UserMeasurementPreferences)
                .FirstOrDefaultAsync(cancellationToken);

            if (model == null)
                return new();

            var result = mapper.Map<UserDto>(model);

            if (model.IsActive == true)
                result.WorkoutsCount = await db.Workouts.CountAsync(_ => _.UserId == userId && _.IsCompleted == true, cancellationToken);

            return new(result);
        }
    }
}