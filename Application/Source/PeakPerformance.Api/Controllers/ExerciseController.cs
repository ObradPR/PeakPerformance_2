using PeakPerformance.Application.BusinessLogic.Exercises.Commands;
using PeakPerformance.Application.BusinessLogic.Exercises.Queries;
using PeakPerformance.Application.Dtos._Base;
using PeakPerformance.Application.Dtos.Exercises;
using PeakPerformance.Common.Extensions;

namespace PeakPerformance.Api.Controllers;

public class ExerciseController(IMediator mediator) : BaseController(mediator)
{
    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<PagingResult<ExerciseStatsDto>>))]
    public async Task<IActionResult> Search([FromBody] ExerciseSearchOptions options) => Result(await Mediator.Send(new SearchExerciseQuery(options)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<PagingResult<ExerciseDto>>))]
    public async Task<IActionResult> GetList([FromBody] ExerciseSearchOptions options) => Result(await Mediator.Send(new GetExercisesQuery(options)));

    [HttpGet]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<ExerciseDto>))]
    public async Task<IActionResult> GetSingle([FromQuery] long id) => Result(await Mediator.Send(new GetExerciseQuery(id)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Save([FromBody] WorkoutExerciseDto data) => Result(await Mediator.Send(new SaveExerciseCommand(data)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Delete([FromQuery] long id) => Result(await Mediator.Send(new DeleteExerciseCommand(id)));

    // Selected Exercises

    [HttpGet]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<List<BaseExerciseDto>>))]
    public async Task<IActionResult> GetSelectedExercises([FromQuery] long userId) => Result(await Mediator.Send(new GetSelectedExercisesQuery(userId)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Select([FromBody] long id) => Result(await Mediator.Send(new SelectExerciseCommand(id)));

    [HttpDelete]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> Remove([FromQuery] long id) => Result(await Mediator.Send(new RemoveExerciseCommand(id)));

    // Admin

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(ResponseWrapper<PagingResult<ExerciseDto>>))]
    public async Task<IActionResult> AdminSearch([FromBody] ExerciseSearchOptions options) => Result(await Mediator.Send(new AdminSearchExerciseQuery(options)));

    [HttpPost]
    [Authorize]
    [AngularMethod(typeof(BaseResponseWrapper))]
    public async Task<IActionResult> AdminSave([FromForm] string dataJson)
    {
        var data = dataJson.DeserializeJsonObject<ExerciseDto>();

        FileInformationDto[] fileDtos = [];

        if (HttpContext.Request.Form.Files.Count != 0)
        {
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

            fileDtos = await Task.WhenAll(fileReads);
        }

        return Result(await Mediator.Send(new AdminSaveExerciseCommand(data, fileDtos.FirstOrDefault())));
    }
}