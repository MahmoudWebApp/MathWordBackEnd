-- MathWorld: additive, idempotent bilingual descriptions for public SEO and dashboards.
ALTER TABLE public."EducationalStages"
  ADD COLUMN IF NOT EXISTS "DescriptionAr" text NOT NULL DEFAULT '',
  ADD COLUMN IF NOT EXISTS "DescriptionEn" text NOT NULL DEFAULT '';
ALTER TABLE public."Categories"
  ADD COLUMN IF NOT EXISTS "DescriptionAr" text NOT NULL DEFAULT '',
  ADD COLUMN IF NOT EXISTS "DescriptionEn" text NOT NULL DEFAULT '';
-- Seed only blank descriptions; admin-written content is never overwritten.
UPDATE public."EducationalStages" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'تعلّم أساسيات الرياضيات من الأعداد والعمليات الحسابية إلى الأشكال والبيانات عبر مسائل متدرجة.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Learn mathematics foundations through arithmetic, simple algebra, geometry and data reasoning.' ELSE "DescriptionEn" END
WHERE "Id" = 1;
UPDATE public."EducationalStages" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'توسّع في نظرية الأعداد والجبر والدوال والنسب والهندسة مع تدريبات عملية تناسب المرحلة الإعدادية.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Build intermediate confidence with number theory, algebra, functions, ratios and geometry.' ELSE "DescriptionEn" END
WHERE "Id" = 2;
UPDATE public."EducationalStages" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'استعد للرياضيات الثانوية من خلال المعادلات والتعبيرات الجبرية والمثلثات والتفاضل والاحتمالات.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Develop secondary-school skills in equations, trigonometry, calculus, probability and statistics.' ELSE "DescriptionEn" END
WHERE "Id" = 3;
UPDATE public."EducationalStages" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'استكشف مفاهيم جامعية في التحليل الرياضي والتفاضل المتعدد والمصفوفات والمعادلات التفاضلية.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Explore university mathematics: real analysis, multivariable calculus, linear algebra and differential equations.' ELSE "DescriptionEn" END
WHERE "Id" = 4;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'تدرّب على العمليات الحسابية الأساسية ومسائل الأعداد اليومية.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Practice arithmetic operations and number word problems.' ELSE "DescriptionEn" END
WHERE "Id" = 1;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'اكتشف الأنماط والمتتاليات والمعادلات البسيطة.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Explore sequences, patterns and simple equations.' ELSE "DescriptionEn" END
WHERE "Id" = 2;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'تعرّف إلى الأشكال والزوايا والمحيط والمساحة والقياس.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Learn shapes, angles, perimeters, areas and measurement.' ELSE "DescriptionEn" END
WHERE "Id" = 3;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'اقرأ البيانات واحسب المتوسط والوسيط والمنوال والاحتمال البسيط.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Interpret data, averages, medians, modes and basic probability.' ELSE "DescriptionEn" END
WHERE "Id" = 4;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'تعمّق في القواسم والمضاعفات وقوانين الأسس.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Explore divisibility, factors, multiples and exponent laws.' ELSE "DescriptionEn" END
WHERE "Id" = 5;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'حل المعادلات وادرس الدوال وميل المستقيم.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Solve equations and explore functions and line slopes.' ELSE "DescriptionEn" END
WHERE "Id" = 6;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'طبّق النسب والتناسب والخصومات ومقاييس الرسم.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Apply ratios, proportions, discounts and map scales.' ELSE "DescriptionEn" END
WHERE "Id" = 7;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'تعلّم فيثاغورس والتشابه والمضلعات والبراهين الهندسية.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Study Pythagoras, similarity, polygons and geometric reasoning.' ELSE "DescriptionEn" END
WHERE "Id" = 8;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'حلّل كثيرات الحدود والمعادلات التربيعية وجذورها.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Factor polynomials and study quadratic equations and their roots.' ELSE "DescriptionEn" END
WHERE "Id" = 9;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'افهم الجيب وجيب التمام والظل وعلاقات المثلث القائم.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Understand sine, cosine, tangent and right-triangle relations.' ELSE "DescriptionEn" END
WHERE "Id" = 10;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'تدرّب على قواعد الاشتقاق والتكامل وتطبيقاتهما.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Practice differentiation, integration and their applications.' ELSE "DescriptionEn" END
WHERE "Id" = 11;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'حل مسائل التوافيق والاحتمالات والاستدلال الإحصائي.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Solve combinations, probability and statistical reasoning problems.' ELSE "DescriptionEn" END
WHERE "Id" = 12;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'استكشف التدرج والمشتقات الجزئية والاتجاهية.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Explore gradients, partial derivatives and directional derivatives.' ELSE "DescriptionEn" END
WHERE "Id" = 13;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'تعرّف إلى المتجهات والمحددات والمصفوفات.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Study vectors, determinants and matrices.' ELSE "DescriptionEn" END
WHERE "Id" = 14;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'حل المعادلات التفاضلية بالشروط الابتدائية.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Solve differential equations with initial conditions.' ELSE "DescriptionEn" END
WHERE "Id" = 15;
UPDATE public."Categories" SET
"DescriptionAr" = CASE WHEN btrim("DescriptionAr") = '' THEN 'تعمّق في النهايات والاتصال والتقارب والمتتاليات.' ELSE "DescriptionAr" END,
"DescriptionEn" = CASE WHEN btrim("DescriptionEn") = '' THEN 'Study limits, continuity, convergence and sequences.' ELSE "DescriptionEn" END
WHERE "Id" = 16;
