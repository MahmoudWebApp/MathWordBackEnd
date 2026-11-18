using System;
using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261114020000_PremiumAccessCodes")]
public partial class PremiumAccessCodes : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "PremiumAccessCodes",
            columns: table => new
            {
                Id = table.Column<long>(type: "bigint", nullable: false)
                    .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                CodeHash = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                Label = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: false),
                PremiumDays = table.Column<int>(type: "integer", nullable: false),
                CreatedByAdminId = table.Column<int>(type: "integer", nullable: false),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                ExpiresAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                RedeemedByUserId = table.Column<int>(type: "integer", nullable: true),
                RedeemedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                RevokedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_PremiumAccessCodes", x => x.Id);
                table.ForeignKey(
                    name: "FK_PremiumAccessCodes_Users_CreatedByAdminId",
                    column: x => x.CreatedByAdminId,
                    principalTable: "Users",
                    principalColumn: "Id",
                    onDelete: ReferentialAction.Restrict);
                table.ForeignKey(
                    name: "FK_PremiumAccessCodes_Users_RedeemedByUserId",
                    column: x => x.RedeemedByUserId,
                    principalTable: "Users",
                    principalColumn: "Id",
                    onDelete: ReferentialAction.Restrict);
            });

        migrationBuilder.CreateIndex(
            name: "IX_PremiumAccessCodes_CodeHash",
            table: "PremiumAccessCodes", column: "CodeHash", unique: true);
        migrationBuilder.CreateIndex(
            name: "IX_PremiumAccessCodes_CreatedByAdminId",
            table: "PremiumAccessCodes", column: "CreatedByAdminId");
        migrationBuilder.CreateIndex(
            name: "IX_PremiumAccessCodes_RedeemedByUserId",
            table: "PremiumAccessCodes", column: "RedeemedByUserId");
        migrationBuilder.CreateIndex(
            name: "IX_PremiumAccessCodes_ExpiresAtUtc",
            table: "PremiumAccessCodes", column: "ExpiresAtUtc");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "PremiumAccessCodes");
    }
}
