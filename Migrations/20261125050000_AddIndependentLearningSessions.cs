using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125050000_AddIndependentLearningSessions")]
public sealed class AddIndependentLearningSessions : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.CreateTable("LearningSessions", t => new
        {
            Id=t.Column<Guid>(type:"uuid",nullable:false),
            UserId=t.Column<int>(type:"integer",nullable:false),
            StageId=t.Column<int>(type:"integer",nullable:false),
            TrackId=t.Column<int>(type:"integer",nullable:true),
            CategoryId=t.Column<int>(type:"integer",nullable:true),
            Kind=t.Column<string>(type:"character varying(12)",maxLength:12,nullable:false),
            ScopeKey=t.Column<string>(type:"character varying(100)",maxLength:100,nullable:false),
            StartRequestId=t.Column<Guid>(type:"uuid",nullable:false),
            QuestionsJson=t.Column<string>(type:"text",nullable:false),
            Total=t.Column<int>(type:"integer",nullable:false),
            Completed=t.Column<int>(type:"integer",nullable:false),
            CreatedAtUtc=t.Column<DateTime>(type:"timestamp with time zone",nullable:false),
            CompletedAtUtc=t.Column<DateTime>(type:"timestamp with time zone",nullable:true)
        },constraints:t=>{
            t.PrimaryKey("PK_LearningSessions",x=>x.Id);
            t.ForeignKey("FK_LearningSessions_Users_UserId",x=>x.UserId,"Users","Id",onDelete:ReferentialAction.Cascade);
            t.CheckConstraint("CK_LearningSessions_Kind","\"Kind\" IN ('practice','daily')");
            t.CheckConstraint("CK_LearningSessions_Progress","\"Total\" BETWEEN 5 AND 10 AND \"Completed\" BETWEEN 0 AND \"Total\" AND ((\"Completed\" = \"Total\") = (\"CompletedAtUtc\" IS NOT NULL)) AND (\"Kind\" <> 'daily' OR (\"Total\" = 5 AND \"CategoryId\" IS NULL))");
        });
        m.CreateIndex("IX_LearningSessions_UserId_StartRequestId","LearningSessions",new[]{"UserId","StartRequestId"},unique:true);
        m.CreateIndex("IX_LearningSessions_UserId_ScopeKey","LearningSessions",new[]{"UserId","ScopeKey"},unique:true,filter:"\"Kind\" = 'daily' OR \"CompletedAtUtc\" IS NULL");
        m.CreateTable("LearningSessionAttempts", t=>new
        {
            SessionId=t.Column<Guid>(type:"uuid",nullable:false),
            RequestId=t.Column<Guid>(type:"uuid",nullable:false),
            Position=t.Column<int>(type:"integer",nullable:false),
            ProblemId=t.Column<int>(type:"integer",nullable:false),
            SelectedOptionId=t.Column<int>(type:"integer",nullable:false),
            SelectedOptionText=t.Column<string>(type:"text",nullable:false),
            IsCorrect=t.Column<bool>(type:"boolean",nullable:false),
            AttemptNumber=t.Column<int>(type:"integer",nullable:false),
            SubmittedAtUtc=t.Column<DateTime>(type:"timestamp with time zone",nullable:false)
        },constraints:t=>{
            t.PrimaryKey("PK_LearningSessionAttempts",x=>new{x.SessionId,x.RequestId});
            t.ForeignKey("FK_LearningSessionAttempts_LearningSessions_SessionId",x=>x.SessionId,"LearningSessions","Id",onDelete:ReferentialAction.Cascade);
            t.CheckConstraint("CK_LearningSessionAttempts_Position","\"Position\" BETWEEN 0 AND 9 AND \"AttemptNumber\" > 0 AND \"ProblemId\" > 0 AND \"SelectedOptionId\" > 0");
        });
        m.CreateIndex("IX_LearningSessionAttempts_SessionId_Position_AttemptNumber","LearningSessionAttempts",new[]{"SessionId","Position","AttemptNumber"},unique:true);
        m.CreateIndex("IX_LearningSessionAttempts_SessionId_Position","LearningSessionAttempts",new[]{"SessionId","Position"},unique:true,filter:"\"IsCorrect\"");
        m.Sql("""
            DO $security$
            DECLARE t text; api_role text;
            BEGIN
                FOREACH t IN ARRAY ARRAY['LearningSessions','LearningSessionAttempts'] LOOP
                    EXECUTE format('ALTER TABLE public.%I ENABLE ROW LEVEL SECURITY',t);
                    EXECUTE format('REVOKE ALL ON TABLE public.%I FROM PUBLIC',t);
                    FOREACH api_role IN ARRAY ARRAY['anon','authenticated'] LOOP
                        IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname=api_role) THEN
                            EXECUTE format('REVOKE ALL ON TABLE public.%I FROM %I',t,api_role);
                        END IF;
                    END LOOP;
                END LOOP;
            END $security$;
            """);
    }
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Independent session attempt history must be preserved.");
}
