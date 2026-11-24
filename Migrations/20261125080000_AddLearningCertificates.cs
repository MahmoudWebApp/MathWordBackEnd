using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125080000_AddLearningCertificates")]
public sealed class AddLearningCertificates : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.CreateTable("LearningCertificates",t=>new
        {
            Id=t.Column<Guid>(type:"uuid",nullable:false),
            UserId=t.Column<int>(type:"integer",nullable:false),
            StageId=t.Column<int>(type:"integer",nullable:false),
            TrackId=t.Column<int>(type:"integer",nullable:true),
            CategoryId=t.Column<int>(type:"integer",nullable:true),
            ScopeKey=t.Column<string>(type:"character varying(100)",maxLength:100,nullable:false),
            Kind=t.Column<string>(type:"character varying(12)",maxLength:12,nullable:false),
            StudentName=t.Column<string>(type:"character varying(300)",maxLength:300,nullable:false),
            TitleAr=t.Column<string>(type:"character varying(500)",maxLength:500,nullable:false),
            TitleEn=t.Column<string>(type:"character varying(500)",maxLength:500,nullable:false),
            VerificationCode=t.Column<string>(type:"character varying(32)",maxLength:32,nullable:false),
            PolicyVersion=t.Column<int>(type:"integer",nullable:false),
            TotalProblems=t.Column<int>(type:"integer",nullable:false),
            RequiredSkills=t.Column<int>(type:"integer",nullable:false),
            IssuedAtUtc=t.Column<DateTime>(type:"timestamp with time zone",nullable:false)
        },constraints:t=>{
            t.PrimaryKey("PK_LearningCertificates",x=>x.Id);
            t.ForeignKey("FK_LearningCertificates_Users_UserId",x=>x.UserId,"Users","Id",onDelete:ReferentialAction.Cascade);
            t.CheckConstraint("CK_LearningCertificates_Scope","\"Kind\" IN ('category','grade','course') AND \"PolicyVersion\" > 0 AND \"TotalProblems\" >= 5 AND \"RequiredSkills\" > 0 AND ((\"Kind\" = 'category' AND \"CategoryId\" IS NOT NULL) OR (\"Kind\" <> 'category' AND \"CategoryId\" IS NULL AND \"TrackId\" IS NOT NULL))");
        });
        m.CreateIndex("IX_LearningCertificates_UserId_ScopeKey","LearningCertificates",new[]{"UserId","ScopeKey"},unique:true);
        m.CreateIndex("IX_LearningCertificates_VerificationCode","LearningCertificates","VerificationCode",unique:true);
        m.Sql("""
            ALTER TABLE public."LearningCertificates" ENABLE ROW LEVEL SECURITY;
            REVOKE ALL ON TABLE public."LearningCertificates" FROM PUBLIC;
            DO $security$
            DECLARE api_role text;
            BEGIN
                FOREACH api_role IN ARRAY ARRAY['anon','authenticated'] LOOP
                    IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname=api_role) THEN
                        EXECUTE format('REVOKE ALL ON TABLE public."LearningCertificates" FROM %I',api_role);
                    END IF;
                END LOOP;
            END $security$;
            """);
    }
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Issued learning certificates must be preserved.");
}
