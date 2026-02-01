using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK25_User_DeactivateReason_Add : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "DeactivateReason",
                schema: "dbo",
                table: "User",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DeactivateReason",
                schema: "dbo",
                table: "User");
        }
    }
}
