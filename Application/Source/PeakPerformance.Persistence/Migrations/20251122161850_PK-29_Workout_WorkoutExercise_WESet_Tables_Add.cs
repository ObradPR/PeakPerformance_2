using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PeakPerformance.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class PK29_Workout_WorkoutExercise_WESet_Tables_Add : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Workout",
                schema: "dbo",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<long>(type: "bigint", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Notes = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CopiedFromId = table.Column<long>(type: "bigint", nullable: true),
                    LogDate = table.Column<DateTime>(type: "date", nullable: false),
                    StartAt = table.Column<TimeOnly>(type: "time", nullable: true),
                    FinishAt = table.Column<TimeOnly>(type: "time", nullable: true),
                    Bodyweight = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    BodyweightMeasurementUnitId = table.Column<int>(type: "int", nullable: true),
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
                    table.PrimaryKey("PK_Workout", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Workout_User_UserId",
                        column: x => x.UserId,
                        principalSchema: "dbo",
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Workout_Workout_CopiedFromId",
                        column: x => x.CopiedFromId,
                        principalSchema: "dbo",
                        principalTable: "Workout",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "WorkoutExercise",
                schema: "dbo",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    WorkoutId = table.Column<long>(type: "bigint", nullable: false),
                    ExerciseId = table.Column<long>(type: "bigint", nullable: false),
                    Notes = table.Column<string>(type: "nvarchar(max)", nullable: true),
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
                    table.PrimaryKey("PK_WorkoutExercise", x => x.Id);
                    table.ForeignKey(
                        name: "FK_WorkoutExercise_Exercise_ExerciseId",
                        column: x => x.ExerciseId,
                        principalSchema: "dbo",
                        principalTable: "Exercise",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_WorkoutExercise_Workout_WorkoutId",
                        column: x => x.WorkoutId,
                        principalSchema: "dbo",
                        principalTable: "Workout",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "WorkoutExerciseSet",
                schema: "dbo",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    WorkoutExerciseId = table.Column<long>(type: "bigint", nullable: false),
                    Weight = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    WeightMeasurementUnitId = table.Column<int>(type: "int", nullable: true),
                    Reps = table.Column<int>(type: "int", nullable: false),
                    RpeTypeId = table.Column<int>(type: "int", nullable: true),
                    TypeId = table.Column<int>(type: "int", nullable: true),
                    Rest = table.Column<int>(type: "int", nullable: false),
                    Notes = table.Column<string>(type: "nvarchar(max)", nullable: true),
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
                    table.PrimaryKey("PK_WorkoutExerciseSet", x => x.Id);
                    table.ForeignKey(
                        name: "FK_WorkoutExerciseSet_WorkoutExercise_WorkoutExerciseId",
                        column: x => x.WorkoutExerciseId,
                        principalSchema: "dbo",
                        principalTable: "WorkoutExercise",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Workout_CopiedFromId",
                schema: "dbo",
                table: "Workout",
                column: "CopiedFromId");

            migrationBuilder.CreateIndex(
                name: "IX_Workout_IsActive",
                schema: "dbo",
                table: "Workout",
                column: "IsActive",
                filter: "[IsActive] = 1");

            migrationBuilder.CreateIndex(
                name: "IX_Workout_UserId",
                schema: "dbo",
                table: "Workout",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_WorkoutExercise_ExerciseId",
                schema: "dbo",
                table: "WorkoutExercise",
                column: "ExerciseId");

            migrationBuilder.CreateIndex(
                name: "IX_WorkoutExercise_IsActive",
                schema: "dbo",
                table: "WorkoutExercise",
                column: "IsActive",
                filter: "[IsActive] = 1");

            migrationBuilder.CreateIndex(
                name: "IX_WorkoutExercise_WorkoutId",
                schema: "dbo",
                table: "WorkoutExercise",
                column: "WorkoutId");

            migrationBuilder.CreateIndex(
                name: "IX_WorkoutExerciseSet_IsActive",
                schema: "dbo",
                table: "WorkoutExerciseSet",
                column: "IsActive",
                filter: "[IsActive] = 1");

            migrationBuilder.CreateIndex(
                name: "IX_WorkoutExerciseSet_WorkoutExerciseId",
                schema: "dbo",
                table: "WorkoutExerciseSet",
                column: "WorkoutExerciseId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "WorkoutExerciseSet",
                schema: "dbo");

            migrationBuilder.DropTable(
                name: "WorkoutExercise",
                schema: "dbo");

            migrationBuilder.DropTable(
                name: "Workout",
                schema: "dbo");
        }
    }
}
