using PeakPerformance.Application.BusinessLogic.BodyweightGoals.Commands;
using PeakPerformance.Application.BusinessLogic.Bodyweights.Commands;
using PeakPerformance.Application.Dtos.BodyweightGoalDto;
using PeakPerformance.Application.Dtos.Bodyweights;

namespace PeakPerformance.Api.Controllers;

public class BodyweightController(IMediator mediator) : BaseController(mediator)
{
    // Bodyweight
    // Search

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Save([FromBody] BodyweightDto data) => Result(await Mediator.Send(new SaveBodyweightCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteBodyweightCommand(id)));

    // Bodyweight Goal
    // Search

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> SaveGoal([FromBody] BodyweightGoalDto data) => Result(await Mediator.Send(new SaveBodyweightGoalCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> DeleteGoal([FromQuery] long id) => Result(await Mediator.Send(new DeleteBodyweightGoalCommand(id)));
}