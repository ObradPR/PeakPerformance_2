using MediatR;
using PeakPerformance.Api.Controllers._Base;

namespace PeakPerformance.Api.Controllers;

public class AuthController(IMediator mediator)
    : BaseController(mediator)
{
    //[HttpPost]
    //[AngularMethod(typeof(AuthorizationDto))]
    //public async Task<IActionResult> Signup([FromBody] SignupDto data) => Ok(await Mediator.Send(new SignupCommand(data)));

    //[HttpPost]
    //[AngularMethod(typeof(AuthorizationDto))]
    //public async Task<IActionResult> Signin(SigninDto data) => Ok(await Mediator.Send(new SigninCommand(data)));
}