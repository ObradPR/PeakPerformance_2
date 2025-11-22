using PeakPerformance.Application.BusinessLogic.Workouts.Commands;
using PeakPerformance.Application.Dtos.Workouts;

namespace PeakPerformance.Api.Controllers;

public class WorkoutController(IMediator mediator) : BaseController(mediator)
{
    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Save([FromBody] WorkoutDto data) => Result(await Mediator.Send(new SaveWorkoutCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteWorkoutCommand(id)));
}