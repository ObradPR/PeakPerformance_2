using PeakPerformance.Application.Dtos.Workouts;
using PeakPerformance.Domain.Exceptions;
using PeakPerformance.Domain.ExerciseDbApiMap;

namespace PeakPerformance.Application.BusinessLogic.Workouts.Queries;

public class GetSingleWorkoutQuery(long id) : IRequest<ResponseWrapper<WorkoutDto>>
{
    public long Id { get; set; } = id;

    public class GetSingleWorkoutQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetSingleWorkoutQuery, ResponseWrapper<WorkoutDto>>
    {
        public async Task<ResponseWrapper<WorkoutDto>> Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken)
        {
            //var userId = identityUser.Id;

            var model = await db.Workouts
                .Include(_ => _.WorkoutExercises)
                    .ThenInclude(_ => _.WorkoutExerciseSets)
                 .Include(_ => _.WorkoutExercises)
                    .ThenInclude(_ => _.Exercise)
                .FirstOrDefaultAsync(_ => _.Id == request.Id, cancellationToken)
                ?? throw new NotFoundException();

            var data = mapper.Map<WorkoutDto>(model);

            data.PreviousWorkoutId = await db.Workouts
                .Where(_ => _.UserId == model.UserId &&
                            (_.LogDate < model.LogDate ||
                            (_.LogDate == model.LogDate && _.Id < model.Id)))
                .OrderByDescending(_ => _.LogDate)
                    .ThenByDescending(_ => _.Id)
                .Select(_ => (long?)_.Id)
                .FirstOrDefaultAsync(cancellationToken);

            data.NextWorkoutId = await db.Workouts
                .Where(_ => _.UserId == model.UserId &&
                            (_.LogDate > model.LogDate ||
                            (_.LogDate == model.LogDate && _.Id > model.Id)))
                .OrderBy(_ => _.LogDate)
                    .ThenBy(_ => _.Id)
                .Select(_ => (long?)_.Id)
                .FirstOrDefaultAsync(cancellationToken);

            var userMeasurementUnitId = (await db.UserMeasurementPreferences
                .FirstOrDefaultAsync(_ => _.UserId == identityUser.Id, cancellationToken))
                .WeightUnitId;

            var allSets = data.Exercises.SelectMany(e => e.Sets).ToList();
            var workingSets = allSets.Where(s => s.TypeId != eSetType.Warmup).ToList();

            var strengthSets = data.Exercises
                .Where(_ => _.IsStrength == true)
                .SelectMany(_ => _.Sets)
                .Where(_ => _.TypeId != eSetType.Warmup);

            var bodyweightSets = data.Exercises
                .Where(_ => _.IsBodyweight == true)
                .SelectMany(_ => _.Sets)
                .Where(_ => _.TypeId != eSetType.Warmup);

            var cardioSets = data.Exercises
                .Where(_ => _.IsCardio == true)
                .SelectMany(_ => _.Sets)
                .Where(_ => _.TypeId != eSetType.Warmup);

            var totalReps = workingSets.Sum(s => s.Reps);
            var totalSets = workingSets.Count;

            var strengthVolume = strengthSets.Sum(_ => _.Reps * _.Weight.Value.ConvertUnitValue(_.WeightUnitId.Value, userMeasurementUnitId));

            var bodyweightVolume = (data.Bodyweight != null)
                ? bodyweightSets.Sum(_ =>
                    _.Reps * data.Bodyweight.Value.ConvertUnitValue(data.BodyweightUnitId.Value, userMeasurementUnitId))
                : 0;

            var cardioTime = cardioSets.Sum(s => s.DurationMinutes ?? 0);

            data.Total = new()
            {
                Reps = totalReps,
                Sets = totalSets,
                Volume = strengthVolume + bodyweightVolume,
                CardioTime = cardioTime
            };

            if (data.IsCompleted == true)
            {
                // 70% / 30% rule
                var workoutData = new Dictionary<eMuscleGroup, decimal>();

                foreach (var exercise in data.Exercises)
                {
                    if (exercise.IsCardio == true)
                        continue;

                    var volume = exercise.Sets.Sum(_ => exercise.IsStrength == true
                        ? _.Reps * _.Weight.Value.ConvertUnitValue(_.WeightUnitId.Value, userMeasurementUnitId)                     // Strength
                        : _.Reps * data.Bodyweight.Value.ConvertUnitValue(data.BodyweightUnitId.Value, userMeasurementUnitId));     // Bodyweight

                    if (volume == null)
                        continue;

                    // primary - 70%

                    var primaryFlags = exercise.PrimaryMuscleGroupId.GetFlags();

                    var primaryVolumeTotal = volume.Value * 0.7m;
                    var primarySplit = primaryVolumeTotal / primaryFlags.Count;

                    foreach (var group in primaryFlags)
                        workoutData[group] = workoutData.GetValueOrDefault(group) + primarySplit;

                    // secondary - 30%

                    var secondary = exercise.SecondaryMuscleGroupId?.GetFlags();
                    if (secondary.IsNullOrEmpty())
                        continue;

                    var secondaryVolumeTotal = volume.Value * 0.3m;
                    var secondarySplit = secondaryVolumeTotal / secondary.Count;

                    foreach (var group in secondary)
                        workoutData[group] = workoutData.GetValueOrDefault(group) + secondarySplit;
                }

                data.MuscleGroupsTotalVolume = workoutData
                    .Select(_ => new MuscleGroupTotalVolumeDto
                    {
                        Name = _.Key.ToString(),
                        Volume = _.Value
                    })
                    .ToList();
            }

            return new(data);
        }
    }
}