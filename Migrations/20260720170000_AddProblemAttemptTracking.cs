using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace MathWorldAPI.Migrations
{
    /// <summary>
    /// Adds immutable problem attempt history and learning progress fields.
    /// يضيف سجل محاولات المسائل غير القابل للاستبدال وحقول تقدم التعلم.
    /// </summary>
    public partial class AddProblemAttemptTracking : Migration
    {
        /// <summary>
        /// Applies the problem attempt tracking schema changes.
        /// يطبق تغييرات مخطط تتبع محاولات المسائل.
        /// </summary>
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BestTimeSeconds",
                table: "UserProgresses",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ConsecutiveCorrectReviews",
                table: "UserProgresses",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "CorrectAttempts",
                table: "UserProgresses",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<DateTime>(
                name: "FirstAttemptAt",
                table: "UserProgresses",
                type: "timestamp with time zone",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "FirstAttemptCorrect",
                table: "UserProgresses",
                type: "boolean",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "FirstSelectedOptionId",
                table: "UserProgresses",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "IncorrectAttempts",
                table: "UserProgresses",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<bool>(
                name: "IsErrorNotebookArchived",
                table: "UserProgresses",
                type: "boolean",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsInErrorNotebook",
                table: "UserProgresses",
                type: "boolean",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "MasteryStatus",
                table: "UserProgresses",
                type: "character varying(32)",
                maxLength: 32,
                nullable: false,
                defaultValue: "New");

            migrationBuilder.AddColumn<DateTime>(
                name: "NextReviewAt",
                table: "UserProgresses",
                type: "timestamp with time zone",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "TotalTimeSpentSeconds",
                table: "UserProgresses",
                type: "bigint",
                nullable: false,
                defaultValue: 0L);

            migrationBuilder.CreateTable(
                name: "ProblemAttempts",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation(
                            "Npgsql:ValueGenerationStrategy",
                            NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    UserId = table.Column<int>(type: "integer", nullable: false),
                    ProblemId = table.Column<int>(type: "integer", nullable: false),
                    SelectedOptionId = table.Column<int>(type: "integer", nullable: false),
                    SelectedOptionText = table.Column<string>(type: "text", nullable: false),
                    CorrectOptionId = table.Column<int>(type: "integer", nullable: false),
                    CorrectOptionText = table.Column<string>(type: "text", nullable: false),
                    IsCorrect = table.Column<bool>(type: "boolean", nullable: false),
                    IsOfficial = table.Column<bool>(type: "boolean", nullable: false),
                    AttemptNumber = table.Column<int>(type: "integer", nullable: false),
                    TimeSpentSeconds = table.Column<int>(type: "integer", nullable: false),
                    PointsEarned = table.Column<int>(type: "integer", nullable: false),
                    UsedHint = table.Column<bool>(type: "boolean", nullable: false),
                    StartedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    SubmittedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey(
                        "PK_ProblemAttempts",
                        item => item.Id);

                    table.ForeignKey(
                        name: "FK_ProblemAttempts_Problems_ProblemId",
                        column: item => item.ProblemId,
                        principalTable: "Problems",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);

                    table.ForeignKey(
                        name: "FK_ProblemAttempts_Users_UserId",
                        column: item => item.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_UserProgresses_UserId_IsInErrorNotebook_IsErrorNotebookArchived",
                table: "UserProgresses",
                columns: new[]
                {
                    "UserId",
                    "IsInErrorNotebook",
                    "IsErrorNotebookArchived"
                });

            migrationBuilder.CreateIndex(
                name: "IX_UserProgresses_UserId_NextReviewAt",
                table: "UserProgresses",
                columns: new[]
                {
                    "UserId",
                    "NextReviewAt"
                });

            migrationBuilder.CreateIndex(
                name: "IX_ProblemAttempts_ProblemId",
                table: "ProblemAttempts",
                column: "ProblemId");

            migrationBuilder.CreateIndex(
                name: "IX_ProblemAttempts_UserId_ProblemId_AttemptNumber",
                table: "ProblemAttempts",
                columns: new[]
                {
                    "UserId",
                    "ProblemId",
                    "AttemptNumber"
                },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ProblemAttempts_UserId_SubmittedAt",
                table: "ProblemAttempts",
                columns: new[]
                {
                    "UserId",
                    "SubmittedAt"
                });

            // Preserve all existing submitted answers as official first attempts.
            migrationBuilder.Sql(
                """
                INSERT INTO "ProblemAttempts"
                (
                    "UserId",
                    "ProblemId",
                    "SelectedOptionId",
                    "SelectedOptionText",
                    "CorrectOptionId",
                    "CorrectOptionText",
                    "IsCorrect",
                    "IsOfficial",
                    "AttemptNumber",
                    "TimeSpentSeconds",
                    "PointsEarned",
                    "UsedHint",
                    "StartedAt",
                    "SubmittedAt"
                )
                SELECT
                    progress."UserId",
                    progress."ProblemId",
                    progress."SelectedOptionId",
                    COALESCE(selected_option."LatexCode", ''),
                    COALESCE(correct_option."Id", 0),
                    COALESCE(correct_option."LatexCode", ''),
                    progress."IsCorrect",
                    TRUE,
                    1,
                    GREATEST(progress."TimeSpentSeconds", 0),
                    CASE
                        WHEN progress."IsCorrect" THEN problem."Points"
                        ELSE 0
                    END,
                    FALSE,
                    progress."LastAttemptAt" -
                        make_interval(
                            secs => GREATEST(progress."TimeSpentSeconds", 0)),
                    progress."LastAttemptAt"
                FROM "UserProgresses" AS progress
                INNER JOIN "Problems" AS problem
                    ON problem."Id" = progress."ProblemId"
                LEFT JOIN "QuestionOptions" AS selected_option
                    ON selected_option."Id" = progress."SelectedOptionId"
                LEFT JOIN LATERAL
                (
                    SELECT option_item."Id", option_item."LatexCode"
                    FROM "QuestionOptions" AS option_item
                    WHERE option_item."ProblemId" = progress."ProblemId"
                      AND option_item."IsCorrect" = TRUE
                    ORDER BY option_item."Order"
                    LIMIT 1
                ) AS correct_option ON TRUE
                WHERE progress."Attempts" > 0;
                """);

            // Initialize summary fields from the legacy progress data.
            migrationBuilder.Sql(
                """
                UPDATE "UserProgresses"
                SET
                    "Attempts" = 1,
                    "FirstAttemptCorrect" = "IsCorrect",
                    "FirstSelectedOptionId" = "SelectedOptionId",
                    "FirstAttemptAt" = "LastAttemptAt",
                    "BestTimeSeconds" = CASE
                        WHEN "IsCorrect" AND "TimeSpentSeconds" > 0
                            THEN "TimeSpentSeconds"
                        ELSE NULL
                    END,
                    "TotalTimeSpentSeconds" = GREATEST("TimeSpentSeconds", 0),
                    "CorrectAttempts" = CASE
                        WHEN "IsCorrect" THEN 1
                        ELSE 0
                    END,
                    "IncorrectAttempts" = CASE
                        WHEN "IsCorrect" THEN 0
                        ELSE 1
                    END,
                    "IsInErrorNotebook" = NOT "IsCorrect",
                    "IsErrorNotebookArchived" = FALSE,
                    "MasteryStatus" = CASE
                        WHEN "IsCorrect" THEN 'Practicing'
                        ELSE 'NeedsReview'
                    END,
                    "NextReviewAt" = CASE
                        WHEN "IsCorrect" THEN NULL
                        ELSE "LastAttemptAt" + INTERVAL '1 day'
                    END,
                    "ConsecutiveCorrectReviews" = 0
                WHERE "Attempts" > 0;
                """);
        }

        /// <summary>
        /// Reverts the problem attempt tracking schema changes.
        /// يعكس تغييرات مخطط تتبع محاولات المسائل.
        /// </summary>
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ProblemAttempts");

            migrationBuilder.DropIndex(
                name: "IX_UserProgresses_UserId_IsInErrorNotebook_IsErrorNotebookArchived",
                table: "UserProgresses");

            migrationBuilder.DropIndex(
                name: "IX_UserProgresses_UserId_NextReviewAt",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "BestTimeSeconds",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "ConsecutiveCorrectReviews",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "CorrectAttempts",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "FirstAttemptAt",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "FirstAttemptCorrect",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "FirstSelectedOptionId",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "IncorrectAttempts",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "IsErrorNotebookArchived",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "IsInErrorNotebook",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "MasteryStatus",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "NextReviewAt",
                table: "UserProgresses");

            migrationBuilder.DropColumn(
                name: "TotalTimeSpentSeconds",
                table: "UserProgresses");
        }
    }
}
