using System;
using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace MathWorldAPI.Migrations
{
    /// <summary>
    /// Introduces immutable solve credit. The historical backfill takes the
    /// awarded values from saved attempts, never today's editable question points.
    /// Run after a backup and before shipping code that queries PointLedger.
    /// </summary>
    [DbContext(typeof(AppDbContext))]
    [Migration("20261113130000_AddPointLedger")]
    public partial class AddPointLedger : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "PointLedger",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy",
                            NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    UserId = table.Column<int>(type: "integer", nullable: false),
                    ProblemId = table.Column<int>(type: "integer", nullable: false),
                    StageId = table.Column<int>(type: "integer", nullable: false),
                    AttemptId = table.Column<int>(type: "integer", nullable: false),
                    Reason = table.Column<string>(type: "character varying(40)",
                        maxLength: 40, nullable: false),
                    Points = table.Column<int>(type: "integer", nullable: false),
                    FirstTryCorrect = table.Column<bool>(type: "boolean", nullable: false),
                    AwardedAt = table.Column<DateTime>(
                        type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PointLedger", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PointLedger_Users_UserId", column: x => x.UserId,
                        principalTable: "Users", principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PointLedger_Problems_ProblemId", column: x => x.ProblemId,
                        principalTable: "Problems", principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PointLedger_EducationalStages_StageId", column: x => x.StageId,
                        principalTable: "EducationalStages", principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PointLedger_ProblemAttempts_AttemptId", column: x => x.AttemptId,
                        principalTable: "ProblemAttempts", principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PointLedger_UserId_ProblemId_Reason",
                table: "PointLedger", columns: new[] { "UserId", "ProblemId", "Reason" },
                unique: true);
            migrationBuilder.CreateIndex(
                name: "IX_PointLedger_AttemptId", table: "PointLedger",
                column: "AttemptId", unique: true);
            migrationBuilder.CreateIndex(
                name: "IX_PointLedger_StageId_AwardedAt", table: "PointLedger",
                columns: new[] { "StageId", "AwardedAt" });
            migrationBuilder.CreateIndex(
                name: "IX_PointLedger_ProblemId", table: "PointLedger",
                column: "ProblemId");

            // Solves with zero assigned points must still count as a unique solve.
            // Prefer the original positively-awarded attempt when multiple
            // historic correct attempts exist; otherwise use the first correct.
            migrationBuilder.Sql(@"
                INSERT INTO ""PointLedger""
                    (""UserId"", ""ProblemId"", ""StageId"", ""AttemptId"",
                     ""Reason"", ""Points"", ""FirstTryCorrect"", ""AwardedAt"")
                SELECT a.""UserId"", a.""ProblemId"", p.""StageId"", a.""Id"",
                       'SolveCredit', GREATEST(a.""PointsEarned"", 0),
                       COALESCE(up.""FirstAttemptCorrect"", FALSE),
                       a.""SubmittedAt""
                FROM (
                    SELECT DISTINCT ON (pa.""UserId"", pa.""ProblemId"")
                           pa.""Id"", pa.""UserId"", pa.""ProblemId"",
                           pa.""PointsEarned"", pa.""SubmittedAt""
                    FROM ""ProblemAttempts"" pa
                    INNER JOIN ""UserProgresses"" hist
                        ON hist.""UserId"" = pa.""UserId""
                       AND hist.""ProblemId"" = pa.""ProblemId""
                       AND hist.""IsSolved"" = TRUE
                    WHERE pa.""IsCorrect"" = TRUE
                    ORDER BY pa.""UserId"", pa.""ProblemId"",
                             CASE WHEN pa.""PointsEarned"" > 0 THEN 0 ELSE 1 END,
                             pa.""SubmittedAt"", pa.""Id""
                ) a
                INNER JOIN ""Problems"" p ON p.""Id"" = a.""ProblemId""
                INNER JOIN ""UserProgresses"" up
                    ON up.""UserId"" = a.""UserId""
                   AND up.""ProblemId"" = a.""ProblemId"";
            ");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            // Do not run Down against production with earned credits.
            migrationBuilder.DropTable(name: "PointLedger");
        }
    }
}
