using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK29_WorkoutExercise_WESets_Order : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Order",
                schema: "dbo",
                table: "WorkoutExerciseSet",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Order",
                schema: "dbo",
                table: "WorkoutExercise",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Order",
                schema: "dbo",
                table: "WorkoutExerciseSet");

            migrationBuilder.DropColumn(
                name: "Order",
                schema: "dbo",
                table: "WorkoutExercise");
        }
    }
}
