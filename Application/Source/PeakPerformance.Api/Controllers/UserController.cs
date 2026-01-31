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
    public async Task<IActionResult> GetCurrent() => Result(await Mediator.Send(new GetSingleUserQuery(null)));

    [HttpGet]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<UserDto>))]
    public async Task<IActionResult> GetSingle([FromQuery] long id) => Result(await Mediator.Send(new GetSingleUserQuery(id)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<PagingResult<UserDto>>))]
    public async Task<IActionResult> Search([FromBody] UserSearchOptions options) => Result(await Mediator.Send(new SearchUsersQuery(options)));

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

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> UpdateMeasurementUnits([FromBody] UserDto data) => Result(await Mediator.Send(new UpdateMeasurementUnitsCommand(data)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> ChangePassword([FromBody] ChangePasswordDto data) => Result(await Mediator.Send(new ChangePasswordCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Deactivate() => Result(await Mediator.Send(new DeactivateCommand()));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> DeleteProfilePicture() => Result(await Mediator.Send(new DeleteProfilePictureCommand()));
}