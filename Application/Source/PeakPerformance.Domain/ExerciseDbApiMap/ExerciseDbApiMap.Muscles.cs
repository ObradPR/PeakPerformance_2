namespace PeakPerformance.Domain.ExerciseDbApiMap;

public static partial class ExerciseDbApiMap
{
    public static readonly Dictionary<string, eMuscleGroup> MuscleGroups = new()
    {
        // --- LEGS / LOWER BODY ---
        ["shins"] = eMuscleGroup.Legs,
        ["soleus"] = eMuscleGroup.Legs,
        ["inner thighs"] = eMuscleGroup.Legs,
        ["quadriceps"] = eMuscleGroup.Legs,
        ["quads"] = eMuscleGroup.Legs,
        ["adductors"] = eMuscleGroup.Legs,
        ["abductors"] = eMuscleGroup.Legs,
        ["hamstrings"] = eMuscleGroup.Legs,
        ["glutes"] = eMuscleGroup.Legs,
        ["calves"] = eMuscleGroup.Legs,
        ["feet"] = eMuscleGroup.Legs,
        ["ankles"] = eMuscleGroup.Legs,
        ["ankle stabilizers"] = eMuscleGroup.Legs,

        // --- ARMS / FOREARMS / HANDS ---
        ["hands"] = eMuscleGroup.Arms,
        ["grip muscles"] = eMuscleGroup.Arms,
        ["wrist extensors"] = eMuscleGroup.Arms,
        ["wrist flexors"] = eMuscleGroup.Arms,
        ["wrists"] = eMuscleGroup.Arms,
        ["brachialis"] = eMuscleGroup.Arms,
        ["forearms"] = eMuscleGroup.Arms,
        ["biceps"] = eMuscleGroup.Arms,
        ["triceps"] = eMuscleGroup.Arms,

        // --- BACK ---
        ["latissimus dorsi"] = eMuscleGroup.Back,
        ["lats"] = eMuscleGroup.Back,
        ["upper back"] = eMuscleGroup.Back,
        ["back"] = eMuscleGroup.Back,
        ["trapezius"] = eMuscleGroup.Back,
        ["traps"] = eMuscleGroup.Back,
        ["rear deltoids"] = eMuscleGroup.Back,       // posterior = back involvement
        ["rhomboids"] = eMuscleGroup.Back,
        ["levator scapulae"] = eMuscleGroup.Back,
        ["spine"] = eMuscleGroup.Back,              // erectors/overall back extensor chain
        ["lower back"] = eMuscleGroup.Back,

        // --- CHEST ---
        ["upper chest"] = eMuscleGroup.Chest,
        ["chest"] = eMuscleGroup.Chest,
        ["pectorals"] = eMuscleGroup.Chest,

        // --- SHOULDERS ---
        ["deltoids"] = eMuscleGroup.Shoulders,
        ["delts"] = eMuscleGroup.Shoulders,
        ["shoulders"] = eMuscleGroup.Shoulders,
        ["rotator cuff"] = eMuscleGroup.Shoulders,
        ["serratus anterior"] = eMuscleGroup.Shoulders,  // protraction muscle, fits best here

        // --- CORE ---
        ["lower abs"] = eMuscleGroup.Core,
        ["abdominals"] = eMuscleGroup.Core,
        ["abs"] = eMuscleGroup.Core,
        ["core"] = eMuscleGroup.Core,
        ["obliques"] = eMuscleGroup.Core,
        ["hip flexors"] = eMuscleGroup.Core,
        ["groin"] = eMuscleGroup.Core,

        // --- OTHER / SPECIAL ---
        ["sternocleidomastoid"] = eMuscleGroup.None,
        ["cardiovascular system"] = eMuscleGroup.None
    };
}

[Flags]
public enum eMuscleGroup
{
    None = 0,

    Back = 1 << 0,
    Arms = 1 << 1,
    Chest = 1 << 2,
    Shoulders = 1 << 3,
    Legs = 1 << 4,
    Core = 1 << 5,
}