using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125020000_AddEditorialWizard")]
public sealed class AddEditorialWizard : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.AlterColumn<int>("TopicProposalId","CurriculumDraftItems",type:"integer",nullable:true,oldClrType:typeof(int),oldType:"integer");
        m.AddColumn<string>("WizardJson","CurriculumDraftItems",type:"text",nullable:true);
        m.AddColumn<int>("OwnerUserId","CurriculumDraftItems",type:"integer",nullable:true);
        m.AddColumn<int>("LastEditorUserId","CurriculumDraftItems",type:"integer",nullable:true);
        m.AddColumn<int>("Revision","CurriculumDraftItems",type:"integer",nullable:false,defaultValue:0);
        m.AddColumn<DateTime>("SubmittedAtUtc","CurriculumDraftItems",type:"timestamp with time zone",nullable:true);
        m.AddColumn<DateTime>("ReviewedAtUtc","CurriculumDraftItems",type:"timestamp with time zone",nullable:true);
        m.AddColumn<int>("ReviewedByUserId","CurriculumDraftItems",type:"integer",nullable:true);
        m.AddColumn<string>("ReviewNote","CurriculumDraftItems",type:"text",nullable:true);
        m.AddColumn<DateTime>("PublishedAtUtc","CurriculumDraftItems",type:"timestamp with time zone",nullable:true);
        m.AddColumn<int>("PublishedProblemId","CurriculumDraftItems",type:"integer",nullable:true);
        m.CreateIndex("IX_CurriculumDraftItems_OwnerUserId_EditorialStatus","CurriculumDraftItems",new[]{"OwnerUserId","EditorialStatus"});
        m.AddColumn<string>("EditorialDetailsJson","Problems",type:"text",nullable:true);
    }
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Editorial history must not be dropped automatically.");
}
