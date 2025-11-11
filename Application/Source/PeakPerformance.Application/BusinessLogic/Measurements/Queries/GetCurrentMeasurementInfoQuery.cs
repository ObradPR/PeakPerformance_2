using PeakPerformance.Application.Dtos.Bodyweights;

namespace PeakPerformance.Application.BusinessLogic.Measurements.Queries;

public class GetCurrentMeasurementInfoQuery() : IRequest<ResponseWrapper<CurrentBodyInfoDto>>
{
    public class GetCurrentMeasurementInfoQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetCurrentMeasurementInfoQuery, ResponseWrapper<CurrentBodyInfoDto>>
    {
        public async Task<ResponseWrapper<CurrentBodyInfoDto>> Handle(GetCurrentMeasurementInfoQuery request, CancellationToken cancellationToken)
        {
            var userId = identityUser.Id;

            var measurement = await db.Measurements
                .Where(_ => _.UserId == userId)
                .OrderByDescending(_ => _.LogDate)
                .FirstOrDefaultAsync(cancellationToken);

            //var result = new CurrentBodyInfo
            //{
            //    Waist = measurement?.Waist,
            //    Chest = measurement?.Chest,
            //    Thighs = measurement?.RightThigh.HasValue == true && measurement?.LeftThigh.HasValue == true
            //        ? new List<decimal> { measurement.RightThigh.Value, measurement.LeftThigh.Value }.Average()
            //        : null,
            //    Biceps = measurement?.RightBicep.HasValue == true && measurement?.LeftBicep.HasValue == true
            //        ? new List<decimal> { measurement.RightBicep.Value, measurement.LeftBicep.Value }.Average()
            //        : null,
            //    MeasurementUnitId = measurement?.MeasurementUnitId
            //};

            //return new(mapper.Map<CurrentBodyInfoDto>(result));

            return new();
        }
    }
}