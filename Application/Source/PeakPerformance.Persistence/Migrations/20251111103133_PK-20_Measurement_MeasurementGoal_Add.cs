using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK20_Measurement_MeasurementGoal_Add : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Measurement",
                schema: "dbo",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<long>(type: "bigint", nullable: false),
                    Waist = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    Hips = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    Neck = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    Chest = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    Shoulders = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    RightBicep = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    LeftBicep = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    RightForearm = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    LeftForearm = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    RightThigh = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    LeftThigh = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    RightCalf = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    LeftCalf = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    MeasurementUnitId = table.Column<int>(type: "int", nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedBy = table.Column<long>(type: "bigint", nullable: false),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ModifiedBy = table.Column<long>(type: "bigint", nullable: true),
                    DeletedOn = table.Column<DateTime>(type: "datetime2", nullable: true),
                    DeletedBy = table.Column<long>(type: "bigint", nullable: true),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Measurement", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Measurement_User_UserId",
                        column: x => x.UserId,
                        principalSchema: "dbo",
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "MeasurementGoal",
                schema: "dbo",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<long>(type: "bigint", nullable: false),
                    Waist = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    Hips = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    Neck = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    Chest = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    Shoulders = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    RightBicep = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    LeftBicep = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    RightForearm = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    LeftForearm = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    RightThigh = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    LeftThigh = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    RightCalf = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    LeftCalf = table.Column<decimal>(type: "decimal(4,1)", precision: 4, scale: 1, nullable: true),
                    MeasurementUnitId = table.Column<int>(type: "int", nullable: false),
                    StartDate = table.Column<DateTime>(type: "date", nullable: false),
                    EndDate = table.Column<DateTime>(type: "date", nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedBy = table.Column<long>(type: "bigint", nullable: false),
                    ModifiedOn = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ModifiedBy = table.Column<long>(type: "bigint", nullable: true),
                    DeletedOn = table.Column<DateTime>(type: "datetime2", nullable: true),
                    DeletedBy = table.Column<long>(type: "bigint", nullable: true),
                    IsActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MeasurementGoal", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MeasurementGoal_User_UserId",
                        column: x => x.UserId,
                        principalSchema: "dbo",
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Measurement_IsActive",
                schema: "dbo",
                table: "Measurement",
                column: "IsActive",
                filter: "[IsActive] = 1");

            migrationBuilder.CreateIndex(
                name: "IX_Measurement_UserId",
                schema: "dbo",
                table: "Measurement",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_MeasurementGoal_IsActive",
                schema: "dbo",
                table: "MeasurementGoal",
                column: "IsActive",
                filter: "[IsActive] = 1");

            migrationBuilder.CreateIndex(
                name: "IX_MeasurementGoal_UserId",
                schema: "dbo",
                table: "MeasurementGoal",
                column: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Measurement",
                schema: "dbo");

            migrationBuilder.DropTable(
                name: "MeasurementGoal",
                schema: "dbo");
        }
    }
}
