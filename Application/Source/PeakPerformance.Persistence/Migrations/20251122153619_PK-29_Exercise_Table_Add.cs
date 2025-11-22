using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK29_Exercise_Table_Add : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Exercise",
                schema: "dbo",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ApiExerciseId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Exercise", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Exercise_ApiExerciseId",
                schema: "dbo",
                table: "Exercise",
                column: "ApiExerciseId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Exercise_Name",
                schema: "dbo",
                table: "Exercise",
                column: "Name",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Exercise",
                schema: "dbo");
        }
    }
}
