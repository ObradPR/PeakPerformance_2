using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK29_Exercise_MuscleGroupsId_Update : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "PrimaryMuscleGroupId",
                schema: "dbo",
                table: "Exercise",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "SecondaryMuscleGroupId",
                schema: "dbo",
                table: "Exercise",
                type: "int",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PrimaryMuscleGroupId",
                schema: "dbo",
                table: "Exercise");

            migrationBuilder.DropColumn(
                name: "SecondaryMuscleGroupId",
                schema: "dbo",
                table: "Exercise");
        }
    }
}
