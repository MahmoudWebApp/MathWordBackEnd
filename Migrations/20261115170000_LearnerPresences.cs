using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261115170000_LearnerPresences")]
public partial class LearnerPresences : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "LearnerPresences",
            columns: table => new
            {
                UserId = table.Column<int>(type: "integer", nullable: false),
                SessionId = table.Column<Guid>(type: "uuid", nullable: false),
                LastSeenAtUtc = table.Column<DateTime>(
                    type: "timestamp with time zone", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_LearnerPresences",
                    x => new { x.UserId, x.SessionId });
                table.ForeignKey("FK_LearnerPresences_Users_UserId",
                    x => x.UserId, "Users", "Id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(
            name: "IX_LearnerPresences_LastSeenAtUtc",
            table: "LearnerPresences",
            column: "LastSeenAtUtc");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "LearnerPresences");
    }
}
