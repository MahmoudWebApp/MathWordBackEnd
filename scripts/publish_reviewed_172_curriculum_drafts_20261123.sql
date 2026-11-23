-- MathWorld explicit owner-authorized editorial publication. Do not re-run.
-- 172 individually reviewed DraftItems become learner Problems in 11 NEW topic categories
-- and four existing topic categories. Preserve all prior 601 problem IDs, solves,
-- progress, subscription grants, selected stages and the first two free categories.
-- Execute only after new 11 SVG icon assets are LIVE on official Vercel domain.
-- Source fingerprint and exact counts abort the ENTIRE transaction on any drift.
BEGIN;
SELECT pg_advisory_xact_lock(-987654319);

DO $mw_release$
DECLARE
  category_icons CONSTANT jsonb := '[{"topicKey":"p-number-sense","stageId":1,"iconSlug":"number-sense"},{"topicKey":"p-measure-units","stageId":1,"iconSlug":"measurement-units"},{"topicKey":"m-integers-rationals","stageId":2,"iconSlug":"signed-rationals"},{"topicKey":"m-linear-inequalities","stageId":2,"iconSlug":"linear-inequalities"},{"topicKey":"m-probability","stageId":2,"iconSlug":"probability-compound"},{"topicKey":"s-exponents-logarithms","stageId":3,"iconSlug":"exponential-logarithms"},{"topicKey":"s-analytic-geometry","stageId":3,"iconSlug":"analytic-geometry"},{"topicKey":"s-vectors","stageId":3,"iconSlug":"vectors"},{"topicKey":"u-math-statistics","stageId":4,"iconSlug":"mathematical-statistics"},{"topicKey":"u-numerical-analysis","stageId":4,"iconSlug":"numerical-analysis"},{"topicKey":"u-optimization","stageId":4,"iconSlug":"optimization"}]'::jsonb;
  label_data CONSTANT jsonb := '[{"primarySkillKey":"fraction-operations","nameAr":"العمليات على الكسور","nameEn":"Fraction operations"},{"primarySkillKey":"summary-measures","nameAr":"مقاييس النزعة المركزية","nameEn":"Summary measures"},{"primarySkillKey":"series-convergence","nameAr":"تقارب المتسلسلات","nameEn":"Series convergence"},{"primarySkillKey":"logic","nameAr":"المنطق الرياضي","nameEn":"Mathematical logic"},{"primarySkillKey":"counting","nameAr":"أنماط العد","nameEn":"Counting patterns"},{"primarySkillKey":"estimation","nameAr":"تقدير نواتج العمليات","nameEn":"Estimating results"},{"primarySkillKey":"number-comparison","nameAr":"مقارنة الأعداد","nameEn":"Number comparison"},{"primarySkillKey":"place-value","nameAr":"القيمة المكانية","nameEn":"Place value"},{"primarySkillKey":"rounding","nameAr":"التقريب","nameEn":"Rounding numbers"},{"primarySkillKey":"absolute-value","nameAr":"القيمة المطلقة","nameEn":"Absolute value"},{"primarySkillKey":"rational-arithmetic","nameAr":"عمليات الأعداد النسبية","nameEn":"Rational-number arithmetic"},{"primarySkillKey":"signed-operations","nameAr":"عمليات الأعداد الصحيحة الموقّعة","nameEn":"Signed integer operations"},{"primarySkillKey":"decay-half-life","nameAr":"التناقص ونصف العمر","nameEn":"Decay and half-life"},{"primarySkillKey":"growth-models","nameAr":"نماذج النمو الأسّي","nameEn":"Exponential growth models"},{"primarySkillKey":"logarithm-domain","nameAr":"مجال الدوال اللوغاريتمية","nameEn":"Logarithmic function domain"},{"primarySkillKey":"logarithm-inverse-and-equations","nameAr":"عكس الأسس والمعادلات اللوغاريتمية","nameEn":"Inverse exponentials and logarithmic equations"},{"primarySkillKey":"logarithm-modeling","nameAr":"التطبيقات اللوغاريتمية","nameEn":"Logarithmic models"},{"primarySkillKey":"logarithm-properties","nameAr":"قوانين اللوغاريتمات","nameEn":"Logarithm laws"},{"primarySkillKey":"model-interpretation","nameAr":"تفسير النماذج الأسّية","nameEn":"Interpreting exponential models"},{"primarySkillKey":"confidence-intervals","nameAr":"فترات الثقة","nameEn":"Confidence intervals"},{"primarySkillKey":"hypothesis-testing","nameAr":"اختبار الفرضيات","nameEn":"Hypothesis testing"},{"primarySkillKey":"sampling-distribution","nameAr":"توزيع العينات","nameEn":"Sampling distributions"},{"primarySkillKey":"capacity","nameAr":"قياس السعة","nameEn":"Measuring capacity"},{"primarySkillKey":"length","nameAr":"قياس الأطوال","nameEn":"Measuring length"},{"primarySkillKey":"mass","nameAr":"قياس الكتلة","nameEn":"Measuring mass"},{"primarySkillKey":"metric-conversion","nameAr":"التحويل بين الوحدات المترية","nameEn":"Metric unit conversion"},{"primarySkillKey":"time","nameAr":"قياس الزمن","nameEn":"Time measurement"},{"primarySkillKey":"inequality-contexts","nameAr":"مسائل المتباينات التطبيقية","nameEn":"Inequality word problems"},{"primarySkillKey":"number-line-solutions","nameAr":"حلول المتباينات على خط الأعداد","nameEn":"Inequality solution sets on a number line"},{"primarySkillKey":"solve-linear-inequalities","nameAr":"حل المتباينات الخطية","nameEn":"Solving linear inequalities"},{"primarySkillKey":"circles","nameAr":"معادلات الدائرة","nameEn":"Equations of circles"},{"primarySkillKey":"coordinate-lines","nameAr":"المستقيمات الإحداثية","nameEn":"Coordinate lines"},{"primarySkillKey":"loci","nameAr":"المحلات الهندسية","nameEn":"Geometric loci"},{"primarySkillKey":"error-analysis","nameAr":"تحليل أخطاء التقريب","nameEn":"Numerical error analysis"},{"primarySkillKey":"linear-systems","nameAr":"الأنظمة الخطية العددية","nameEn":"Numerical linear systems"},{"primarySkillKey":"numerical-integration","nameAr":"التكامل العددي","nameEn":"Numerical integration"},{"primarySkillKey":"root-finding","nameAr":"إيجاد الجذور عددياً","nameEn":"Numerical root finding"},{"primarySkillKey":"frequency","nameAr":"الاحتمال التجريبي","nameEn":"Experimental probability"},{"primarySkillKey":"sample-spaces","nameAr":"فضاء العينة","nameEn":"Sample spaces"},{"primarySkillKey":"simple-compound-events","nameAr":"الأحداث البسيطة والمركبة","nameEn":"Simple and compound events"},{"primarySkillKey":"dot-product","nameAr":"الضرب القياسي","nameEn":"Dot product"},{"primarySkillKey":"magnitude","nameAr":"مقدار المتجه","nameEn":"Vector magnitude"},{"primarySkillKey":"vector-components","nameAr":"مركبات المتجهات","nameEn":"Vector components"},{"primarySkillKey":"constrained-optimization","nameAr":"التحسين المقيّد","nameEn":"Constrained optimization"},{"primarySkillKey":"convexity","nameAr":"التحدب والانحناء","nameEn":"Convexity and curvature"},{"primarySkillKey":"unconstrained-optimization","nameAr":"التحسين غير المقيّد","nameEn":"Unconstrained optimization"}]'::jsonb;
  descriptions CONSTANT jsonb := '{"p-number-sense":{"ar":"الأعداد والقيمة المكانية والمقارنة والتقريب والتقدير وأنماط العد.","en":"Number sense, place value, comparison, rounding, estimation, and counting patterns."},"m-integers-rationals":{"ar":"العمليات على الأعداد الصحيحة الموجبة والسالبة والقيمة المطلقة والحساب بالأعداد النسبية.","en":"Signed integer operations, absolute value, and rational-number arithmetic."},"s-exponents-logarithms":{"ar":"النمو والتناقص الأسّي والدوال اللوغاريتمية وقوانين اللوغاريتمات وحل المعادلات والتطبيقات.","en":"Exponential growth and decay, logarithmic functions and laws, equations, and real-world models."},"u-math-statistics":{"ar":"الإحصاء الرياضي وتوزيعات العينات وفترات الثقة واختبار الفرضيات.","en":"Mathematical statistics, sampling distributions, confidence intervals and hypothesis tests."}}'::jsonb;
  expected_hash CONSTANT text := '382e21999d40c5d6cfb40cadbe784df7';
  actual_hash text;
  topic record;
  s record;
  d record;
  answer jsonb;
  label jsonb;
  cat_id integer;
  skill_id integer;
  new_problem_id integer;
  problem_max integer;
  new_cat_count integer := 0;
  new_skill_count integer := 0;
  new_problem_count integer := 0;
  old_free jsonb;
  cat_ar text;
  cat_en text;
  title_ar text;
  title_en text;
