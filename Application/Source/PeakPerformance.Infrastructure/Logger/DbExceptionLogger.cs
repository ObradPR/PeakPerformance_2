using PeakPerformance.Domain.Entities.Application;
using PeakPerformance.Domain.Interfaces;

namespace PeakPerformance.Infrastructure.Logger;

public class DbExceptionLogger(IDatabaseContext db) : IExceptionLogger
{
    public async Task LogExceptionAsync(Exception ex)
    {
        db.ErrorLogs.Add(new ErrorLog
        {
            Message = ex.Message,
            StackTrace = ex.StackTrace,
            InnerException = ex.InnerException?.Message
        });

        await db.SaveChangesAsync();
    }
}