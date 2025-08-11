namespace PeakPerformance.Api.Controllers._Base;

[Route("api/[controller]/[action]")]
[ApiController]
public abstract class BaseController(IMediator mediator) : ControllerBase
{
    protected IMediator Mediator = mediator;

    protected IActionResult Result<T>(ResponseWrapper<T> response)
    {
        if (response == null)
            return StatusCode(StatusCodes.Status500InternalServerError, "Unexpected null response");

        return StatusCodeFromResponse(response.Code, response);
    }

    protected IActionResult Result(BaseResponseWrapper response)
    {
        if (response == null)
            return StatusCode(StatusCodes.Status500InternalServerError, "Unexpected null response");

        return StatusCodeFromResponse(response.Code, response);
    }

    private IActionResult StatusCodeFromResponse(HttpStatusCode code, object response)
    {
        return code switch
        {
            HttpStatusCode.OK => Ok(response),
            HttpStatusCode.Created => Created(string.Empty, response),
            HttpStatusCode.NoContent => NoContent(),
            HttpStatusCode.BadRequest => BadRequest(response),
            HttpStatusCode.Unauthorized => Unauthorized(response),
            HttpStatusCode.Forbidden => Forbid(),
            HttpStatusCode.NotFound => NotFound(response),
            _ => StatusCode(StatusCodes.Status500InternalServerError, response)
        };
    }
}