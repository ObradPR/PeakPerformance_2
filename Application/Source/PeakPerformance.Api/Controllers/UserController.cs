using PeakPerformance.Application.BusinessLogic.Users.Commands;
using PeakPerformance.Application.BusinessLogic.Users.Queries;
using PeakPerformance.Application.Dtos._Base;
using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Api.Controllers;

public class UserController(IMediator mediator) : BaseController(mediator)
{
    [HttpGet]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<UserDto>))]
    public async Task<IActionResult> GetCurrent() => Result(await Mediator.Send(new GetCurrentUserQuery()));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> UpdatePersonalDetails([FromBody] UserDto data) => Result(await Mediator.Send(new UpdatePersonalDetailsCommand(data)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> UpdateProfilePicture([FromForm] long userId)
    {
        if (HttpContext.Request.Form.Files.Count == 0)
            return BadRequest();

        var fileReads = HttpContext.Request.Form.Files.Select(async file =>
        {
            using var stream = new MemoryStream();
            await file.CopyToAsync(stream);
            return new FileInformationDto
            {
                FileName = file.Name,
                Type = file.ContentType,
                Buffer = stream.ToArray(),
                Size = file.Length
            };
        });

        var fileDtos = await Task.WhenAll(fileReads);

        return Result(await Mediator.Send(new UpdateProfilePictureCommand(fileDtos.FirstOrDefault())));
    }
}