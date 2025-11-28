using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK29_Exercise_Equipment_Types_Update : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "EquipmentName",
                schema: "dbo",
                table: "Exercise",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsBodyweight",
                schema: "dbo",
                table: "Exercise",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsCardio",
                schema: "dbo",
                table: "Exercise",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsStrength",
                schema: "dbo",
                table: "Exercise",
                type: "bit",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "EquipmentName",
                schema: "dbo",
                table: "Exercise");

            migrationBuilder.DropColumn(
                name: "IsBodyweight",
                schema: "dbo",
                table: "Exercise");

            migrationBuilder.DropColumn(
                name: "IsCardio",
                schema: "dbo",
                table: "Exercise");

            migrationBuilder.DropColumn(
                name: "IsStrength",
                schema: "dbo",
                table: "Exercise");
        }
    }
}
