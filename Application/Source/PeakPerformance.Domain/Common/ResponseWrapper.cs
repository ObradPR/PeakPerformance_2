using System.Net;

namespace PeakPerformance.Domain.Common;

public class BaseResponseWrapper
{
    public bool IsSuccess => Errors.Count == 0;

    public List<Error> Errors { get; set; } = [];

    public HttpStatusCode Code { get; set; } = HttpStatusCode.OK;

    public BaseResponseWrapper()
    {
    }

    public BaseResponseWrapper(List<Error> errors, HttpStatusCode code = HttpStatusCode.BadRequest)
    {
        if (errors != null && errors.Count > 0)
        {
            Errors.AddRange(errors);
            Code = code;
        }
    }

    public void AddError(Error error, HttpStatusCode code = HttpStatusCode.BadRequest)
    {
        if (error != null)
        {
            Errors.Add(error);
            Code = code;
        }
    }
}

public class ResponseWrapper<T> : BaseResponseWrapper
{
    public T Data { get; set; }

    public ResponseWrapper()
    {
    }

    public ResponseWrapper(T data) => Data = data;

    public ResponseWrapper(List<Error> errors, HttpStatusCode code = HttpStatusCode.BadRequest) : base(errors, code)
    {
    }

    public ResponseWrapper(Error error, HttpStatusCode code = HttpStatusCode.BadRequest) : base([error], code)
    {
    }
}