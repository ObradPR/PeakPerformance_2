using MediatR;
using Microsoft.AspNetCore.Mvc;
using PeakPerformance.Api.Controllers._Base;
using PeakPerformance.Api.ReinforcedTypings.Generator;
using PeakPerformance.Application.BusinessLogic.Users.Commands;
using PeakPerformance.Application.Dtos.Users;
using PeakPerformance.Domain.Common;

namespace PeakPerformance.Api.Controllers;

public class AuthController(IMediator mediator)
    : BaseController(mediator)
{
    [HttpPost]
    [AngularMethod(typeof(ResponseWrapper<AuthorizationDto>))]
    public async Task<IActionResult> Signup([FromBody] RegistrationDto data) => Ok(await Mediator.Send(new RegistrationCommand(data)));

    //[HttpPost]
    //[AngularMethod(typeof(AuthorizationDto))]
    //public async Task<IActionResult> Signin(SigninDto data) => Ok(await Mediator.Send(new SigninCommand(data)));
}