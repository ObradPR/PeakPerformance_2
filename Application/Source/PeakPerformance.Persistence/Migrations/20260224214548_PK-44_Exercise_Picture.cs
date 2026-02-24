using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK44_Exercise_Picture : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Exercise_ApiExerciseId",
                schema: "dbo",
                table: "Exercise");

            migrationBuilder.AlterColumn<string>(
                name: "ApiExerciseId",
                schema: "dbo",
                table: "Exercise",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            migrationBuilder.AddColumn<string>(
                name: "ProfilePictureUrl",
                schema: "dbo",
                table: "Exercise",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PublicId",
                schema: "dbo",
                table: "Exercise",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ProfilePictureUrl",
                schema: "dbo",
                table: "Exercise");

            migrationBuilder.DropColumn(
                name: "PublicId",
                schema: "dbo",
                table: "Exercise");

            migrationBuilder.AlterColumn<string>(
                name: "ApiExerciseId",
                schema: "dbo",
                table: "Exercise",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Exercise_ApiExerciseId",
                schema: "dbo",
                table: "Exercise",
                column: "ApiExerciseId",
                unique: true);
        }
    }
}
