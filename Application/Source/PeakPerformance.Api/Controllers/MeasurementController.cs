using PeakPerformance.Application.BusinessLogic.Measurements.Commands;
using PeakPerformance.Application.BusinessLogic.Measurements.Queries;
using PeakPerformance.Application.Dtos.Bodyweights;
using PeakPerformance.Application.Dtos.Measurements;

namespace PeakPerformance.Api.Controllers;

public class MeasurementController(IMediator mediator) : BaseController(mediator)
{
    [HttpGet]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<CurrentBodyInfoDto>))]
    public async Task<IActionResult> GetCurrentMeasurementInfo() => Result(await Mediator.Send(new GetCurrentMeasurementInfoQuery()));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<PagingResult<MeasurementDto>>))]
    public async Task<IActionResult> Search([FromBody] MeasurementSearchOptions options) => Result(await Mediator.Send(new SearchMeasurementQuery(options)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Save([FromBody] MeasurementCreateDto data) => Result(await Mediator.Send(new SaveMeasurementCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteMeasurementCommand(id)));
}