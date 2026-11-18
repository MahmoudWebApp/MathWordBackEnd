using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261115150000_PlatformActivityEvents")]
public partial class PlatformActivityEvents : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "PlatformActivityEvents",
            columns: table => new
            {
                Id = table.Column<long>(type: "bigint", nullable: false)
                    .Annotation("Npgsql:ValueGenerationStrategy",
                        Npgsql.EntityFrameworkCore.PostgreSQL.Metadata.NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                ActorUserId = table.Column<int>(type: "integer", nullable: false),
                ActorRole = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                Action = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                Resource = table.Column<string>(type: "character varying(140)", maxLength: 140, nullable: false),
                ResourceId = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                Origin = table.Column<string>(type: "character varying(24)", maxLength: 24, nullable: false),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_PlatformActivityEvents", x => x.Id);
                table.ForeignKey(
                    name: "FK_PlatformActivityEvents_Users_ActorUserId",
                    column: x => x.ActorUserId,
                    principalTable: "Users", principalColumn: "Id",
                    onDelete: ReferentialAction.Restrict);
            });

        migrationBuilder.CreateIndex(
            name: "IX_PlatformActivityEvents_ActorUserId_CreatedAtUtc",
            table: "PlatformActivityEvents",
            columns: new[] { "ActorUserId", "CreatedAtUtc" });
        migrationBuilder.CreateIndex(
            name: "IX_PlatformActivityEvents_ActorRole_CreatedAtUtc",
            table: "PlatformActivityEvents",
            columns: new[] { "ActorRole", "CreatedAtUtc" });
        migrationBuilder.CreateIndex(
            name: "IX_PlatformActivityEvents_CreatedAtUtc_Id",
            table: "PlatformActivityEvents",
            columns: new[] { "CreatedAtUtc", "Id" });
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "PlatformActivityEvents");
    }
}
