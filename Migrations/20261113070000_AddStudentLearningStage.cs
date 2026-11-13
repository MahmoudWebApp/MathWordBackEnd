using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations
{
    /// <summary>
    /// Saves a learner's optional stage selection. Existing users and
    /// all historical progress/attempt rows are left untouched.
    /// </summary>
    [DbContext(typeof(AppDbContext))]
    [Migration("20261113070000_AddStudentLearningStage")]
    public partial class AddStudentLearningStage : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "CurrentStageId",
                table: "Users",
                type: "integer",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Users_CurrentStageId",
                table: "Users",
                column: "CurrentStageId");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_EducationalStages_CurrentStageId",
                table: "Users",
                column: "CurrentStageId",
                principalTable: "EducationalStages",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_EducationalStages_CurrentStageId",
                table: "Users");

            migrationBuilder.DropIndex(
                name: "IX_Users_CurrentStageId",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "CurrentStageId",
                table: "Users");
        }
    }
}
