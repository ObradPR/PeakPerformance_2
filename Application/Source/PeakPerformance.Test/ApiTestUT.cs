using PeakPerformance.Application.Dtos.Exercises;
using System.Text.Json;

namespace PeakPerformance.Test;

internal class ApiTestUT
{
    [SetUp]
    public void Setup()
    {
    }

    [Test]
    public async Task Api_Test_Equipments()
    {
        string apiUrl = "https://www.exercisedb.dev/api/v1/exercises";
        int limit = 25;
        int offset = 0;
        bool moreData = true;

        var allExercises = new List<ExerciseDbApiDataDto>();

        using var client = new HttpClient();

        while (moreData)
        {
            var url = $"{apiUrl}?limit={limit}&offset={offset}";
            var response = await client.GetStringAsync(url);
            var apiResponse = JsonSerializer.Deserialize<ExerciseDbApiDto>(response, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });

            if (apiResponse?.Data == null || apiResponse.Data.Length == 0)
            {
                moreData = false;
                break;
            }

            allExercises.AddRange(apiResponse.Data);
            offset += limit;
        }

        Console.WriteLine($"Total exercises fetched: {allExercises.Count}");

        // LINQ to find exercises with multiple equipments
        var multipleEquipment = allExercises
            .Where(e => e.Equipments != null && e.Equipments.Length > 1)
            .ToList();

        Console.WriteLine($"Exercises with multiple equipments: {multipleEquipment.Count}");
        foreach (var ex in multipleEquipment)
        {
            Console.WriteLine($"{ex.Name}: {string.Join(", ", ex.Equipments)}");
        }
    }
}