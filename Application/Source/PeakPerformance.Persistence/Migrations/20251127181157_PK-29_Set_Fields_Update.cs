using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK29_Set_Fields_Update : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "WeightMeasurementUnitId",
                schema: "dbo",
                table: "WorkoutExerciseSet",
                newName: "WeightUnitId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "WeightUnitId",
                schema: "dbo",
                table: "WorkoutExerciseSet",
                newName: "WeightMeasurementUnitId");
        }
    }
}
