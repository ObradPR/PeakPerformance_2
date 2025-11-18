using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class UpdateMeasurementUnitsCommand(UserDto user) : IRequest<BaseResponseWrapper>
{
    public UserDto Data { get; set; } = user;

    public class UpdateMeasurementUnitsCommandHandler(IDatabaseContext db, IIdentityUser identityUser)
        : IRequestHandler<UpdateMeasurementUnitsCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(UpdateMeasurementUnitsCommand request, CancellationToken cancellationToken)
        {
            var model = await db.UserMeasurementPreferences.IgnoreQueryFilters()
                .FirstOrDefaultAsync(_ => _.UserId == identityUser.Id &&
                    _.WeightUnitId == request.Data.WeightUnitId &&
                    _.MeasurementUnitId == request.Data.MeasurementUnitId
                , cancellationToken
                );

            var currentPreference = await db.UserMeasurementPreferences.FirstOrDefaultAsync(cancellationToken); // this will by base query filter return IsActive == true, which can only be one

            var newModel = (UserMeasurementPreference)null;

            if (model == null) // if there is no combination for user // create new one
            {
                newModel = new UserMeasurementPreference
                {
                    UserId = identityUser.Id,
                    WeightUnitId = request.Data.WeightUnitId,
                    MeasurementUnitId = request.Data.MeasurementUnitId
                };

                db.UserMeasurementPreferences.Add(newModel);
            }
            else if (model != null && model.IsActive == true) // if there are no changes
            {
                return new();
            }
            else // if there is a change but we need to active (old model) / deactivate (current model)
            {
                model.IsActive = true;
            }
            db.UserMeasurementPreferences.Remove(currentPreference);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}