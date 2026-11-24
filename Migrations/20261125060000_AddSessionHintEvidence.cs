using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125060000_AddSessionHintEvidence")]
public sealed class AddSessionHintEvidence : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.AddColumn<int>("HintsRevealed","LearningSessions",type:"integer",nullable:false,defaultValue:0);
        m.AddColumn<bool>("UsedHint","LearningSessionAttempts",type:"boolean",nullable:false,defaultValue:false);
        m.AddCheckConstraint("CK_LearningSessions_Hints","LearningSessions",
            "\"HintsRevealed\" BETWEEN 0 AND 2 AND (\"CompletedAtUtc\" IS NULL OR \"HintsRevealed\" = 0)");
    }
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Session hint evidence must be preserved.");
}
