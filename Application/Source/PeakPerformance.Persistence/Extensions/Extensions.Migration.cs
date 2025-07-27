using System.Text;

namespace PeakPerformance.Persistence.Extensions;

public static partial class Extensions
{
    // USP

    public static void CreateStoreProcedure(this MigrationBuilder migrationBuilder, string name)
    {
        var sqlFile = Path.Combine("Scripts", "StoreProcedures", $"{name}.sql");

        migrationBuilder.DropStoreProcedure(name);
        migrationBuilder.ReadAndExecuteQuery(sqlFile);
    }

    public static void DropStoreProcedure(this MigrationBuilder migrationBuilder, string name)
        => migrationBuilder.Sql($@"
                                    IF OBJECT_ID('{name}', 'P') IS NOT NULL
                                    BEGIN
                                        DROP PROCEDURE {name};
                                    END
                                    GO
                                ");

    // Indexes

    public static void Up(this MigrationBuilder migrationBuilder, IDatabaseIndex index)
        => migrationBuilder.Sql(index.DropSql + "\n" + index.Sql);

    public static void Down(this MigrationBuilder migrationBuilder, IDatabaseIndex index)
        => migrationBuilder.Sql(index.DropSql);

    public static void Up(this MigrationBuilder migrationBuilder, IEnumerable<IDatabaseIndex> indexes)
        => indexes.ToList().ForEach(_ => migrationBuilder.Sql(_.DropSql + "\n" + _.Sql));

    public static void Down(this MigrationBuilder migrationBuilder, IEnumerable<IDatabaseIndex> indexes)
        => indexes.ToList().ForEach(_ => migrationBuilder.Sql(_.DropSql));

    // Views

    public static void Up<TEnum>(this MigrationBuilder migrationBuilder, string schema = null)
        where TEnum : struct, Enum
    {
        var enumType = typeof(TEnum);
        var enumValues = Enum.GetValues<TEnum>();

        var viewName = $"vw_{enumType.Name}";
        var fullViewName = schema != null ? $"{schema}.{viewName}" : $"dbo.{viewName}";

        var sqlBuilder = new StringBuilder();
        sqlBuilder.AppendLine($"CREATE OR ALTER VIEW {fullViewName} AS");

        var unionParts = enumValues
            .Select(e => $"SELECT {(int)(object)e} AS Id, '{e.GetDescription()}' AS Name");

        sqlBuilder.AppendLine(string.Join("\nUNION ALL\n", unionParts));
        sqlBuilder.Append(';');

        migrationBuilder.Sql(sqlBuilder.ToString());
    }

    public static void Down<TEnum>(this MigrationBuilder migrationBuilder, string schema = null)
        where TEnum : Enum
    {
        var viewName = $"vw_{typeof(TEnum).Name}";
        var fullViewName = schema != null ? $"{schema}.{viewName}" : $"dbo.{viewName}";

        migrationBuilder.Sql($"DROP VIEW IF EXISTS {fullViewName};");
    }

    // private

    private static void ReadAndExecuteQuery(this MigrationBuilder migrationBuilder, string sqlFile)
        => migrationBuilder.Sql(File.ReadAllText(sqlFile));
}