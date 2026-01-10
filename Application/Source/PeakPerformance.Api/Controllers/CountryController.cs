using PeakPerformance.Application.BusinessLogic.Countries.Queries;
using PeakPerformance.Application.Dtos.Countries;

namespace PeakPerformance.Api.Controllers;

[Authorize]
public class CountryController(IMediator mediator) : BaseController(mediator)
{
    [HttpGet]
    [AngularMethod(typeof(ResponseWrapper<IEnumerable<CountryDto>>))]
    public async Task<IActionResult> GetList() => Result(await Mediator.Send(new GetCountriesQuery()));

    [HttpGet]
    [AngularMethod(typeof(ResponseWrapper<CountryDto>))]
    public async Task<IActionResult> GetSingle(long id) => Result(new ResponseWrapper<CountryDto>((await Mediator.Send(new GetCountriesQuery(id))).Data.FirstOrDefault()));
}