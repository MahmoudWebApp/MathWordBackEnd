using System;
using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261114011000_AddCurriculumDraftBatches")]
public partial class AddCurriculumDraftBatches : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "CurriculumDraftBatches",
            columns: table => new
            {
                Id = table.Column<long>(type: "bigint", nullable: false)
                    .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                SubmittedByAdminId = table.Column<int>(type: "integer", nullable: false),
                SubmittedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                Status = table.Column<string>(type: "character varying(30)", maxLength: 30, nullable: false),
                ProblemsJson = table.Column<string>(type: "text", nullable: false),
                ProblemCount = table.Column<int>(type: "integer", nullable: false),
                ReviewedByAdminId = table.Column<int>(type: "integer", nullable: true),
                ReviewedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                ReviewNote = table.Column<string>(type: "character varying(1000)", maxLength: 1000, nullable: true),
                PublishedCount = table.Column<int>(type: "integer", nullable: false),
                PublishedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_CurriculumDraftBatches", x => x.Id);
                table.ForeignKey(
                    name: "FK_CurriculumDraftBatches_Users_SubmittedByAdminId",
                    column: x => x.SubmittedByAdminId,
                    principalTable: "Users",
                    principalColumn: "Id",
                    onDelete: ReferentialAction.Restrict);
                table.ForeignKey(
                    name: "FK_CurriculumDraftBatches_Users_ReviewedByAdminId",
                    column: x => x.ReviewedByAdminId,
                    principalTable: "Users",
                    principalColumn: "Id",
                    onDelete: ReferentialAction.Restrict);
            });

        migrationBuilder.CreateIndex(
            name: "IX_CurriculumDraftBatches_Status_SubmittedAtUtc",
            table: "CurriculumDraftBatches",
            columns: new[] { "Status", "SubmittedAtUtc" });
        migrationBuilder.CreateIndex(
            name: "IX_CurriculumDraftBatches_SubmittedByAdminId",
            table: "CurriculumDraftBatches",
            column: "SubmittedByAdminId");
        migrationBuilder.CreateIndex(
            name: "IX_CurriculumDraftBatches_ReviewedByAdminId",
            table: "CurriculumDraftBatches",
            column: "ReviewedByAdminId");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "CurriculumDraftBatches");
    }
}
