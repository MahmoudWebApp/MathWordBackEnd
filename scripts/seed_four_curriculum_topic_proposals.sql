-- Draft-only content. DO NOT insert into public "Categories" or "Problems" here.
BEGIN;
INSERT INTO "CurriculumTopicProposals"
("StableKey","StageId","DomainId","NameAr","NameEn","DescriptionAr","DescriptionEn","IconKey","SortOrder","EditorialStatus","ProposedQuestionCount")
SELECT x.stable_key,x.stage_id,d."Id",x.ar,x.en,x.da,x.de,x.icon,x.sort,'Draft',x.problem_count
FROM (VALUES
('p-fractions-decimals',1,'numbers-operations','الكسور والأعداد العشرية','Fractions & Decimals','تمثيل الكسور وتكافؤها وعملياتها الأساسية والعلاقة بالقيمة المكانية العشرية.','Fractions, equivalence, basic operations and connections to decimal place value.','fractions',4,9),
('m-statistics',2,'statistics-probability','الإحصاء وتحليل البيانات','Statistics & Data Analysis','قراءة تمثيلات البيانات ومقاييس النزعة المركزية والتشتت والتفسير الإحصائي.','Data displays, summary measures, spread and interpretation of distributions.','data-chart',11,7),
('s-sequences-series',3,'algebra-functions','المتتاليات والمتسلسلات','Sequences & Series','المتتاليات الحسابية والهندسية والعلاقات الرجوعية ومجاميع المتسلسلات.','Arithmetic and geometric sequences, recurrence relations and finite or infinite sums.','sequences',8,8),
('u-discrete-math',4,'discrete-mathematics','المنطق والرياضيات المتقطعة','Logic & Discrete Mathematics','المنطق والعلاقات والتوافيق الأساسية ونظرية الرسوم البيانية.','Logic, relations, elementary combinatorics and graph theory.','logic-network',9,7)
) AS x(stable_key,stage_id,domain_key,ar,en,da,de,icon,sort,problem_count)
JOIN "CurriculumDomains" d ON d."StableKey"=x.domain_key
JOIN "EducationalStages" s ON s."Id"=x.stage_id
ON CONFLICT ("StableKey") DO NOTHING;
DO $$
BEGIN
 IF EXISTS (SELECT 1 FROM "CurriculumTopicProposals" WHERE "StableKey" IN
 ('p-fractions-decimals','m-statistics','s-sequences-series','u-discrete-math')
 AND ("EditorialStatus" <> 'Draft' OR "ProposedQuestionCount" <= 0)) THEN
  RAISE EXCEPTION 'Editorial topic proposals must remain draft with curated question candidates';
 END IF;
END $$;
COMMIT;