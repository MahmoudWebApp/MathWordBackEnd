using System;
using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261114000100_StageFreeCategorySelection")]
public partial class StageFreeCategorySelection : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "StageFreeCategorySelections",
            columns: table => new
            {
                StageId = table.Column<int>(type: "integer", nullable: false),
                FirstCategoryId = table.Column<int>(type: "integer", nullable: false),
                SecondCategoryId = table.Column<int>(type: "integer", nullable: false),
                UpdatedByAdminId = table.Column<int>(type: "integer", nullable: false),
                UpdatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_StageFreeCategorySelections", x => x.StageId);
                table.ForeignKey(
                    name: "FK_StageFreeCategorySelections_EducationalStages_StageId",
                    column: x => x.StageId,
                    principalTable: "EducationalStages",
                    principalColumn: "Id",
                    onDelete: ReferentialAction.Cascade);
                table.ForeignKey(
                    name: "FK_StageFreeCategorySelections_Users_UpdatedByAdminId",
                    column: x => x.UpdatedByAdminId,
                    principalTable: "Users",
                    principalColumn: "Id",
                    onDelete: ReferentialAction.Restrict);
            });

        migrationBuilder.CreateIndex(
            name: "IX_StageFreeCategorySelections_UpdatedByAdminId",
            table: "StageFreeCategorySelections",
            column: "UpdatedByAdminId");

        migrationBuilder.AddCheckConstraint(
            name: "CK_StageFreeCategorySelections_Distinct",
            table: "StageFreeCategorySelections",
            sql: "\"FirstCategoryId\" <> \"SecondCategoryId\"");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(name: "StageFreeCategorySelections");
    }
}