BEGIN
  -- Data integrity and identity guards, protected under same advisory lock as
  -- the authenticated admin import publish endpoint.
  IF (SELECT count(*) FROM public."Problems")<>601
     OR (SELECT count(*) FROM public."Categories")<>24
     OR (SELECT count(*) FROM public."CurriculumSkills")<>94
     OR (SELECT count(*) FROM public."CurriculumProblemSkills")<>601
     OR (SELECT count(*) FROM public."CurriculumDraftItems" WHERE "EditorialStatus"='Draft')<>172
     OR (SELECT count(*) FROM public."CurriculumTopicProposals" WHERE "EditorialStatus"='Draft')<>11
     OR (SELECT count(*) FROM public."CurriculumTopicProposals" WHERE "EditorialStatus"='Published')<>4
  THEN
     RAISE EXCEPTION 'Source bank or taxonomy changed: refuse 172-item publication';
  END IF;
  IF (SELECT count(*) FROM public."CurriculumSkills" WHERE NOT "IsPublished")<>0
     OR (SELECT count(*) FROM public."CurriculumDomains" WHERE NOT "IsPublished")<>0
     OR (SELECT count(*) FROM public."Categories" c
           LEFT JOIN public."Problems" p ON p."CategoryId"=c."Id"
           GROUP BY c."Id" HAVING count(p."Id")=0 LIMIT 1) IS NOT NULL
  THEN RAISE EXCEPTION 'Existing published skill/domain/category readiness changed';
  END IF;
  IF (SELECT count(*) FROM jsonb_array_elements(category_icons))<>11
     OR (SELECT count(*) FROM jsonb_array_elements(label_data))<>46
  THEN RAISE EXCEPTION 'Expected eleven new topics and 46 skills in release manifest';
  END IF;
  SELECT md5(string_agg(x."Id"||'|'||x."TopicProposalId"||'|'||x."ContentKey"||
     '|'||x."PrimarySkillKey"||'|'||x."QuestionTextAr"||'|'||x."QuestionTextEn"||
     '|'||x."DetailedSolutionAr"||'|'||x."DetailedSolutionEn"||
     '|'||x."OptionsJson"::text,chr(10) ORDER BY x."Id"))
    INTO actual_hash FROM public."CurriculumDraftItems" x WHERE x."EditorialStatus"='Draft';
  IF actual_hash<>expected_hash THEN
    RAISE EXCEPTION 'Draft source fingerprint changed: expected %, got %',expected_hash,actual_hash;
  END IF;
  IF EXISTS (
    SELECT 1 FROM public."CurriculumDraftItems" x
    WHERE x."EditorialStatus"='Draft' AND (
      jsonb_array_length(x."OptionsJson")<>4
      OR (SELECT count(*) FROM jsonb_array_elements(x."OptionsJson") o
          WHERE (o->>'IsCorrect')::boolean)<>1
      OR (SELECT count(DISTINCT o->>'LatexCode')
          FROM jsonb_array_elements(x."OptionsJson") o)<>4
      OR length(trim(x."QuestionTextAr"))<10
      OR length(trim(x."QuestionTextEn"))<10
      OR length(trim(x."DetailedSolutionAr"))<55
      OR length(trim(x."DetailedSolutionEn"))<55
      OR NOT (x."DetailedSolutionAr" ~ '(القانون|قاعدة|نظرية|خاصية|العلاقة|المبدأ|صيغة)')
      OR NOT (x."DetailedSolutionEn" ~* '(rule|formula|law|principle|property|theorem|identity)')
    )
  ) THEN RAISE EXCEPTION 'Draft math, solution rule, or option quality failed publication gate'; END IF;
  IF EXISTS (
    SELECT 1 FROM public."CurriculumDraftItems" x
    JOIN public."CurriculumTopicProposals" t ON t."Id"=x."TopicProposalId"
    JOIN public."Problems" p ON p."StageId"=t."StageId"
      AND (lower(trim(p."QuestionTextAr"))=lower(trim(x."QuestionTextAr"))
        OR lower(trim(p."QuestionTextEn"))=lower(trim(x."QuestionTextEn")))
    WHERE x."EditorialStatus"='Draft'
  ) THEN RAISE EXCEPTION 'A draft question text is already published'; END IF;
  IF EXISTS (
    SELECT 1 FROM public."CurriculumDraftItems" x
    WHERE x."EditorialStatus"='Draft' AND x."PrimarySkillKey" IN
       (SELECT "StableKey" FROM public."CurriculumSkills")
  ) THEN RAISE EXCEPTION 'A draft skill key collides with an existing published skill'; END IF;
  IF EXISTS (
    SELECT 1 FROM public."CurriculumTopicProposals" t
    WHERE t."EditorialStatus"='Draft' AND NOT EXISTS (
      SELECT 1 FROM jsonb_to_recordset(category_icons)
        AS i("topicKey" text,"stageId" integer,"iconSlug" text)
      WHERE i."topicKey"=t."StableKey" AND i."stageId"=t."StageId")
  ) THEN RAISE EXCEPTION 'A new topic lacks a mapped category icon'; END IF;
  IF EXISTS (
    SELECT 1 FROM public."CurriculumDraftItems" x
    WHERE x."EditorialStatus"='Draft' AND NOT EXISTS (
      SELECT 1 FROM jsonb_to_recordset(label_data)
        AS v("primarySkillKey" text,"nameAr" text,"nameEn" text)
      WHERE v."primarySkillKey"=x."PrimarySkillKey")
  ) THEN RAISE EXCEPTION 'A draft skill lacks its localized approved name'; END IF;
  IF EXISTS (
    SELECT 1 FROM public."CurriculumTopicProposals" t
    JOIN public."Categories" c ON c."StageId"=t."StageId"
       AND (c."NameAr"=t."NameAr" OR c."NameEn"=t."NameEn")
    WHERE t."EditorialStatus"='Draft'
  ) THEN RAISE EXCEPTION 'A proposed new category already collides with a live category'; END IF;

  SELECT coalesce(jsonb_agg(jsonb_build_object('stage',f."StageId",'first',f."FirstCategoryId",'second',f."SecondCategoryId") ORDER BY f."StageId"),'[]'::jsonb)
     INTO old_free FROM public."StageFreeCategorySelections" f;
  SELECT max("Id") INTO problem_max FROM public."Problems";

  -- Exactly eleven NEW independently named topics. They append to the end of
  -- each stage: existing first two free categories and IDs stay untouched.
  FOR topic IN SELECT t."Id",t."StableKey",t."StageId",t."NameAr",t."NameEn",
         t."DescriptionAr",t."DescriptionEn",t."SortOrder",i."iconSlug"
       FROM public."CurriculumTopicProposals" t
       JOIN jsonb_to_recordset(category_icons) AS i("topicKey" text,"stageId" integer,"iconSlug" text)
         ON i."topicKey"=t."StableKey" AND i."stageId"=t."StageId"
       WHERE t."EditorialStatus"='Draft'
       ORDER BY t."StageId",t."SortOrder",t."Id"
  LOOP
    cat_ar := COALESCE(descriptions->topic."StableKey"->>'ar',topic."DescriptionAr");
    cat_en := COALESCE(descriptions->topic."StableKey"->>'en',topic."DescriptionEn");
    INSERT INTO public."Categories"
      ("NameAr","NameEn","Icon","Order","StageId","DescriptionAr","DescriptionEn")
    VALUES (topic."NameAr",topic."NameEn",
      'https://math-world-frontend.vercel.app/category-icons/'||topic."iconSlug"||'.svg',
      (SELECT coalesce(max("Order"),0)+1 FROM public."Categories" WHERE "StageId"=topic."StageId"),
      topic."StageId",cat_ar,cat_en)
    RETURNING "Id" INTO cat_id;
    new_cat_count := new_cat_count+1;
  END LOOP;
  IF new_cat_count<>11 OR (SELECT count(*) FROM public."Categories")<>35
  THEN RAISE EXCEPTION 'Exactly eleven complete categories were not created'; END IF;

  -- New distinct mathematical skills are visible in the public/student skills
  -- modal, paired with their own stage and subject-specific category.
  FOR s IN SELECT DISTINCT x."PrimarySkillKey",x."TopicProposalId"
       FROM public."CurriculumDraftItems" x WHERE x."EditorialStatus"='Draft'
       ORDER BY x."TopicProposalId",x."PrimarySkillKey"
  LOOP
    label:=NULL;
    SELECT to_jsonb(v) INTO label
    FROM jsonb_to_recordset(label_data)
      AS v("primarySkillKey" text,"nameAr" text,"nameEn" text)
    WHERE v."primarySkillKey"=s."PrimarySkillKey";
    IF label IS NULL THEN RAISE EXCEPTION 'Unknown skill name %',s."PrimarySkillKey"; END IF;
    SELECT c."Id" INTO STRICT cat_id FROM public."Categories" c
      JOIN public."CurriculumTopicProposals" t ON t."StageId"=c."StageId"
        AND t."NameEn"=c."NameEn" AND t."NameAr"=c."NameAr"
      WHERE t."Id"=s."TopicProposalId";
    INSERT INTO public."CurriculumSkills"
      ("StableKey","DomainId","StageId","CategoryId","NameAr","NameEn",
       "DescriptionAr","DescriptionEn","SortOrder","IsPublished")
    SELECT s."PrimarySkillKey",t."DomainId",t."StageId",cat_id,
      label->>'nameAr',label->>'nameEn',
      (SELECT MIN(x."LearningObjectiveAr") FROM public."CurriculumDraftItems" x WHERE x."PrimarySkillKey"=s."PrimarySkillKey" AND x."EditorialStatus"='Draft'),
      (SELECT MIN(x."LearningObjectiveEn") FROM public."CurriculumDraftItems" x WHERE x."PrimarySkillKey"=s."PrimarySkillKey" AND x."EditorialStatus"='Draft'),
      (SELECT coalesce(max(q."SortOrder"),0)+1 FROM public."CurriculumSkills" q WHERE q."CategoryId"=cat_id),true
    FROM public."CurriculumTopicProposals" t WHERE t."Id"=s."TopicProposalId";
    new_skill_count := new_skill_count+1;
  END LOOP;
  IF new_skill_count<>46 OR (SELECT count(*) FROM public."CurriculumSkills")<>140
  THEN RAISE EXCEPTION 'Exactly 46 visible category skills were not created'; END IF;

  -- Publish exactly the source-locked 172 questions, their 688 distinct options,
  -- and exactly one primary skill link per question. No old problem rows touched.
  FOR d IN SELECT x.*,t."StageId" AS target_stage,t."NameAr" AS target_name_ar,
        t."NameEn" AS target_name_en
      FROM public."CurriculumDraftItems" x
      JOIN public."CurriculumTopicProposals" t ON t."Id"=x."TopicProposalId"
      WHERE x."EditorialStatus"='Draft'
      ORDER BY x."Id"
  LOOP
    SELECT c."Id" INTO STRICT cat_id
      FROM public."Categories" c WHERE c."StageId"=d.target_stage
        AND c."NameAr"=d.target_name_ar AND c."NameEn"=d.target_name_en;
    SELECT q."Id" INTO STRICT skill_id FROM public."CurriculumSkills" q
      WHERE q."StableKey"=d."PrimarySkillKey" AND q."StageId"=d.target_stage AND q."CategoryId"=cat_id
        AND q."IsPublished";
    -- Keep complete LaTeX math delimiters inside card titles.
    title_ar := left(trim(d."QuestionTextAr"),100);
    title_en := left(trim(d."QuestionTextEn"),100);
    IF (length(title_ar)-length(replace(title_ar,'$','')))%2=1 THEN
      IF strpos(substring(trim(d."QuestionTextAr") from 101),'$')=0
      THEN RAISE EXCEPTION 'Unclosed Arabic question math delimiter: %',d."ContentKey"; END IF;
      title_ar := left(trim(d."QuestionTextAr"),100+
        strpos(substring(trim(d."QuestionTextAr") from 101),'$'));
    END IF;
    IF (length(title_en)-length(replace(title_en,'$','')))%2=1 THEN
      IF strpos(substring(trim(d."QuestionTextEn") from 101),'$')=0
      THEN RAISE EXCEPTION 'Unclosed English question math delimiter: %',d."ContentKey"; END IF;
      title_en := left(trim(d."QuestionTextEn"),100+
        strpos(substring(trim(d."QuestionTextEn") from 101),'$'));
    END IF;
    INSERT INTO public."Problems"
      ("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn",
       "DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId",
       "Points","ViewsCount","SolvedCount","CreatedAt")
    VALUES (title_ar,title_en,
       trim(d."QuestionTextAr"),trim(d."QuestionTextEn"),
       trim(d."DetailedSolutionAr"),trim(d."DetailedSolutionEn"),
       d.target_stage,cat_id,10,0,0,now())
    RETURNING "Id" INTO new_problem_id;
    INSERT INTO public."QuestionOptions" ("ProblemId","Order","IsCorrect","LatexCode")
      SELECT new_problem_id,(o->>'Order')::integer,(o->>'IsCorrect')::boolean,o->>'LatexCode'
      FROM jsonb_array_elements(d."OptionsJson") o;
    INSERT INTO public."CurriculumProblemSkills" ("ProblemId","SkillId","IsPrimary")
      VALUES (new_problem_id,skill_id,true);
    new_problem_count := new_problem_count+1;
  END LOOP;
  IF new_problem_count<>172 OR (SELECT count(*) FROM public."Problems")<>773
      OR (SELECT count(*) FROM public."CurriculumProblemSkills")<>773
      OR (SELECT count(*) FROM public."QuestionOptions" WHERE "ProblemId">problem_max)<>688
  THEN RAISE EXCEPTION 'Published question count, links or answer-option count differs from release manifest'; END IF;

  -- Source editorial state reflects what students can see only AFTER insertion.
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published'
    WHERE "EditorialStatus"='Draft';
  IF (SELECT count(*) FROM public."CurriculumDraftItems" WHERE "EditorialStatus"='Draft')<>0
  THEN RAISE EXCEPTION 'Some formerly reviewed questions remain Draft'; END IF;
  UPDATE public."CurriculumTopicProposals" t SET
    "EditorialStatus"='Published',
    "DescriptionAr"=COALESCE(descriptions->t."StableKey"->>'ar',t."DescriptionAr"),
    "DescriptionEn"=COALESCE(descriptions->t."StableKey"->>'en',t."DescriptionEn")
    WHERE t."EditorialStatus"='Draft';
  IF (SELECT count(*) FROM public."CurriculumTopicProposals" WHERE "EditorialStatus"='Published')<>15
  THEN RAISE EXCEPTION 'Expected all 15 topics published'; END IF;

  IF EXISTS (
    SELECT 1 FROM public."Categories" c LEFT JOIN public."Problems" p ON p."CategoryId"=c."Id"
    GROUP BY c."Id" HAVING count(p."Id")=0
  ) THEN RAISE EXCEPTION 'Publication resulted in an empty category'; END IF;
  IF EXISTS (
    SELECT 1 FROM public."CurriculumProblemSkills" l
    JOIN public."CurriculumSkills" cs ON cs."Id"=l."SkillId"
    JOIN public."Problems" p ON p."Id"=l."ProblemId"
    WHERE cs."CategoryId"<>p."CategoryId" OR cs."StageId"<>p."StageId" OR NOT cs."IsPublished"
  ) THEN RAISE EXCEPTION 'Published skill and problem stage/category mapping is inconsistent'; END IF;
  IF (SELECT count(DISTINCT "ProblemId") FROM public."CurriculumProblemSkills" WHERE "IsPrimary")<>773
  THEN RAISE EXCEPTION 'Not every published question has a primary skill'; END IF;
  IF old_free IS DISTINCT FROM
    (SELECT coalesce(jsonb_agg(jsonb_build_object('stage',f."StageId",'first',f."FirstCategoryId",'second',f."SecondCategoryId") ORDER BY f."StageId"),'[]'::jsonb)
     FROM public."StageFreeCategorySelections" f)
  THEN RAISE EXCEPTION 'Existing Free-category selections unexpectedly changed'; END IF;
  IF EXISTS (
    SELECT 1 FROM public."Categories" c WHERE c."Id">36 AND c."Order"<=6
  ) THEN RAISE EXCEPTION 'A new category may have displaced old Free category ordering'; END IF;

  RAISE NOTICE 'MathWorld released: 172 new problems, 11 categories, 46 published skills, 688 options. Existing 601 problem records and learner history unchanged.';
END $mw_release$;
COMMIT;
