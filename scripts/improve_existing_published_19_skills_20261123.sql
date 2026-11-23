-- One-time quality improvement for the 19 previously published skill
-- descriptions. Does not alter IsPublished, the category, problems or students.
BEGIN;
DO $published$
DECLARE changed integer;
BEGIN
  WITH updates(id,stage_id,category_id,name_ar,name_en,old_ar,old_en,new_ar,new_en) AS (
    VALUES (93,1,21,'المئويات المبسطة','Basic Percentages','المئويات المبسطة','Basic Percentages','يحوّل بين كسر مقامه 100 والنسبة المئوية ويطبق النسبة على كميات بسيطة.','Convert fractions with denominator 100 into percentages and apply them to simple quantities.'),
(94,1,21,'القيمة المكانية والكسور العشرية','Decimal Place Value','القيمة المكانية والكسور العشرية','Decimal Place Value','يميز المنازل العشرية ويمثل قيم الأرقام العشرية ويرتبها حسب القيمة المكانية.','Identify decimal place values, represent decimals and compare them by place value.'),
(95,1,21,'العمليات على الكسور','Fraction Operations','العمليات على الكسور','Fraction Operations','يجمع ويطرح ويضرب أو يقسم الكسور في المسائل المناسبة مع تبسيط النتيجة.','Perform suitable fraction operations and simplify results where possible.'),
(96,1,21,'الكسور المتكافئة','Equivalent Fractions','الكسور المتكافئة','Equivalent Fractions','يولد كسوراً متكافئة بضرب البسط والمقام أو قسمتهما في العدد نفسه غير الصفري.','Generate equivalent fractions by scaling numerator and denominator by the same nonzero factor.'),
(97,1,21,'تمثيل الكسور','Fraction Models','تمثيل الكسور','Fraction Models','يمثل الكسور على أشكال أو خط الأعداد ويربط الجزء بالكل.','Represent fractions with shapes or number lines, relating parts to a whole.'),
(98,2,22,'التشتت وتوزيع البيانات','Data Spread and Distributions','التشتت وتوزيع البيانات','Data Spread and Distributions','يقارن مدى انتشار مجموعات بيانات ويشرح أثر القيم المتطرفة على التوزيع.','Compare data spread across sets and explain the effect of extreme values.'),
(99,2,22,'مقاييس النزعة المركزية','Summary Statistics','مقاييس النزعة المركزية','Summary Statistics','يحسب المتوسط والوسيط والمنوال ويختار المقياس الملائم للبيانات.','Compute mean, median and mode and select an appropriate measure for a dataset.'),
(100,2,22,'تمثيل البيانات وقراءتها','Charts and Data Displays','تمثيل البيانات وقراءتها','Charts and Data Displays','يقرأ الجداول والمخططات ويمثل البيانات بدقة ويفسر الاتجاهات الظاهرة.','Read tables and charts, display data accurately and interpret visible trends.'),
(101,3,23,'مجموع المتسلسلات','Series Sums','مجموع المتسلسلات','Series Sums','يجد مجموع حدود متسلسلة محددة ويطبق صيغ المجموع عندما تتحقق شروطها.','Find finite series sums and apply sum formulas when their conditions hold.'),
(102,3,23,'العلاقات الرجوعية','Recurrence Relations','العلاقات الرجوعية','Recurrence Relations','ينشئ حدود متتالية من علاقة رجوعية وقيم ابتدائية ويفحص نمطها.','Generate sequence terms from recurrence relations and initial values, then inspect the pattern.'),
(103,3,23,'المتتاليات الهندسية','Geometric Sequences','المتتاليات الهندسية','Geometric Sequences','يحدد النسبة الثابتة في متتالية هندسية ويحسب حدها العام عند تحقق الشروط.','Identify the common ratio and calculate the general term of a geometric sequence.'),
(104,3,23,'المتتاليات الحسابية','Arithmetic Sequences','المتتاليات الحسابية','Arithmetic Sequences','يحدد الفرق الثابت في متتالية حسابية ويحسب الحد المطلوب أو مجموع حدودها.','Identify the common difference and calculate arithmetic sequence terms or sums.'),
(105,4,24,'نظرية الرسوم البيانية','Graph Theory','نظرية الرسوم البيانية','Graph Theory','يمثل مسألة برؤوس وحواف ويحلل المسارات والدرجات والاتصال في الرسم البياني.','Model problems using vertices and edges and analyse paths, degrees and connectivity.'),
(106,4,24,'العد والتوافيق','Combinatorics','العد والتوافيق','Combinatorics','يميز بين التباديل والتوافيق ويحسب عدد الاختيارات مع مراعاة الترتيب.','Distinguish permutations from combinations and count choices with correct order assumptions.'),
(107,4,24,'العلاقات والتكافؤ','Relations and Equivalence','العلاقات والتكافؤ','Relations and Equivalence','يفحص خواص الانعكاس والتناظر والتعدي ليحدد ما إذا كانت علاقة تكافؤ.','Test reflexivity, symmetry and transitivity to determine equivalence relations.'),
(108,4,24,'مبادئ البرهان','Proof Principles','مبادئ البرهان','Proof Principles','يبني برهاناً منطقياً باستخدام فرضيات ونتائج صريحة ويميز المثال المضاد.','Construct logical proofs with explicit assumptions and conclusions and identify counterexamples.'),
(109,4,24,'المنطق الرياضي','Mathematical Logic','المنطق الرياضي','Mathematical Logic','يترجم العبارات إلى قضايا منطقية ويفحص صدقها باستخدام الروابط وجداول الحقيقة.','Translate statements into propositions and evaluate logical connectives using truth tables.'),
(112,1,21,'مقارنة الكسور','Fraction Comparisons','مقارنة الكسور','Fraction Comparisons','يقارن كسوراً باستخدام مقام مشترك أو تمثيل مناسب ويبرر ترتيبها.','Compare fractions by common denominators or appropriate models, explaining their order.'),
(113,3,23,'تقارب المتسلسلات وتباعدها','Series Convergence and Divergence','تقارب المتسلسلات وتباعدها','Series Convergence and Divergence','يختار معيار تقارب ملائم لسلسلة غير منتهية ويميز التقارب عن التباعد.','Choose a justified convergence test for infinite series and distinguish convergence from divergence.')
  ), applied AS (
    UPDATE public."CurriculumSkills" AS s
    SET "DescriptionAr" = u.new_ar, "DescriptionEn" = u.new_en
    FROM updates u
    WHERE s."Id" = u.id AND s."StageId" = u.stage_id
      AND s."CategoryId" = u.category_id
      AND s."NameAr" = u.name_ar AND s."NameEn" = u.name_en
      AND s."DescriptionAr" = u.old_ar AND s."DescriptionEn" = u.old_en
      AND s."IsPublished" = TRUE
    RETURNING s."Id"
  )
  SELECT count(*) INTO changed FROM applied;
  IF changed <> 19 THEN
    RAISE EXCEPTION 'Expected 19 existing published skill descriptions, changed %; rolling back', changed;
  END IF;
END $published$;
COMMIT;
