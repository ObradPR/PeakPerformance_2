using PeakPerformance.Application.BusinessLogic.Bodyweights.Commands;
using PeakPerformance.Application.BusinessLogic.Bodyweights.Queries;
using PeakPerformance.Application.Dtos.Bodyweights;

namespace PeakPerformance.Api.Controllers;

public class BodyweightController(IMediator mediator) : BaseController(mediator)
{
    [HttpGet]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<CurrentBodyInfoDto>))]
    public async Task<IActionResult> GetCurrentBodyweightInfo() => Result(await Mediator.Send(new GetCurrentBodyweightInfoQuery()));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<PagingResult<BodyweightDto>>))]
    public async Task<IActionResult> Search([FromBody] BodyweightSearchOptions options) => Result(await Mediator.Send(new SearchBodyweightQuery(options)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Save([FromBody] BodyweightDto data) => Result(await Mediator.Send(new SaveBodyweightCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteBodyweightCommand(id)));
}