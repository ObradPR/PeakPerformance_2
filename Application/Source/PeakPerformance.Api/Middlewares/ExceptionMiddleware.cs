using PeakPerformance.Application.Exceptions;
using PeakPerformance.Common.Extensions;
using PeakPerformance.Domain.Common;
using PeakPerformance.Domain.Exceptions;
using PeakPerformance.Domain.Interfaces;
using System.Net;

namespace PeakPerformance.Api.Middlewares;

public class ExceptionMiddleware(RequestDelegate next)
{
    private readonly RequestDelegate _next = next;

    public async Task InvokeAsync(HttpContext context, IExceptionLogger logger)
    {
        try
        {
            await _next(context);
        }
        catch (Exception ex)
        {
            await HandleExceptionAsync(context, ex, logger);
        }
    }

    private async Task HandleExceptionAsync(HttpContext context, Exception ex, IExceptionLogger logger)
    {
        await logger.LogExceptionAsync(ex);

        var statusCode = ex switch
        {
            NotFoundException _ => HttpStatusCode.NotFound,
            UnauthorizedException _ => HttpStatusCode.Unauthorized,
            ForbiddenException _ => HttpStatusCode.Forbidden,
            FluentValidationException _ => HttpStatusCode.UnprocessableEntity,
            ServerErrorException _ => HttpStatusCode.InternalServerError,
            _ => HttpStatusCode.InternalServerError,
        };

        context.Response.ContentType = "application/json";
        context.Response.StatusCode = (int)statusCode;

        var response = new ResponseWrapper<object>();

        if (ex is FluentValidationException validationException)
        {
            response.Code = statusCode;
            response.Errors = validationException.Failures
                .SelectMany(kvp => kvp.Value.Select(msg => new Error(kvp.Key, msg)))
                .ToList();
        }
        else
        {
            response.AddError(new("Error", ex.Message), statusCode);
        }

        await context.Response.WriteAsync(response.SerializeJsonObject());
    }
}