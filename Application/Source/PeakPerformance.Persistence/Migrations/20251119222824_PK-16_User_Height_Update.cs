using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK16_User_Height_Update : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<decimal>(
                name: "Height",
                schema: "dbo",
                table: "User",
                type: "decimal(4,1)",
                precision: 4,
                scale: 1,
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "Height",
                schema: "dbo",
                table: "User",
                type: "int",
                nullable: true,
                oldClrType: typeof(decimal),
                oldType: "decimal(4,1)",
                oldPrecision: 4,
                oldScale: 1,
                oldNullable: true);
        }
    }
}
