namespace PeakPerformance.Domain.Common;

public class ResponseWrapper
{
    public bool IsSuccess => Errors.Count == 0;

    public List<Error> Errors { get; set; } = [];

    public ResponseWrapper()
    {
    }

    public ResponseWrapper(List<Error> errors) => Errors = errors;

    public void AddError(Error error) => Errors.Add(error);
}

public class ResponseWrapper<T> : ResponseWrapper
{
    public T Data { get; set; }

    public ResponseWrapper(T data) => Data = data;
}