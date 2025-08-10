namespace PeakPerformance.Domain.Exceptions;

public class ForbiddenException() : Exception("Access forbidden.");

public class NotFoundException() : Exception("The requested resource was not found.");

public class ServerErrorException() : Exception("An unexpected server error occurred.");

public class UnauthorizedException() : Exception("Unauthorized access. Authentication is required.");

public class UploadFileException : Exception
{
    private const string DefaultMessage = "There was an error with uploading a file to the server.";

    public UploadFileException() : base(DefaultMessage)
    {
    }

    public UploadFileException(string message) : base(message.IsNullOrEmpty() ? DefaultMessage : message)
    {
    }

    public UploadFileException(string message, Exception innerException) : base(message.IsNullOrEmpty() ? DefaultMessage : message, innerException)
    {
    }
}