-- Catalog slice read on 2026-11-24. For the disposable CI database only.
-- Skill IDs come from the test DB. The importer must resolve the stable keys.
INSERT INTO "Categories" ("Id", "StageId", "Order", "Icon", "NameAr", "NameEn", "DescriptionAr", "DescriptionEn") VALUES
    (81, 1, 81, '', 'الأعداد والقيمة المكانية', 'Number Sense & Place Value', '', ''),
    (82, 1, 82, '', 'القياس وتحويل الوحدات', 'Measurement & Units', '', ''),
    (83, 2, 83, '', 'الأعداد الصحيحة والنسبية', 'Integers & Rational Numbers', '', ''),
    (86, 3, 86, '', 'الدوال الأسّية واللوغاريتمية', 'Exponential & Logarithmic Functions', '', ''),
    (89, 4, 89, '', 'الإحصاء الرياضي', 'Mathematical Statistics', '', '');

WITH review_domain AS (
    INSERT INTO "CurriculumDomains" ("StableKey", "NameAr", "NameEn", "IsPublished")
    VALUES ('ci-gap-import', 'مراجعة', 'Import rehearsal', true)
    RETURNING "Id"
)
INSERT INTO "CurriculumSkills" ("StableKey", "StageId", "CategoryId", "NameAr", "NameEn", "DomainId", "IsPublished")
SELECT s.key, s.stage, s.category, s.ar, s.en, d."Id", true
FROM review_domain d CROSS JOIN (VALUES
    ('estimation', 1, 81, 'تقدير نواتج العمليات', 'Estimating results'),
    ('mass', 1, 82, 'قياس الكتلة', 'Measuring mass'),
    ('metric-conversion', 1, 82, 'التحويل بين الوحدات المترية', 'Metric unit conversion'),
    ('time', 1, 82, 'قياس الزمن', 'Time measurement'),
    ('absolute-value', 2, 83, 'القيمة المطلقة', 'Absolute value'),
    ('logarithm-domain', 3, 86, 'مجال الدوال اللوغاريتمية', 'Logarithmic function domain'),
    ('logarithm-modeling', 3, 86, 'التطبيقات اللوغاريتمية', 'Logarithmic models'),
    ('model-interpretation', 3, 86, 'تفسير النماذج الأسّية', 'Interpreting exponential models'),
    ('hypothesis-testing', 4, 89, 'اختبار الفرضيات', 'Hypothesis testing')
) AS s(key, stage, category, ar, en);
