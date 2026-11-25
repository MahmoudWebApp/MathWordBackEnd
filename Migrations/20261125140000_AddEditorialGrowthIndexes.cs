using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125140000_AddEditorialGrowthIndexes")]
public sealed class AddEditorialGrowthIndexes : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.CreateIndex("IX_Problems_StageId_CategoryId_Id","Problems",new[]{"StageId","CategoryId","Id"});
        m.CreateIndex("IX_CurriculumDraftItems_SourceProblemId_EditorialStatus","CurriculumDraftItems",new[]{"SourceProblemId","EditorialStatus"});
        m.CreateIndex("IX_CurriculumDraftItems_EditorialStatus_Id","CurriculumDraftItems",new[]{"EditorialStatus","Id"});
    }
    protected override void Down(MigrationBuilder m)
    {
        m.DropIndex("IX_Problems_StageId_CategoryId_Id","Problems");
        m.DropIndex("IX_CurriculumDraftItems_SourceProblemId_EditorialStatus","CurriculumDraftItems");
        m.DropIndex("IX_CurriculumDraftItems_EditorialStatus_Id","CurriculumDraftItems");
    }
}
