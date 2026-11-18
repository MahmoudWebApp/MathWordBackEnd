using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations
{
    [DbContext(typeof(AppDbContext))]
    [Migration("20261113182000_AddProblemDiagrams")]
    public partial class AddProblemDiagrams : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ProblemDiagrams",
                columns: table => new
                {
                    ProblemId = table.Column<int>(type: "integer", nullable: false),
                    SchemaVersion = table.Column<int>(type: "integer", nullable: false),
                    DiagramJson = table.Column<string>(type: "character varying(30000)", maxLength: 30000, nullable: false),
                    AltTextAr = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: false),
                    AltTextEn = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProblemDiagrams", x => x.ProblemId);
                    table.ForeignKey("FK_ProblemDiagrams_Problems_ProblemId",
                        x => x.ProblemId, "Problems", "Id", onDelete: ReferentialAction.Cascade);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(name: "ProblemDiagrams");
        }
    }
}
