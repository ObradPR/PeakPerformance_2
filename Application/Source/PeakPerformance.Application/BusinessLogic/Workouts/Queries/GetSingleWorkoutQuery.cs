using PeakPerformance.Application.Dtos.Workouts;
using PeakPerformance.Domain.Exceptions;
using PeakPerformance.Domain.ExerciseDbApiMap;

namespace PeakPerformance.Application.BusinessLogic.Workouts.Queries;

public class GetSingleWorkoutQuery(WorkoutSearchOptions options) : IRequest<ResponseWrapper<WorkoutDto>>
{
    public WorkoutSearchOptions Options { get; set; } = options;

    public class GetSingleWorkoutQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetSingleWorkoutQuery, ResponseWrapper<WorkoutDto>>
    {
        public async Task<ResponseWrapper<WorkoutDto>> Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken)
        {
            if (request.Options.Id.IsNullOrEmpty())
                return new();

            var userId = request.Options.UserId ?? identityUser.Id;

            if (!await db.Users.AnyAsync(_ => _.Id == userId && (userId == identityUser.Id || _.IsPrivate != true), cancellationToken))
            {
                throw new ForbiddenException();
            }

            var model = await db.Workouts
                .Include(_ => _.WorkoutExercises)
                    .ThenInclude(_ => _.WorkoutExerciseSets)
                 .Include(_ => _.WorkoutExercises)
                    .ThenInclude(_ => _.Exercise)
                .FirstOrDefaultAsync(_ => _.Id == request.Options.Id && _.UserId == userId, cancellationToken)
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

                    var volume = exercise.Sets.Where(_ => _.TypeId != eSetType.Warmup).Sum(_ => exercise.IsStrength == true
                        ? _.Reps * _.Weight.Value.ConvertUnitValue(_.WeightUnitId.Value, userMeasurementUnitId)                     // Strength
                        : _.Reps * data.Bodyweight.Value.ConvertUnitValue(data.BodyweightUnitId.Value, userMeasurementUnitId));     // Bodyweight

                    if (volume == null)
                        continue;

                    // primary - 70%

                    var primaryFlags = exercise.PrimaryMuscleGroupId.GetFlags();

                    var primaryVolumeTotal = volume.Value * 0.7m;
                    var primarySplit = Math.Round(primaryVolumeTotal / primaryFlags.Count);

                    foreach (var group in primaryFlags)
                        workoutData[group] = workoutData.GetValueOrDefault(group) + primarySplit;

                    // secondary - 30%

                    var secondary = exercise.SecondaryMuscleGroupId?.GetFlags();
                    if (secondary.IsNullOrEmpty())
                        continue;

                    var secondaryVolumeTotal = volume.Value * 0.3m;
                    var secondarySplit = Math.Round(secondaryVolumeTotal / secondary.Count);

                    foreach (var group in secondary)
                        workoutData[group] = workoutData.GetValueOrDefault(group) + secondarySplit;
                }

                foreach (var group in Common.Extensions.Extensions.GetValues<eMuscleGroup>())
                {
                    if (group == eMuscleGroup.None)
                        continue;

                    if (!workoutData.ContainsKey(group))
                        workoutData[group] = 0m;
                }

                data.MuscleGroupsTotalVolume = workoutData
                    .Select(_ => new { Group = _.Key, Volume = _.Value })
                    .OrderBy(_ => (int)_.Group)
                    .Select(_ => new MuscleGroupTotalVolumeDto
                    {
                        Name = _.Group.ToString(),
                        Volume = _.Volume
                    })
                    .ToList();

                // the previous data for stats

                if (data.PreviousWorkoutId.IsNotNullOrEmpty())
                {
                    var previousWorkout = await db.Workouts
                        .Include(_ => _.WorkoutExercises)
                           .ThenInclude(_ => _.WorkoutExerciseSets)
                        .Include(_ => _.WorkoutExercises)
                            .ThenInclude(_ => _.Exercise)
                        .Where(_ => _.LogDate <= model.LogDate)
                        .OrderByDescending(_ => _.LogDate)
                            .ThenByDescending(_ => _.Id)
                        .FirstOrDefaultAsync(_ => _.Id == data.PreviousWorkoutId, cancellationToken);

                    var previousData = mapper.Map<WorkoutDto>(previousWorkout);

                    var previousSets = previousData.Exercises.SelectMany(e => e.Sets).ToList();
                    var previousWorkingSets = previousSets.Where(s => s.TypeId != eSetType.Warmup).ToList();

                    var previousStrengthSets = previousData.Exercises
                        .Where(_ => _.IsStrength == true)
                        .SelectMany(_ => _.Sets)
                        .Where(_ => _.TypeId != eSetType.Warmup);

                    var previousBodyweightSets = previousData.Exercises
                        .Where(_ => _.IsBodyweight == true)
                        .SelectMany(_ => _.Sets)
                        .Where(_ => _.TypeId != eSetType.Warmup);

                    var previousCardioSets = previousData.Exercises
                        .Where(_ => _.IsCardio == true)
                        .SelectMany(_ => _.Sets)
                        .Where(_ => _.TypeId != eSetType.Warmup);

                    var previousTotalReps = previousWorkingSets.Sum(s => s.Reps);
                    var previousTotalSets = previousWorkingSets.Count;

                    var previousStrengthVolume = previousStrengthSets.Sum(_ => _.Reps * _.Weight.Value.ConvertUnitValue(_.WeightUnitId.Value, userMeasurementUnitId));

                    var previousBodyweightVolume = (previousData.Bodyweight != null)
                        ? previousBodyweightSets.Sum(_ =>
                            _.Reps * previousData.Bodyweight.Value.ConvertUnitValue(previousData.BodyweightUnitId.Value, userMeasurementUnitId))
                        : 0;

                    var previousCardioTime = previousCardioSets.Sum(s => s.DurationMinutes ?? 0);

                    data.PreviousWorkoutTotal = new()
                    {
                        RepsDiff = data.Total.Reps - previousTotalReps,
                        SetsDiff = data.Total.Sets - previousTotalSets,
                        VolumeDiff = data.Total.Volume - (previousStrengthVolume + previousBodyweightVolume),
                        CardioTimeDiff = data.Total.CardioTime - previousCardioTime,
                    };
                }
            }

            return new(data);
        }
    }
}