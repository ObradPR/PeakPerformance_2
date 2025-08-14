using PeakPerformance.Application.BusinessLogic.BodyweightGoals.Commands;
using PeakPerformance.Application.BusinessLogic.BodyweightGoals.Queries;
using PeakPerformance.Application.Dtos.BodyweightGoalDto;

namespace PeakPerformance.Api.Controllers;

public class BodyweightGoalController(IMediator mediator) : BaseController(mediator)
{
    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<PagingResult<BodyweightGoalDto>>))]
    public async Task<IActionResult> Search([FromBody] BodyweightGoalSearchOptions options) => Result(await Mediator.Send(new SearchBodyweightGoalQuery(options)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Save([FromBody] BodyweightGoalDto data) => Result(await Mediator.Send(new SaveBodyweightGoalCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteBodyweightGoalCommand(id)));
}