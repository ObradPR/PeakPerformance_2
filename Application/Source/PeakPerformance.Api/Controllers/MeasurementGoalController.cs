using PeakPerformance.Application.BusinessLogic.MeasurementGoals.Commands;
using PeakPerformance.Application.BusinessLogic.MeasurementGoals.Queries;
using PeakPerformance.Application.Dtos.MeasurementGoals;

namespace PeakPerformance.Api.Controllers;

public class MeasurementGoalController(IMediator mediator) : BaseController(mediator)
{
    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<PagingResult<MeasurementGoalDto>>))]
    public async Task<IActionResult> Search([FromBody] MeasurementGoalSearchOptions options) => Result(await Mediator.Send(new SearchMeasurementGoalQuery(options)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Create([FromBody] MeasurementGoalCreateDto data) => Result(await Mediator.Send(new CreateMeasurementGoalCommand(data)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Update([FromBody] MeasurementGoalDto data) => Result(await Mediator.Send(new UpdateMeasurementGoalCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteMeasurementGoalCommand(id)));
}