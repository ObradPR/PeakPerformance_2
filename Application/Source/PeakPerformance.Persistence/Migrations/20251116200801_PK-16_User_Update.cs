using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK16_User_Update : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<long>(
                name: "CountryId",
                schema: "dbo",
                table: "User",
                type: "bigint",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Height",
                schema: "dbo",
                table: "User",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsPrivate",
                schema: "dbo",
                table: "User",
                type: "bit",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_User_CountryId",
                schema: "dbo",
                table: "User",
                column: "CountryId");

            migrationBuilder.AddForeignKey(
                name: "FK_User_Country_CountryId",
                schema: "dbo",
                table: "User",
                column: "CountryId",
                principalSchema: "dbo",
                principalTable: "Country",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_User_Country_CountryId",
                schema: "dbo",
                table: "User");

            migrationBuilder.DropIndex(
                name: "IX_User_CountryId",
                schema: "dbo",
                table: "User");

            migrationBuilder.DropColumn(
                name: "CountryId",
                schema: "dbo",
                table: "User");

            migrationBuilder.DropColumn(
                name: "Height",
                schema: "dbo",
                table: "User");

            migrationBuilder.DropColumn(
                name: "IsPrivate",
                schema: "dbo",
                table: "User");
        }
    }
}
