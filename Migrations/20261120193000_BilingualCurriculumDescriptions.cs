using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261120193000_BilingualCurriculumDescriptions")]
public partial class BilingualCurriculumDescriptions : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        // This single development database has already received the Supabase SQL
        // migration; IF NOT EXISTS also supports fresh deployments safely.
        migrationBuilder.Sql("""
            ALTER TABLE "EducationalStages"
              ADD COLUMN IF NOT EXISTS "DescriptionAr" text NOT NULL DEFAULT '',
              ADD COLUMN IF NOT EXISTS "DescriptionEn" text NOT NULL DEFAULT '';
            ALTER TABLE "Categories"
              ADD COLUMN IF NOT EXISTS "DescriptionAr" text NOT NULL DEFAULT '',
              ADD COLUMN IF NOT EXISTS "DescriptionEn" text NOT NULL DEFAULT '';
            """);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.Sql("""
            ALTER TABLE "EducationalStages"
              DROP COLUMN IF EXISTS "DescriptionAr",
              DROP COLUMN IF EXISTS "DescriptionEn";
            ALTER TABLE "Categories"
              DROP COLUMN IF EXISTS "DescriptionAr",
              DROP COLUMN IF EXISTS "DescriptionEn";
            """);
    }
}
