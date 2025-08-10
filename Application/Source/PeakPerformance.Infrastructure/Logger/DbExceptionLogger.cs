using PeakPerformance.Domain.Entities.Application;
using PeakPerformance.Domain.Interfaces;
using PeakPerformance.Domain.Repositories;

namespace PeakPerformance.Infrastructure.Logger;

public class DbExceptionLogger(IUnitOfWork unitOfWork) : IExceptionLogger
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;

    public async Task LogExceptionAsync(Exception ex)
    {
        _unitOfWork.Create(new ErrorLog
        {
            Message = ex.Message,
            StackTrace = ex.StackTrace,
            InnerException = ex.InnerException?.Message
        });

        await _unitOfWork.SaveAsync();
    }
}