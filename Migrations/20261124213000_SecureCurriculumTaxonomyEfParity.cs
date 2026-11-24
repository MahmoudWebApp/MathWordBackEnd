using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations;

/// <summary>
/// Makes an EF-only installation enforce the same taxonomy-table access
/// restrictions as the separately applied Supabase security migration.
/// It is intentionally additive and must be reviewed on an isolated restore
/// before any deployment to an existing database with diverged migration ledgers.
/// </summary>
[DbContext(typeof(AppDbContext))]
[Migration("20261124213000_SecureCurriculumTaxonomyEfParity")]
public partial class SecureCurriculumTaxonomyEfParity : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.Sql("""
            ALTER TABLE public."CurriculumDomains" ENABLE ROW LEVEL SECURITY;
            ALTER TABLE public."CurriculumSkills" ENABLE ROW LEVEL SECURITY;
            ALTER TABLE public."CurriculumSkillStandards" ENABLE ROW LEVEL SECURITY;
            ALTER TABLE public."CurriculumSkillPrerequisites" ENABLE ROW LEVEL SECURITY;
            ALTER TABLE public."CurriculumProblemSkills" ENABLE ROW LEVEL SECURITY;

            -- A standalone PostgreSQL CI database does not necessarily have
            -- Supabase's anon and authenticated roles. Only revoke when present.
            DO $mw_taxonomy_security$
            DECLARE
                api_role text;
            BEGIN
                FOREACH api_role IN ARRAY ARRAY['anon', 'authenticated']
                LOOP
                    IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = api_role) THEN
                        EXECUTE format(
                            'REVOKE ALL ON TABLE public."CurriculumDomains", public."CurriculumSkills", public."CurriculumSkillStandards", public."CurriculumSkillPrerequisites", public."CurriculumProblemSkills" FROM %I',
                            api_role);

                        -- Identity sequence privileges are separate from table access.
                        EXECUTE format(
                            'REVOKE ALL ON SEQUENCE public."CurriculumDomains_Id_seq", public."CurriculumSkills_Id_seq", public."CurriculumSkillStandards_Id_seq" FROM %I',
                            api_role);
                    END IF;
                END LOOP;
            END $mw_taxonomy_security$;
            """);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        throw new System.NotSupportedException(
            "Taxonomy security hardening must not be automatically rolled back. " +
            "Review privileges, active RLS policies and any deployment rollback on a restored database.");
    }
}
