using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.BusinessLogic.Users.Queries;

public class SearchUsersQuery(UserSearchOptions options) : IRequest<ResponseWrapper<PagingResult<UserDto>>>
{
    public UserSearchOptions Options { get; set; } = options;

    public class SearchUsersQueryHandler(IIdentityUser identityUser, IDatabaseContext db, IMapper mapper) : IRequestHandler<SearchUsersQuery, ResponseWrapper<PagingResult<UserDto>>>
    {
        public async Task<ResponseWrapper<PagingResult<UserDto>>> Handle(SearchUsersQuery request, CancellationToken cancellationToken)
        {
            var options = request.Options;

            var predicates = new List<Expression<Func<User, bool>>>();

            if (options.UserId.IsNotNullOrEmpty())
                predicates.Add(_ => _.Id == options.UserId);

            if (options.IncludeCurrent != true)
                predicates.Add(_ => _.Id != identityUser.Id);

            if (options.Filter.IsNotNullOrWhiteSpace())
                predicates.Add(_ => _.Username.Contains(options.Filter) || _.FullName.Contains(options.Filter));

            if (options.GenderId.HasValue && options.GenderId > 0)
                predicates.Add(_ => _.GenderId == options.GenderId);

            if (options.CountryId.HasValue && options.CountryId > 0)
                predicates.Add(_ => _.CountryId == options.CountryId);

            if (options.AgeRangeId.HasValue && options.AgeRangeId > 0)
            {
                var rangeId = options.AgeRangeId.Value;
                var today = Functions.TODAY;

                if (rangeId == eAgeRange.Age_14_17)
                    predicates.Add(_ => _.DateOfBirth <= today.AddYears(-14) && _.DateOfBirth > today.AddYears(-18));
                else if (rangeId == eAgeRange.Age_18_23)
                    predicates.Add(_ => _.DateOfBirth <= today.AddYears(-18) && _.DateOfBirth > today.AddYears(-24));
                else if (rangeId == eAgeRange.Age_24_39)
                    predicates.Add(_ => _.DateOfBirth <= today.AddYears(-24) && _.DateOfBirth > today.AddYears(-40));
                else if (rangeId == eAgeRange.Age_40_54)
                    predicates.Add(_ => _.DateOfBirth <= today.AddYears(-40) && _.DateOfBirth > today.AddYears(-55));
                else if (rangeId == eAgeRange.Age_55_69)
                    predicates.Add(_ => _.DateOfBirth <= today.AddYears(-55) && _.DateOfBirth > today.AddYears(-70));
                else if (rangeId == eAgeRange.Age_70_plus)
                    predicates.Add(_ => _.DateOfBirth <= today.AddYears(-70));
            }

            var result = await db.Users.SearchAsync(options, _ => _.CreatedOn, true, predicates);

            return new(new()
            {
                Data = mapper.Map<IEnumerable<UserDto>>(result.Data),
                Total = result.Total
            });
        }
    }
}