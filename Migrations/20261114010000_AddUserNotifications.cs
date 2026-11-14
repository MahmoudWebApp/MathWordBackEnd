using System;
using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable
namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261114010000_AddUserNotifications")]
public partial class AddUserNotifications : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "UserNotifications",
            columns: table => new
            {
                Id = table.Column<long>(type: "bigint", nullable: false)
                    .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                UserId = table.Column<int>(type: "integer", nullable: false),
                Type = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                TitleAr = table.Column<string>(type: "character varying(160)", maxLength: 160, nullable: false),
                TitleEn = table.Column<string>(type: "character varying(160)", maxLength: 160, nullable: false),
                BodyAr = table.Column<string>(type: "character varying(1000)", maxLength: 1000, nullable: false),
                BodyEn = table.Column<string>(type: "character varying(1000)", maxLength: 1000, nullable: false),
                TargetPath = table.Column<string>(type: "character varying(300)", maxLength: 300, nullable: true),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                ReadAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_UserNotifications", x => x.Id);
                table.ForeignKey(
                    name: "FK_UserNotifications_Users_UserId",
                    column: x => x.UserId,
                    principalTable: "Users",
                    principalColumn: "Id",
                    onDelete: ReferentialAction.Cascade);
            });
        migrationBuilder.CreateIndex(
            name: "IX_UserNotifications_UserId_CreatedAtUtc", table: "UserNotifications",
            columns: new[] { "UserId", "CreatedAtUtc" });
        migrationBuilder.CreateIndex(
            name: "IX_UserNotifications_UserId_ReadAtUtc", table: "UserNotifications",
            columns: new[] { "UserId", "ReadAtUtc" });
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "UserNotifications");
    }
}
