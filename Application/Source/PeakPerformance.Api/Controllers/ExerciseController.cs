using PeakPerformance.Application.BusinessLogic.Exercises.Commands;
using PeakPerformance.Application.Dtos.Exercises;

namespace PeakPerformance.Api.Controllers;

public class ExerciseController(IMediator mediator) : BaseController(mediator)
{
    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Save([FromBody] WorkoutExerciseDto data) => Result(await Mediator.Send(new SaveExerciseCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteExerciseCommand(id)));
}