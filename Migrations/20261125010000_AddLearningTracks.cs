using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261125010000_AddLearningTracks")]
public sealed class AddLearningTracks : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.CreateTable("LearningTracks", table => new
        {
            Id = table.Column<int>(type:"integer",nullable:false).Annotation("Npgsql:ValueGenerationStrategy",NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
            StageId = table.Column<int>(type:"integer",nullable:false),
            Code = table.Column<string>(type:"character varying(80)",maxLength:80,nullable:false),
            Kind = table.Column<string>(type:"character varying(12)",maxLength:12,nullable:false),
            NameAr = table.Column<string>(type:"text",nullable:false),
            NameEn = table.Column<string>(type:"text",nullable:false),
            DescriptionAr = table.Column<string>(type:"text",nullable:false),
            DescriptionEn = table.Column<string>(type:"text",nullable:false),
            SortOrder = table.Column<int>(type:"integer",nullable:false),
            Revision = table.Column<int>(type:"integer",nullable:false),
            IsPublished = table.Column<bool>(type:"boolean",nullable:false)
        }, constraints: t =>
        {
            t.PrimaryKey("PK_LearningTracks",x=>x.Id);
            t.ForeignKey("FK_LearningTracks_EducationalStages_StageId",x=>x.StageId,"EducationalStages","Id",onDelete:ReferentialAction.Restrict);
            t.CheckConstraint("CK_LearningTracks_Kind","\"Kind\" IN ('grade','course')");
        });
        m.CreateIndex("IX_LearningTracks_StageId_Code","LearningTracks",new[]{"StageId","Code"},unique:true);
        m.CreateIndex("IX_LearningTracks_StageId_IsPublished_SortOrder","LearningTracks",new[]{"StageId","IsPublished","SortOrder"});
        m.CreateTable("LearningTrackCategories", c => new {
            TrackId=c.Column<int>(type:"integer",nullable:false),
            CategoryId=c.Column<int>(type:"integer",nullable:false)
        },constraints: c=>{
            c.PrimaryKey("PK_LearningTrackCategories",x=>new{x.TrackId,x.CategoryId});
            c.ForeignKey("FK_LearningTrackCategories_LearningTracks_TrackId",x=>x.TrackId,"LearningTracks","Id",onDelete:ReferentialAction.Cascade);
            c.ForeignKey("FK_LearningTrackCategories_Categories_CategoryId",x=>x.CategoryId,"Categories","Id",onDelete:ReferentialAction.Cascade);
        });
        m.CreateIndex("IX_LearningTrackCategories_CategoryId","LearningTrackCategories","CategoryId");
        m.CreateTable("LearningTrackSkills", c => new {
            TrackId=c.Column<int>(type:"integer",nullable:false),
            SkillId=c.Column<int>(type:"integer",nullable:false)
        },constraints: c=>{
            c.PrimaryKey("PK_LearningTrackSkills",x=>new{x.TrackId,x.SkillId});
            c.ForeignKey("FK_LearningTrackSkills_LearningTracks_TrackId",x=>x.TrackId,"LearningTracks","Id",onDelete:ReferentialAction.Cascade);
            c.ForeignKey("FK_LearningTrackSkills_CurriculumSkills_SkillId",x=>x.SkillId,"CurriculumSkills","Id",onDelete:ReferentialAction.Cascade);
        });
        m.CreateIndex("IX_LearningTrackSkills_SkillId","LearningTrackSkills","SkillId");
        m.CreateTable("LearningTrackProblems", c => new {
            TrackId=c.Column<int>(type:"integer",nullable:false),
            ProblemId=c.Column<int>(type:"integer",nullable:false)
        },constraints: c=>{
            c.PrimaryKey("PK_LearningTrackProblems",x=>new{x.TrackId,x.ProblemId});
            c.ForeignKey("FK_LearningTrackProblems_LearningTracks_TrackId",x=>x.TrackId,"LearningTracks","Id",onDelete:ReferentialAction.Cascade);
            c.ForeignKey("FK_LearningTrackProblems_Problems_ProblemId",x=>x.ProblemId,"Problems","Id",onDelete:ReferentialAction.Cascade);
        });
        m.CreateIndex("IX_LearningTrackProblems_ProblemId","LearningTrackProblems","ProblemId");
        m.AddColumn<int>("CurrentTrackId","Users",type:"integer",nullable:true);
        m.CreateIndex("IX_Users_CurrentTrackId","Users","CurrentTrackId");
        m.AddForeignKey("FK_Users_LearningTracks_CurrentTrackId","Users","CurrentTrackId","LearningTracks",principalColumn:"Id",onDelete:ReferentialAction.Restrict);
        // The four stage IDs are existing canonical seeded IDs. No content
        // or student is automatically classified. Seed draft identities only.
        m.Sql("""
            INSERT INTO public."LearningTracks" ("StageId","Code","Kind","NameAr","NameEn","SortOrder","DescriptionAr","DescriptionEn","Revision","IsPublished")
            SELECT v.stage_id,v.code,v.kind,v.ar,v.en,v.sort_order,'','',0,false
            FROM (VALUES
              (1,'grade-1','grade','الصف الأول','Grade 1',1),
              (1,'grade-2','grade','الصف الثاني','Grade 2',2),
              (1,'grade-3','grade','الصف الثالث','Grade 3',3),
              (1,'grade-4','grade','الصف الرابع','Grade 4',4),
              (1,'grade-5','grade','الصف الخامس','Grade 5',5),
              (1,'grade-6','grade','الصف السادس','Grade 6',6),
              (2,'grade-7','grade','الصف السابع','Grade 7',7),
              (2,'grade-8','grade','الصف الثامن','Grade 8',8),
              (2,'grade-9','grade','الصف التاسع','Grade 9',9),
              (3,'grade-10','grade','الصف العاشر','Grade 10',10),
              (3,'grade-11','grade','الصف الحادي عشر','Grade 11',11),
              (3,'grade-12','grade','الصف الثاني عشر','Grade 12',12),
              (4,'calculus','course','التفاضل والتكامل','Calculus',1),
              (4,'linear-algebra','course','الجبر الخطي','Linear Algebra',2),
              (4,'differential-equations','course','المعادلات التفاضلية','Differential Equations',3),
              (4,'probability-statistics','course','الاحتمالات والإحصاء','Probability and Statistics',4),
              (4,'discrete-mathematics','course','الرياضيات المتقطعة','Discrete Mathematics',5)
            ) AS v(stage_id,code,kind,ar,en,sort_order)
            JOIN public."EducationalStages" s ON s."Id"=v.stage_id
            ON CONFLICT ("StageId","Code") DO NOTHING;
            DO $security$
            DECLARE t text; api_role text;
            BEGIN
                FOREACH t IN ARRAY ARRAY['LearningTracks','LearningTrackCategories','LearningTrackSkills','LearningTrackProblems'] LOOP
                    EXECUTE format('ALTER TABLE public.%I ENABLE ROW LEVEL SECURITY',t);
                    EXECUTE format('REVOKE ALL ON TABLE public.%I FROM PUBLIC',t);
                    FOREACH api_role IN ARRAY ARRAY['anon','authenticated'] LOOP
                        IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname=api_role) THEN
                            EXECUTE format('REVOKE ALL ON TABLE public.%I FROM %I',t,api_role);
                        END IF;
                    END LOOP;
                END LOOP;
            END $security$;
            -- Clear a previously selected track on legacy stage switches.
            CREATE FUNCTION public.mathworld_track_selection_guard() RETURNS trigger
            LANGUAGE plpgsql SET search_path=pg_catalog,public AS $guard$
            BEGIN
              IF NEW."CurrentTrackId" IS NOT NULL AND NOT EXISTS (
                SELECT 1 FROM public."LearningTracks" t WHERE t."Id"=NEW."CurrentTrackId" AND t."StageId"=NEW."CurrentStageId"
              ) THEN
                IF TG_OP='UPDATE' AND NEW."CurrentTrackId" IS NOT DISTINCT FROM OLD."CurrentTrackId" THEN
                  NEW."CurrentTrackId":=NULL;
                ELSE RAISE EXCEPTION 'Learning track stage mismatch' USING ERRCODE='23514';
                END IF;
              END IF;
              RETURN NEW;
            END $guard$;
            CREATE TRIGGER mathworld_track_selection_guard BEFORE INSERT OR UPDATE OF "CurrentTrackId","CurrentStageId" ON public."Users"
              FOR EACH ROW EXECUTE FUNCTION public.mathworld_track_selection_guard();
            """);
    }
    protected override void Down(MigrationBuilder m) =>
        throw new NotSupportedException("Learning track mappings must not be automatically dropped.");
}
