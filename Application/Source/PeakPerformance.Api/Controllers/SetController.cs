using PeakPerformance.Application.Dtos.Sets;

namespace PeakPerformance.Api.Controllers;

public class SetController(IMediator mediator) : BaseController(mediator)
{
    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Save([FromBody] WorkoutExerciseSetDto data) => Result(await Mediator.Send(new SaveSetCommand(data)));
}