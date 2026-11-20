using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable
namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261120213000_AddCurriculumDescriptions")]
public partial class AddCurriculumDescriptions : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.Sql("""
ALTER TABLE public."EducationalStages" ADD COLUMN IF NOT EXISTS "DescriptionAr" text NOT NULL DEFAULT '';
ALTER TABLE public."EducationalStages" ADD COLUMN IF NOT EXISTS "DescriptionEn" text NOT NULL DEFAULT '';
ALTER TABLE public."Categories" ADD COLUMN IF NOT EXISTS "DescriptionAr" text NOT NULL DEFAULT '';
ALTER TABLE public."Categories" ADD COLUMN IF NOT EXISTS "DescriptionEn" text NOT NULL DEFAULT '';
UPDATE public."EducationalStages" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'مرحلة البداية في عالم الرياضيات؛ نتدرّب على الأعداد والعمليات والهندسة البسيطة والبيانات.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Build the foundations of mathematics through arithmetic, shapes, measurements and data.' ELSE "DescriptionEn" END WHERE "Id"=1;
UPDATE public."EducationalStages" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'نطوّر التفكير الجبري والمنطقي عبر الأعداد والأسس والدوال والنسب والهندسة.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Develop algebraic reasoning with number theory, functions, proportions and geometry.' ELSE "DescriptionEn" END WHERE "Id"=2;
UPDATE public."EducationalStages" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'ننتقل إلى المعادلات والمثلثات والتفاضل والاحتمالات استعداداً للدراسة المتقدمة.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Study equations, trigonometry, calculus and probability for advanced learning.' ELSE "DescriptionEn" END WHERE "Id"=3;
UPDATE public."EducationalStages" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'نتعمّق في التحليل الرياضي والجبر الخطي والدوال متعددة المتغيرات والمعادلات التفاضلية.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Explore real analysis, linear algebra, multivariable calculus and differential equations.' ELSE "DescriptionEn" END WHERE "Id"=4;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'تدرّب على الجمع والطرح والضرب والقسمة وحل مسائل حياتية بالأعداد.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Practice arithmetic operations and number-based word problems.' ELSE "DescriptionEn" END WHERE "Id"=1;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'اكتشف الأنماط وتسلسل الأعداد والمعادلات البسيطة وتمثيل المجهول.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Explore patterns, sequences and simple equations.' ELSE "DescriptionEn" END WHERE "Id"=2;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'تعرّف إلى الأشكال والزوايا والمحيط والمساحة ووحدات القياس.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Study shapes, angles, area, perimeter and measurement units.' ELSE "DescriptionEn" END WHERE "Id"=3;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'اقرأ البيانات، واحسب المتوسط والوسيط والمنوال، وافهم الاحتمال البسيط.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Read data, calculate averages and explore basic probability.' ELSE "DescriptionEn" END WHERE "Id"=4;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'تعمّق في القواسم والمضاعفات وقوانين الأسس والعمليات عليها.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Explore divisibility, greatest common factors and exponent laws.' ELSE "DescriptionEn" END WHERE "Id"=5;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'حل المعادلات وقيّم الدوال وافهم ميل المستقيم والتعبيرات الجبرية.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Solve equations, evaluate functions and interpret linear relationships.' ELSE "DescriptionEn" END WHERE "Id"=6;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'تدرّب على النسب والتناسب والخصومات والمقاييس في الحياة اليومية.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Apply ratios, proportional reasoning, discounts and map scales.' ELSE "DescriptionEn" END WHERE "Id"=7;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'استخدم فيثاغورس والتشابه والزوايا في استدلالات هندسية.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Reason with Pythagoras, similarity, polygons and geometric proofs.' ELSE "DescriptionEn" END WHERE "Id"=8;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'حلّل كثيرات الحدود وادرس الجذور والمعادلات التربيعية.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Factor polynomials and work with quadratic roots and discriminants.' ELSE "DescriptionEn" END WHERE "Id"=9;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'افهم الجيب وجيب التمام والظل وعلاقات المثلث القائم.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Learn sine, cosine, tangent and right-triangle relationships.' ELSE "DescriptionEn" END WHERE "Id"=10;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'تدرّب على المشتقات وقواعد التكامل والتطبيقات الحسابية.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Practice derivatives, integrals and basic calculus applications.' ELSE "DescriptionEn" END WHERE "Id"=11;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'احسب احتمالات أحداث مركبة، والتوافيق والمتوسطات الإحصائية.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Explore combinations, repeated trials and statistical reasoning.' ELSE "DescriptionEn" END WHERE "Id"=12;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'تعرّف إلى التدرج والمشتقات الجزئية والاتجاهية لدوال متعددة المتغيرات.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Learn gradients, partial derivatives and directional derivatives.' ELSE "DescriptionEn" END WHERE "Id"=13;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'تدرّب على المتجهات والمحددات والمصفوفات وخصائصها.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Work with vectors, matrix determinants and linear algebra basics.' ELSE "DescriptionEn" END WHERE "Id"=14;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'حل المعادلات التفاضلية بشروط ابتدائية وحساب قيم الدوال الناتجة.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Solve differential equations with initial conditions.' ELSE "DescriptionEn" END WHERE "Id"=15;
UPDATE public."Categories" SET "DescriptionAr"=CASE WHEN trim("DescriptionAr")='' THEN 'استكشف النهايات والمتتاليات والتقارب والاتصال ونظرية القيمة الوسيطة.' ELSE "DescriptionAr" END, "DescriptionEn"=CASE WHEN trim("DescriptionEn")='' THEN 'Study limits, convergence, continuity and the intermediate value theorem.' ELSE "DescriptionEn" END WHERE "Id"=16;
""");
    }
    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(name: "DescriptionAr", table: "Categories");
        migrationBuilder.DropColumn(name: "DescriptionEn", table: "Categories");
        migrationBuilder.DropColumn(name: "DescriptionAr", table: "EducationalStages");
        migrationBuilder.DropColumn(name: "DescriptionEn", table: "EducationalStages");
    }
}
