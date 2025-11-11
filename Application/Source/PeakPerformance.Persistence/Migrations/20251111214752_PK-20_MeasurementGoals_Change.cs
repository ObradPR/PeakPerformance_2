using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK20_MeasurementGoals_Change : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Chest",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "Hips",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "LeftBicep",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "LeftCalf",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "LeftForearm",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "LeftThigh",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "Neck",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "RightBicep",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "RightCalf",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "RightForearm",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "RightThigh",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "Shoulders",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "Waist",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.AddColumn<int>(
                name: "BodyPartId",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<decimal>(
                name: "Size",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: false,
                defaultValue: 0m);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "BodyPartId",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.DropColumn(
                name: "Size",
                schema: "dbo",
                table: "MeasurementGoal");

            migrationBuilder.AddColumn<decimal>(
                name: "Chest",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "Hips",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "LeftBicep",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "LeftCalf",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "LeftForearm",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "LeftThigh",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "Neck",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "RightBicep",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "RightCalf",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "RightForearm",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "RightThigh",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "Shoulders",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "Waist",
                schema: "dbo",
                table: "MeasurementGoal",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true);
        }
    }
}
