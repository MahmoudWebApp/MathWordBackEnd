using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations;

/// <summary>
/// Prevent repeating the same Arabic or English question within a learning stage.
/// Hashing normalized text keeps the index key small even for long LaTeX questions.
/// </summary>
[DbContext(typeof(AppDbContext))]
[Migration("20261121235500_PreventDuplicateProblemQuestions")]
public partial class PreventDuplicateProblemQuestions : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.Sql(@"
CREATE UNIQUE INDEX IF NOT EXISTS ""UX_Problems_StageQuestionArNormalized""
ON ""Problems"" (""StageId"", md5(regexp_replace(lower(btrim(""QuestionTextAr"")), '[[:space:]]+', ' ', 'g')));
CREATE UNIQUE INDEX IF NOT EXISTS ""UX_Problems_StageQuestionEnNormalized""
ON ""Problems"" (""StageId"", md5(regexp_replace(lower(btrim(""QuestionTextEn"")), '[[:space:]]+', ' ', 'g')));
");
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.Sql(@"
DROP INDEX IF EXISTS ""UX_Problems_StageQuestionEnNormalized"";
DROP INDEX IF EXISTS ""UX_Problems_StageQuestionArNormalized"";
");
    }
}
