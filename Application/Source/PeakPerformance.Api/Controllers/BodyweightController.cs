using PeakPerformance.Application.BusinessLogic.BodyweightGoals.Commands;
using PeakPerformance.Application.BusinessLogic.Bodyweights.Commands;

namespace PeakPerformance.Api.Controllers;

public class BodyweightController(IMediator mediator) : BaseController(mediator)
{
    // Bodyweight
    // Search
    // Save Bodyweight (Add/Update)
    // Delete Bodyweight
    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteBodyweightGoalCommand(id)));

    // Bodyweight Goal
    // Search
    // Save Goal (Add/Update)
    // Delete Goal
    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> DeleteGoal([FromQuery] long id) => Result(await Mediator.Send(new DeleteBodyweightCommand(id)));
}