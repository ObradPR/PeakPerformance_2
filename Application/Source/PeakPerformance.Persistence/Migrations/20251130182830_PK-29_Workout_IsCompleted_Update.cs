using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK29_Workout_IsCompleted_Update : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "BodyweightMeasurementUnitId",
                schema: "dbo",
                table: "Workout",
                newName: "BodyweightUnitId");

            migrationBuilder.AddColumn<bool>(
                name: "IsCompleted",
                schema: "dbo",
                table: "Workout",
                type: "bit",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsCompleted",
                schema: "dbo",
                table: "Workout");

            migrationBuilder.RenameColumn(
                name: "BodyweightUnitId",
                schema: "dbo",
                table: "Workout",
                newName: "BodyweightMeasurementUnitId");
        }
    }
}
