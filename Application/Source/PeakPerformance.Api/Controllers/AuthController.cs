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
    public async Task<IActionResult> Registration([FromBody] RegistrationDto data) => Ok(await Mediator.Send(new RegistrationCommand(data)));

    [HttpPost]
    [AngularMethod(typeof(ResponseWrapper<AuthorizationDto>))]
    public async Task<IActionResult> Login([FromBody] LoginDto data) => Ok(await Mediator.Send(new LoginCommand(data)));
}