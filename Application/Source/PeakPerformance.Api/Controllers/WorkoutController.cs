using PeakPerformance.Application.BusinessLogic.Workouts.Commands;
using PeakPerformance.Application.BusinessLogic.Workouts.Queries;
using PeakPerformance.Application.Dtos.Workouts;

namespace PeakPerformance.Api.Controllers;

public class WorkoutController(IMediator mediator) : BaseController(mediator)
{
    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<IEnumerable<WorkoutDto>>))]
    public async Task<IActionResult> GetRecent() => Result(await Mediator.Send(new GetRecentWorkoutQuery()));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<PagingResult<WorkoutDto>>))]
    public async Task<IActionResult> Search([FromBody] WorkoutSearchOptions options) => Result(await Mediator.Send(new SearchWorkoutQuery(options)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Save([FromBody] WorkoutDto data) => Result(await Mediator.Send(new SaveWorkoutCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteWorkoutCommand(id)));
}