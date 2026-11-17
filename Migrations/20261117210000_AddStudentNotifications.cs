using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations
{
    /// <summary>Persistent, recipient-scoped messages; no existing data is changed.</summary>
    [DbContext(typeof(AppDbContext))]
    [Migration("20261117210000_AddStudentNotifications")]
    public partial class AddStudentNotifications : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "StudentNotifications",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy",
                            Npgsql.EntityFrameworkCore.PostgreSQL.Metadata
                                .NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    UserId = table.Column<int>(type: "integer", nullable: false),
                    Type = table.Column<string>(
                        type: "character varying(40)", maxLength: 40, nullable: false),
                    TitleAr = table.Column<string>(
                        type: "character varying(140)", maxLength: 140, nullable: false),
                    TitleEn = table.Column<string>(
                        type: "character varying(140)", maxLength: 140, nullable: false),
                    BodyAr = table.Column<string>(
                        type: "character varying(1000)", maxLength: 1000, nullable: false),
                    BodyEn = table.Column<string>(
                        type: "character varying(1000)", maxLength: 1000, nullable: false),
                    ActionPath = table.Column<string>(
                        type: "character varying(200)", maxLength: 200, nullable: true),
                    CreatedAt = table.Column<DateTime>(
                        type: "timestamp with time zone", nullable: false),
                    ReadAt = table.Column<DateTime>(
                        type: "timestamp with time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentNotifications", x => x.Id);
                    table.ForeignKey(
                        name: "FK_StudentNotifications_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_StudentNotifications_UserId_CreatedAt",
                table: "StudentNotifications",
                columns: new[] { "UserId", "CreatedAt" });

            migrationBuilder.CreateIndex(
                name: "IX_StudentNotifications_UserId_ReadAt",
                table: "StudentNotifications",
                columns: new[] { "UserId", "ReadAt" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(name: "StudentNotifications");
        }
    }
}
