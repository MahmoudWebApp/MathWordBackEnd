using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125040000_AddReviewedAmendments")]
public sealed class AddReviewedAmendments : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.AddColumn<int>("SourceProblemId","CurriculumDraftItems",type:"integer",nullable:true);
        m.AddColumn<string>("SourceFingerprint","CurriculumDraftItems",type:"text",nullable:true);
    }
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Reviewed amendment history must be preserved.");
}
