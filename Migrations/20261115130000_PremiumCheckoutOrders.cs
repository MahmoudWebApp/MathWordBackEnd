using System;
using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261115130000_PremiumCheckoutOrders")]
public partial class PremiumCheckoutOrders : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "PremiumCheckoutOrders",
            columns: table => new
            {
                Id = table.Column<long>(type: "bigint", nullable: false)
                    .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                StudentId = table.Column<int>(type: "integer", nullable: false),
                DiscountCodeId = table.Column<long>(type: "bigint", nullable: true),
                OrderReference = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                Status = table.Column<string>(type: "character varying(24)", maxLength: 24, nullable: false),
                SubtotalUsd = table.Column<decimal>(type: "numeric(10,2)", precision: 10, scale: 2, nullable: false),
                DiscountUsd = table.Column<decimal>(type: "numeric(10,2)", precision: 10, scale: 2, nullable: false),
                TotalUsd = table.Column<decimal>(type: "numeric(10,2)", precision: 10, scale: 2, nullable: false),
                Currency = table.Column<string>(type: "character varying(3)", maxLength: 3, nullable: false),
                Provider = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: true),
                ProviderPaymentId = table.Column<string>(type: "character varying(160)", maxLength: 160, nullable: true),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                VerifiedPaidAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                DiscountRedeemedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_PremiumCheckoutOrders", x => x.Id);
                table.ForeignKey("FK_PremiumCheckoutOrders_Users_StudentId", x => x.StudentId,
                    "Users", "Id", onDelete: ReferentialAction.Restrict);
                table.ForeignKey("FK_PremiumCheckoutOrders_PremiumDiscountCodes_DiscountCodeId",
                    x => x.DiscountCodeId, "PremiumDiscountCodes", "Id",
                    onDelete: ReferentialAction.Restrict);
                table.CheckConstraint("CK_PremiumCheckoutOrders_Amounts",
                    "\"SubtotalUsd\" >= 0 AND \"DiscountUsd\" >= 0 AND \"TotalUsd\" >= 0 AND \"SubtotalUsd\" = \"DiscountUsd\" + \"TotalUsd\"");
                table.CheckConstraint("CK_PremiumCheckoutOrders_Currency", "\"Currency\" = 'USD'");
                table.CheckConstraint("CK_PremiumCheckoutOrders_Status",
                    "\"Status\" IN ('Pending', 'Paid', 'Failed', 'Cancelled', 'Refunded')");
                table.CheckConstraint("CK_PremiumCheckoutOrders_PaidVerification",
                    "\"Status\" <> 'Paid' OR \"VerifiedPaidAtUtc\" IS NOT NULL");
                table.CheckConstraint("CK_PremiumCheckoutOrders_DiscountRedemption",
                    "\"DiscountRedeemedAtUtc\" IS NULL OR (\"DiscountCodeId\" IS NOT NULL AND \"VerifiedPaidAtUtc\" IS NOT NULL)");
            });
        migrationBuilder.CreateIndex("IX_PremiumCheckoutOrders_OrderReference",
            "PremiumCheckoutOrders", "OrderReference", unique: true);
        migrationBuilder.CreateIndex("IX_PremiumCheckoutOrders_StudentId_CreatedAtUtc",
            "PremiumCheckoutOrders", new[] { "StudentId", "CreatedAtUtc" });
        migrationBuilder.CreateIndex("IX_PremiumCheckoutOrders_DiscountCodeId",
            "PremiumCheckoutOrders", "DiscountCodeId");
        migrationBuilder.CreateIndex("IX_PremiumCheckoutOrders_Provider_ProviderPaymentId",
            "PremiumCheckoutOrders", new[] { "Provider", "ProviderPaymentId" },
            unique: true,
            filter: "\"Provider\" IS NOT NULL AND \"ProviderPaymentId\" IS NOT NULL");
    }

    protected override void Down(MigrationBuilder migrationBuilder) =>
        migrationBuilder.DropTable(name: "PremiumCheckoutOrders");
}
