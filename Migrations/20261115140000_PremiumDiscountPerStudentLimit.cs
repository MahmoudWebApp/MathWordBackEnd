using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261115140000_PremiumDiscountPerStudentLimit")]
public partial class PremiumDiscountPerStudentLimit : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<int>(
            name: "MaxRedemptionsPerStudent",
            table: "PremiumDiscountCodes",
            type: "integer",
            nullable: true,
            defaultValue: 1);

        migrationBuilder.DropCheckConstraint(
            name: "CK_PremiumDiscountCodes_Usage",
            table: "PremiumDiscountCodes");
        migrationBuilder.AddCheckConstraint(
            name: "CK_PremiumDiscountCodes_Usage",
            table: "PremiumDiscountCodes",
            sql: "\"RedemptionCount\" >= 0 AND (\"MaxRedemptions\" IS NULL OR \"MaxRedemptions\" > 0) AND (\"MaxRedemptionsPerStudent\" IS NULL OR \"MaxRedemptionsPerStudent\" > 0)");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropCheckConstraint(
            name: "CK_PremiumDiscountCodes_Usage",
            table: "PremiumDiscountCodes");
        migrationBuilder.AddCheckConstraint(
            name: "CK_PremiumDiscountCodes_Usage",
            table: "PremiumDiscountCodes",
            sql: "\"RedemptionCount\" >= 0 AND (\"MaxRedemptions\" IS NULL OR \"MaxRedemptions\" > 0)");
        migrationBuilder.DropColumn(
            name: "MaxRedemptionsPerStudent",
            table: "PremiumDiscountCodes");
    }
}
