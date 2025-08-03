using Microsoft.AspNetCore.Mvc.Filters;
using PeakPerformance.Common.Extensions;
using PeakPerformance.Domain.Enums;
using PeakPerformance.Domain.Exceptions;
using PeakPerformance.Domain.Interfaces;

namespace PeakPerformance.Api.Attributes;

public class AuthorizationAttribute(params eSystemRole[] roles) : Attribute, IAuthorizationFilter
{
    private readonly eSystemRole[] _roles = roles;

    public void OnAuthorization(AuthorizationFilterContext context)
    {
        var user = context.HttpContext.RequestServices.GetService<IIdentityUser>();

        if (user == null || !user!.IsAuthenticated)
            throw new UnauthorizedException();

        if (_roles.IsNullOrEmpty() || !user!.HasRole(_roles))
            throw new ForbiddenException();
    }
}