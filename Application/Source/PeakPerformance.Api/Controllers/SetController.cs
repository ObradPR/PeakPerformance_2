using PeakPerformance.Application.BusinessLogic.Sets.Commands;
using PeakPerformance.Application.Dtos.Sets;

namespace PeakPerformance.Api.Controllers;

public class SetController(IMediator mediator) : BaseController(mediator)
{
    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Save([FromBody] WorkoutExerciseSetDto data) => Result(await Mediator.Send(new SaveSetCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteSetCommand(id)));
}