using System.Text;

namespace PeakPerformance.Test.Migrations;

public class Tests
{
    [SetUp]
    public void Setup()
    {
    }

    [Test]
    public void Country_CreateScript()
    {
        string csvPath = @"D:\countries.csv";
        var lines = File.ReadAllLines(csvPath, Encoding.UTF8);

        var sb = new StringBuilder();
        sb.AppendLine("INSERT INTO Country (Id, ISO2, ISO3, Name) VALUES");

        int id = 1;

        foreach (var line in lines.Skip(1)) // skip header
        {
            if (string.IsNullOrWhiteSpace(line))
                continue;

            var parts = line.Split(',');

            string iso2 = parts[0].Trim().ToUpper();
            string iso3 = parts[1].Trim().ToUpper();
            string countryCommon = parts[4].Trim(); // index 4 = country_common

            // Escape for SQL (O'Brien → O''Brien)
            countryCommon = countryCommon.Replace("'", "''");

            sb.AppendLine(
                $"({id}, N'{iso2}', N'{iso3}', N'{countryCommon}'),"
            );

            id++;
        }

        // Remove trailing comma and finish with ;
        string sql = sb.ToString().TrimEnd(',', '\r', '\n') + ";";

        File.WriteAllText(@"D:\country_seed.sql", sql);
    }
}