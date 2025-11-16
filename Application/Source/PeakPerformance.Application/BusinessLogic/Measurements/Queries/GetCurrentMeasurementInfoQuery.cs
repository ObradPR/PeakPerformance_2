using PeakPerformance.Application.Dtos.Bodyweights;
using PeakPerformance.Domain.ValueObjects;

namespace PeakPerformance.Application.BusinessLogic.Measurements.Queries;

public class GetCurrentMeasurementInfoQuery() : IRequest<ResponseWrapper<CurrentBodyInfoDto>>
{
    public class GetCurrentMeasurementInfoQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetCurrentMeasurementInfoQuery, ResponseWrapper<CurrentBodyInfoDto>>
    {
        public async Task<ResponseWrapper<CurrentBodyInfoDto>> Handle(GetCurrentMeasurementInfoQuery request, CancellationToken cancellationToken)
        {
            var userId = identityUser.Id;

            var waist = await db.Measurements
                .Where(_ => _.BodyPartId == eBodyPart.Waist)
                .Select(_ => new { _.Size, _.MeasurementUnitId, _.LogDate })
                .OrderByDescending(_ => _.LogDate)
                .FirstOrDefaultAsync(cancellationToken);

            var chest = await db.Measurements
                .Where(_ => _.BodyPartId == eBodyPart.Chest)
                .Select(_ => new { _.Size, _.MeasurementUnitId, _.LogDate })
                .OrderByDescending(_ => _.LogDate)
                .FirstOrDefaultAsync(cancellationToken);

            var thighParts = new[] { eBodyPart.LeftThigh, eBodyPart.RightThigh };

            var latestThighLog = await db.Measurements
                .Where(_ => thighParts.Contains(_.BodyPartId))
                .OrderByDescending(_ => _.LogDate)
                .Select(_ => _.LogDate)
                .FirstOrDefaultAsync(cancellationToken);
            var thighs = await db.Measurements
                .Where(_ => thighParts.Contains(_.BodyPartId) && _.LogDate == latestThighLog)
                .Select(_ => new { _.Size, _.MeasurementUnitId })
                .ToListAsync(cancellationToken);

            var bicepParts = new[] { eBodyPart.LeftBicep, eBodyPart.RightBicep };

            var latestBicepLog = await db.Measurements
                .Where(_ => bicepParts.Contains(_.BodyPartId))
                .OrderByDescending(_ => _.LogDate)
                .Select(_ => _.LogDate)
                .FirstOrDefaultAsync(cancellationToken);
            var biceps = await db.Measurements
                .Where(_ => bicepParts.Contains(_.BodyPartId) && _.LogDate == latestBicepLog)
                .Select(_ => new { _.Size, _.MeasurementUnitId })
                .ToListAsync(cancellationToken);

            var result = new CurrentBodyInfo
            {
                Waist = waist?.Size,
                WaistMeasurementUnitId = waist?.MeasurementUnitId,
                Chest = chest?.Size,
                ChestMeasurementUnitId = chest?.MeasurementUnitId,
                Thighs = thighs.Count == 2
                    ? Math.Round(thighs.Average(_ => _.Size), 1)
                    : thighs.Count == 1
                        ? thighs.First().Size
                        : null,
                ThighsMeasurementUnitId = thighs.FirstOrDefault()?.MeasurementUnitId,
                Biceps = biceps.Count == 2
                    ? Math.Round(biceps.Average(_ => _.Size), 1)
                    : biceps.Count == 1
                        ? biceps.First().Size
                        : null,
                BicepsMeasurementUnitId = biceps.FirstOrDefault()?.MeasurementUnitId
            };

            return new(mapper.Map<CurrentBodyInfoDto>(result));
        }
    }
}