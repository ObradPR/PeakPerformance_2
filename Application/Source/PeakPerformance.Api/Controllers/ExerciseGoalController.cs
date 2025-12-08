using PeakPerformance.Application.BusinessLogic.ExerciseGoals.Commands;
using PeakPerformance.Application.BusinessLogic.ExerciseGoals.Queries;
using PeakPerformance.Application.Dtos.ExerciseGoals;

namespace PeakPerformance.Api.Controllers;

public class ExerciseGoalController(IMediator mediator) : BaseController(mediator)
{
    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<PagingResult<ExerciseGoalDto>>))]
    public async Task<IActionResult> Search([FromBody] ExerciseGoalSearchOptions options) => Result(await Mediator.Send(new SearchExerciseGoalQuery(options)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Save([FromBody] ExerciseGoalDto data) => Result(await Mediator.Send(new SaveExerciseGoalCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteExerciseGoalCommand(id)));
}