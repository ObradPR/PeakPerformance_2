using PeakPerformance.Application.Dtos.Bodyweights;

namespace PeakPerformance.Application.BusinessLogic.Bodyweights.Commands;

public class SaveBodyweightCommand(BodyweightDto data) : IRequest<BaseResponseWrapper>
{
    public BodyweightDto Data { get; set; } = data;

    public class SaveBodyweightCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<SaveBodyweightCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SaveBodyweightCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(Bodyweight), ResourceValidation.Required.FormatWith(nameof(Bodyweight))));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await db.Bodyweights.GetSingleAsync(request.Data.Id)
                : null;

            var model = existingModel ?? new();
            request.Data.ToModel(model, identityUser.Id);

            if (model.IsNew)
                db.Bodyweights.Add(model);

            // Upate workouts bodyweight
            if (await db.Workouts.AnyAsync(_ => _.UserId == identityUser.Id, cancellationToken))
            {
                var nextBodyweightLogDate = await db.Bodyweights
                   .Where(_ => _.UserId == identityUser.Id && _.LogDate > model.LogDate)
                   .OrderBy(_ => _.LogDate)
                   .Select(_ => (DateTime?)_.LogDate)
                   .FirstOrDefaultAsync(cancellationToken);

                var workouts = new List<Workout>();

                workouts = nextBodyweightLogDate.HasValue
                    ? await db.Workouts
                        .Where(_ => _.UserId == identityUser.Id && _.LogDate >= model.LogDate && _.LogDate < nextBodyweightLogDate.Value)
                        .ToListAsync(cancellationToken)
                    : await db.Workouts
                        .Where(_ => _.UserId == identityUser.Id && _.LogDate >= model.LogDate)
                        .ToListAsync(cancellationToken);

                workouts.ForEach(_ =>
                {
                    _.Bodyweight = model.Value;
                    _.BodyweightUnitId = model.WeightUnitId;
                });
            }

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}