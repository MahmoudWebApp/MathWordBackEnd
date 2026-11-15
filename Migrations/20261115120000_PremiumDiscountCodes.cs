using System;
using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261115120000_PremiumDiscountCodes")]
public partial class PremiumDiscountCodes : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "PremiumDiscountCodes",
            columns: table => new
            {
                Id = table.Column<long>(type: "bigint", nullable: false)
                    .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                CodeHash = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                Label = table.Column<string>(type: "character varying(80)", maxLength: 80, nullable: false),
                DiscountKind = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                Amount = table.Column<decimal>(type: "numeric(10,2)", precision: 10, scale: 2, nullable: false),
                StartsAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                EndsAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                Enabled = table.Column<bool>(type: "boolean", nullable: false),
                MaxRedemptions = table.Column<int>(type: "integer", nullable: true),
                RedemptionCount = table.Column<int>(type: "integer", nullable: false),
                CreatedByAdminId = table.Column<int>(type: "integer", nullable: false),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_PremiumDiscountCodes", x => x.Id);
                table.ForeignKey("FK_PremiumDiscountCodes_Users_CreatedByAdminId",
                    x => x.CreatedByAdminId, "Users", "Id",
                    onDelete: ReferentialAction.Restrict);
                table.CheckConstraint("CK_PremiumDiscountCodes_Window",
                    "\"EndsAtUtc\" > \"StartsAtUtc\"");
                table.CheckConstraint("CK_PremiumDiscountCodes_Usage",
                    "\"RedemptionCount\" >= 0 AND (\"MaxRedemptions\" IS NULL OR \"MaxRedemptions\" > 0)");
                table.CheckConstraint("CK_PremiumDiscountCodes_Amount",
                    "\"Amount\" >= 0 AND ((\"DiscountKind\" = 'Percentage' AND \"Amount\" <= 100) OR \"DiscountKind\" = 'FixedUsd')");
            });

        migrationBuilder.CreateIndex(
            name: "IX_PremiumDiscountCodes_CodeHash",
            table: "PremiumDiscountCodes", column: "CodeHash", unique: true);
        migrationBuilder.CreateIndex(
            name: "IX_PremiumDiscountCodes_CreatedByAdminId",
            table: "PremiumDiscountCodes", column: "CreatedByAdminId");
        migrationBuilder.CreateIndex(
            name: "IX_PremiumDiscountCodes_Enabled_StartsAtUtc_EndsAtUtc",
            table: "PremiumDiscountCodes",
            columns: new[] { "Enabled", "StartsAtUtc", "EndsAtUtc" });
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "PremiumDiscountCodes");
    }
}
