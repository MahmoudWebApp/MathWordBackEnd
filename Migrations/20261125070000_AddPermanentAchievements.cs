using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125070000_AddPermanentAchievements")]
public sealed class AddPermanentAchievements : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.AddColumn<DateTime>("AbandonedAtUtc","LearningSessions",type:"timestamp with time zone",nullable:true);
        m.AddColumn<int>("PointsEarned","LearningSessionAttempts",type:"integer",nullable:false,defaultValue:0);
        m.DropIndex("IX_LearningSessions_UserId_ScopeKey","LearningSessions");
        m.CreateIndex("IX_LearningSessions_UserId_ScopeKey","LearningSessions",new[]{"UserId","ScopeKey"},unique:true,
            filter:"\"Kind\" = 'daily' OR (\"CompletedAtUtc\" IS NULL AND \"AbandonedAtUtc\" IS NULL)");
        m.AddCheckConstraint("CK_LearningSessions_Abandoned","LearningSessions",
            "\"AbandonedAtUtc\" IS NULL OR (\"Kind\" = 'practice' AND \"CompletedAtUtc\" IS NULL AND \"HintsRevealed\" = 0)");
        m.CreateTable("PermanentProblemAchievements",t=>new
        {
            UserId=t.Column<int>(type:"integer",nullable:false),
            ProblemId=t.Column<int>(type:"integer",nullable:false),
            StageId=t.Column<int>(type:"integer",nullable:false),
            CategoryId=t.Column<int>(type:"integer",nullable:false),
            Points=t.Column<int>(type:"integer",nullable:false),
            EarnedAtUtc=t.Column<DateTime>(type:"timestamp with time zone",nullable:false)
        },constraints:t=>{
            t.PrimaryKey("PK_PermanentProblemAchievements",x=>new{x.UserId,x.ProblemId});
            t.ForeignKey("FK_PermanentProblemAchievements_Users_UserId",x=>x.UserId,"Users","Id",onDelete:ReferentialAction.Cascade);
            t.CheckConstraint("CK_PermanentProblemAchievements_Points","\"Points\" >= 0");
        });
        m.CreateIndex("IX_PermanentProblemAchievements_UserId_StageId_CategoryId","PermanentProblemAchievements",new[]{"UserId","StageId","CategoryId"});
        // Seed from immutable ordinary attempts first, then legacy solved
        // progress without a recorded correct attempt. No old rows are changed.
        m.Sql("""
            INSERT INTO public."PermanentProblemAchievements" ("UserId","ProblemId","StageId","CategoryId","Points","EarnedAtUtc")
            SELECT a."UserId",a."ProblemId",p."StageId",p."CategoryId",
                GREATEST(0,MAX(a."PointsEarned")),MIN(a."SubmittedAt")
            FROM public."ProblemAttempts" a JOIN public."Problems" p ON p."Id"=a."ProblemId"
            WHERE a."IsCorrect"
            GROUP BY a."UserId",a."ProblemId",p."StageId",p."CategoryId"
            ON CONFLICT DO NOTHING;
            INSERT INTO public."PermanentProblemAchievements" ("UserId","ProblemId","StageId","CategoryId","Points","EarnedAtUtc")
            SELECT u."UserId",u."ProblemId",p."StageId",p."CategoryId",GREATEST(0,p."Points"),
                COALESCE(u."SolvedAt",u."LastAttemptAt")
            FROM public."UserProgresses" u JOIN public."Problems" p ON p."Id"=u."ProblemId"
            WHERE u."IsSolved"
            ON CONFLICT DO NOTHING;
            ALTER TABLE public."PermanentProblemAchievements" ENABLE ROW LEVEL SECURITY;
            REVOKE ALL ON TABLE public."PermanentProblemAchievements" FROM PUBLIC;
            DO $security$
            DECLARE api_role text;
            BEGIN
                FOREACH api_role IN ARRAY ARRAY['anon','authenticated'] LOOP
                    IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname=api_role) THEN
                        EXECUTE format('REVOKE ALL ON TABLE public."PermanentProblemAchievements" FROM %I',api_role);
                    END IF;
                END LOOP;
            END $security$;
            """);
    }
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Permanent achievement history must be preserved.");
}
