using PeakPerformance.Application.BusinessLogic.Users.Queries;
using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Api.Controllers;

public class UserController(IMediator mediator) : BaseController(mediator)
{
    [HttpGet]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<UserDto>))]
    public async Task<IActionResult> GetCurrent() => Result(await Mediator.Send(new GetCurrentUserQuery()));
}