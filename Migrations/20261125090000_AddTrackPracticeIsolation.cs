using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125090000_AddTrackPracticeIsolation")]
public sealed class AddTrackPracticeIsolation : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.AddColumn<int>("PracticeScopeId","UserProgresses",type:"integer",nullable:false,defaultValue:0);
        m.AddColumn<int>("PracticeScopeId","ProblemAttempts",type:"integer",nullable:false,defaultValue:0);
        m.DropIndex("IX_UserProgresses_UserId_ProblemId","UserProgresses");
        m.CreateIndex("IX_UserProgresses_UserId_ProblemId","UserProgresses",new[]{"UserId","ProblemId"},unique:true,filter:"\"PracticeScopeId\" = 0");
        m.CreateIndex("IX_UserProgresses_UserId_ProblemId_PracticeScopeId","UserProgresses",new[]{"UserId","ProblemId","PracticeScopeId"},unique:true);
        m.AddCheckConstraint("CK_UserProgresses_PracticeScope","UserProgresses","\"PracticeScopeId\" >= 0 AND (\"PracticeScopeId\" = 0 OR NOT \"IsFavorite\")");
        m.AddCheckConstraint("CK_ProblemAttempts_PracticeScope","ProblemAttempts","\"PracticeScopeId\" >= 0");
    }
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Track practice records and audit scopes must not be discarded.");
}
