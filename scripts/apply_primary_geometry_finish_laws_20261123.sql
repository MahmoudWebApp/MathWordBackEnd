-- Apply once: guarded explanation-only revisions, 16 elementary geometry questions.
-- No question/answer/student data changes.
BEGIN;
DO $mw_primary_geo_complete$
DECLARE affected integer;
BEGIN
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: مساحة المستطيل = الطول × العرض. طول المستطيل 6 سم وعرضه 3 سم؛ بالتعويض: المساحة = 6 × 3 = 18 سم². نستخدم وحدة مربعة لأن المساحة تقيس السطح داخل الشكل.', "DetailedSolutionEn"='Rule used: Rectangle area = length × width. The rectangle measures 6 cm by 3 cm. Substitute: 6 × 3 = 18 cm². Area uses square units because it measures the surface inside the figure.'
 WHERE "Id"=71 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='مستطيل طوله 6 سم وعرضه 3 سم. ما مساحته بالسم المربع؟' AND "QuestionTextEn"='A rectangle is 6 cm by 3 cm. Find its area in square centimetres.'
   AND "DetailedSolutionAr"='المساحة = الطول × العرض = 6×3=18 سم².' AND "DetailedSolutionEn"='Area = length × width = 6×3=18 cm².'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=71 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=71
      AND o."Id"=274 AND o."IsCorrect" AND o."LatexCode"='18');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 71: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: مساحة المستطيل = الطول × العرض. طول المستطيل 7 سم وعرضه 4 سم؛ بالتعويض: المساحة = 7 × 4 = 28 سم². نستخدم وحدة مربعة لأن المساحة تقيس السطح داخل الشكل.', "DetailedSolutionEn"='Rule used: Rectangle area = length × width. The rectangle measures 7 cm by 4 cm. Substitute: 7 × 4 = 28 cm². Area uses square units because it measures the surface inside the figure.'
 WHERE "Id"=86 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='مستطيل طوله 7 سم وعرضه 4 سم. ما مساحته بالسم المربع؟' AND "QuestionTextEn"='A rectangle is 7 cm by 4 cm. Find its area in square centimetres.'
   AND "DetailedSolutionAr"='المساحة = الطول × العرض = 7×4=28 سم².' AND "DetailedSolutionEn"='Area = length × width = 7×4=28 cm².'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=86 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=86
      AND o."Id"=333 AND o."IsCorrect" AND o."LatexCode"='28');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 86: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: مساحة المستطيل = الطول × العرض. طول المستطيل 8 سم وعرضه 5 سم؛ بالتعويض: المساحة = 8 × 5 = 40 سم². نستخدم وحدة مربعة لأن المساحة تقيس السطح داخل الشكل.', "DetailedSolutionEn"='Rule used: Rectangle area = length × width. The rectangle measures 8 cm by 5 cm. Substitute: 8 × 5 = 40 cm². Area uses square units because it measures the surface inside the figure.'
 WHERE "Id"=101 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='مستطيل طوله 8 سم وعرضه 5 سم. ما مساحته بالسم المربع؟' AND "QuestionTextEn"='A rectangle is 8 cm by 5 cm. Find its area in square centimetres.'
   AND "DetailedSolutionAr"='المساحة = الطول × العرض = 8×5=40 سم².' AND "DetailedSolutionEn"='Area = length × width = 8×5=40 cm².'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=101 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=101
      AND o."Id"=396 AND o."IsCorrect" AND o."LatexCode"='40');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 101: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: مساحة المستطيل = الطول × العرض. طول المستطيل 10 سم وعرضه 7 سم؛ بالتعويض: المساحة = 10 × 7 = 70 سم². نستخدم وحدة مربعة لأن المساحة تقيس السطح داخل الشكل.', "DetailedSolutionEn"='Rule used: Rectangle area = length × width. The rectangle measures 10 cm by 7 cm. Substitute: 10 × 7 = 70 cm². Area uses square units because it measures the surface inside the figure.'
 WHERE "Id"=131 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='مستطيل طوله 10 سم وعرضه 7 سم. ما مساحته بالسم المربع؟' AND "QuestionTextEn"='A rectangle is 10 cm by 7 cm. Find its area in square centimetres.'
   AND "DetailedSolutionAr"='المساحة = الطول × العرض = 10×7=70 سم².' AND "DetailedSolutionEn"='Area = length × width = 10×7=70 cm².'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=131 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=131
      AND o."Id"=514 AND o."IsCorrect" AND o."LatexCode"='70');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 131: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: محيط المستطيل = 2 × (الطول + العرض)، لأن لكل بُعد ضلعين متساويين. المعطيات 7 سم و4 سم؛ نجمع 7 + 4 = 11 سم ثم نضاعف: 2 × 11 = 22 سم. المحيط طول الحدود الخارجية وليس مساحة.', "DetailedSolutionEn"='Rule used: Rectangle perimeter = 2 × (length + width), as each side length occurs twice. Given 7 cm and 4 cm, add 7 + 4 = 11 cm, then double: 2 × 11 = 22 cm. Perimeter measures distance around the shape.'
 WHERE "Id"=155 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='ما محيط مستطيل طوله 7 سم وعرضه 4 سم؟' AND "QuestionTextEn"='Find the perimeter of a 7 cm by 4 cm rectangle.'
   AND "DetailedSolutionAr"='المحيط=2×(7+4)=22 سم.' AND "DetailedSolutionEn"='Perimeter=2×(7+4)=22 cm.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=155 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=155
      AND o."Id"=609 AND o."IsCorrect" AND o."LatexCode"='22');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 155: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: محيط المستطيل = 2 × (الطول + العرض)، لأن لكل بُعد ضلعين متساويين. المعطيات 8 سم و5 سم؛ نجمع 8 + 5 = 13 سم ثم نضاعف: 2 × 13 = 26 سم. المحيط طول الحدود الخارجية وليس مساحة.', "DetailedSolutionEn"='Rule used: Rectangle perimeter = 2 × (length + width), as each side length occurs twice. Given 8 cm and 5 cm, add 8 + 5 = 13 cm, then double: 2 × 13 = 26 cm. Perimeter measures distance around the shape.'
 WHERE "Id"=167 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='ما محيط مستطيل طوله 8 سم وعرضه 5 سم؟' AND "QuestionTextEn"='Find the perimeter of a 8 cm by 5 cm rectangle.'
   AND "DetailedSolutionAr"='المحيط=2×(8+5)=26 سم.' AND "DetailedSolutionEn"='Perimeter=2×(8+5)=26 cm.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=167 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=167
      AND o."Id"=660 AND o."IsCorrect" AND o."LatexCode"='26');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 167: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: محيط المستطيل = 2 × (الطول + العرض)، لأن لكل بُعد ضلعين متساويين. المعطيات 10 سم و7 سم؛ نجمع 10 + 7 = 17 سم ثم نضاعف: 2 × 17 = 34 سم. المحيط طول الحدود الخارجية وليس مساحة.', "DetailedSolutionEn"='Rule used: Rectangle perimeter = 2 × (length + width), as each side length occurs twice. Given 10 cm and 7 cm, add 10 + 7 = 17 cm, then double: 2 × 17 = 34 cm. Perimeter measures distance around the shape.'
 WHERE "Id"=191 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='ما محيط مستطيل طوله 10 سم وعرضه 7 سم؟' AND "QuestionTextEn"='Find the perimeter of a 10 cm by 7 cm rectangle.'
   AND "DetailedSolutionAr"='المحيط=2×(10+7)=34 سم.' AND "DetailedSolutionEn"='Perimeter=2×(10+7)=34 cm.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=191 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=191
      AND o."Id"=754 AND o."IsCorrect" AND o."LatexCode"='34');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 191: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: محيط المستطيل = 2 × (الطول + العرض)، لأن لكل بُعد ضلعين متساويين. المعطيات 11 سم و8 سم؛ نجمع 11 + 8 = 19 سم ثم نضاعف: 2 × 19 = 38 سم. المحيط طول الحدود الخارجية وليس مساحة.', "DetailedSolutionEn"='Rule used: Rectangle perimeter = 2 × (length + width), as each side length occurs twice. Given 11 cm and 8 cm, add 11 + 8 = 19 cm, then double: 2 × 19 = 38 cm. Perimeter measures distance around the shape.'
 WHERE "Id"=203 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='ما محيط مستطيل طوله 11 سم وعرضه 8 سم؟' AND "QuestionTextEn"='Find the perimeter of a 11 cm by 8 cm rectangle.'
   AND "DetailedSolutionAr"='المحيط=2×(11+8)=38 سم.' AND "DetailedSolutionEn"='Perimeter=2×(11+8)=38 cm.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=203 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=203
      AND o."Id"=801 AND o."IsCorrect" AND o."LatexCode"='38');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 203: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: مجموع الزوايا الداخلية لأي مثلث = 180°. لدينا زاويتان 57° و63°؛ مجموعهما 57 + 63 = 120°. الزاوية الثالثة = 180 − 120 = 60°. التحقق: 57° + 63° + 60° = 180°.', "DetailedSolutionEn"='Rule used: The interior angles of a triangle total 180°. The given angles are 57° and 63°, summing to 120°. The missing angle is 180 − 120 = 60°. Check: 57° + 63° + 60° = 180°.'
 WHERE "Id"=168 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='زاويتا مثلث هما 57° و63°، ما الثالثة؟' AND "QuestionTextEn"='Two angles of a triangle are 57° and 63°. Find the third.'
   AND "DetailedSolutionAr"='الزاوية الثالثة=180−57−63=60°.' AND "DetailedSolutionEn"='The third angle=180−57−63=60°.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=168 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=168
      AND o."Id"=663 AND o."IsCorrect" AND o."LatexCode"='60');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 168: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: مجموع الزوايا الداخلية لأي مثلث = 180°. لدينا زاويتان 64° و66°؛ مجموعهما 64 + 66 = 130°. الزاوية الثالثة = 180 − 130 = 50°. التحقق: 64° + 66° + 50° = 180°.', "DetailedSolutionEn"='Rule used: The interior angles of a triangle total 180°. The given angles are 64° and 66°, summing to 130°. The missing angle is 180 − 130 = 50°. Check: 64° + 66° + 50° = 180°.'
 WHERE "Id"=180 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='زاويتا مثلث هما 64° و66°، ما الثالثة؟' AND "QuestionTextEn"='Two angles of a triangle are 64° and 66°. Find the third.'
   AND "DetailedSolutionAr"='الزاوية الثالثة=180−64−66=50°.' AND "DetailedSolutionEn"='The third angle=180−64−66=50°.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=180 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=180
      AND o."Id"=710 AND o."IsCorrect" AND o."LatexCode"='50');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 180: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: مجموع الزوايا الداخلية لأي مثلث = 180°. لدينا زاويتان 71° و69°؛ مجموعهما 71 + 69 = 140°. الزاوية الثالثة = 180 − 140 = 40°. التحقق: 71° + 69° + 40° = 180°.', "DetailedSolutionEn"='Rule used: The interior angles of a triangle total 180°. The given angles are 71° and 69°, summing to 140°. The missing angle is 180 − 140 = 40°. Check: 71° + 69° + 40° = 180°.'
 WHERE "Id"=192 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='زاويتا مثلث هما 71° و69°، ما الثالثة؟' AND "QuestionTextEn"='Two angles of a triangle are 71° and 69°. Find the third.'
   AND "DetailedSolutionAr"='الزاوية الثالثة=180−71−69=40°.' AND "DetailedSolutionEn"='The third angle=180−71−69=40°.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=192 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=192
      AND o."Id"=757 AND o."IsCorrect" AND o."LatexCode"='40');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 192: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='القانون المستخدم: مجموع الزوايا الداخلية لأي مثلث = 180°. لدينا زاويتان 78° و72°؛ مجموعهما 78 + 72 = 150°. الزاوية الثالثة = 180 − 150 = 30°. التحقق: 78° + 72° + 30° = 180°.', "DetailedSolutionEn"='Rule used: The interior angles of a triangle total 180°. The given angles are 78° and 72°, summing to 150°. The missing angle is 180 − 150 = 30°. Check: 78° + 72° + 30° = 180°.'
 WHERE "Id"=204 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='زاويتا مثلث هما 78° و72°، ما الثالثة؟' AND "QuestionTextEn"='Two angles of a triangle are 78° and 72°. Find the third.'
   AND "DetailedSolutionAr"='الزاوية الثالثة=180−78−72=30°.' AND "DetailedSolutionEn"='The third angle=180−78−72=30°.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=204 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=204
      AND o."Id"=808 AND o."IsCorrect" AND o."LatexCode"='30');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 204: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='قاعدة التحويل: 1 متر = 100 سنتيمتر، لذا عند التحويل من المتر إلى السنتيمتر نضرب في 100. المعطى 3 أمتار، وبالتعويض: 3 × 100 = 300 سنتيمتر. النتيجة 300 سم.', "DetailedSolutionEn"='Conversion rule: 1 metre = 100 centimetres. To convert metres to centimetres, multiply by 100. Given 3 metres, compute 3 × 100 = 300 centimetres. Answer: 300 cm.'
 WHERE "Id"=169 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='حوّل 3 متر إلى سنتيمترات.' AND "QuestionTextEn"='Convert 3 metres to centimetres.'
   AND "DetailedSolutionAr"='بما أن المتر 100 سم فالنتيجة 300.' AND "DetailedSolutionEn"='One metre equals 100 cm, giving 300.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=169 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=169
      AND o."Id"=666 AND o."IsCorrect" AND o."LatexCode"='300');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 169: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='قاعدة التحويل: 1 متر = 100 سنتيمتر، لذا عند التحويل من المتر إلى السنتيمتر نضرب في 100. المعطى 4 أمتار، وبالتعويض: 4 × 100 = 400 سنتيمتر. النتيجة 400 سم.', "DetailedSolutionEn"='Conversion rule: 1 metre = 100 centimetres. To convert metres to centimetres, multiply by 100. Given 4 metres, compute 4 × 100 = 400 centimetres. Answer: 400 cm.'
 WHERE "Id"=181 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='حوّل 4 متر إلى سنتيمترات.' AND "QuestionTextEn"='Convert 4 metres to centimetres.'
   AND "DetailedSolutionAr"='بما أن المتر 100 سم فالنتيجة 400.' AND "DetailedSolutionEn"='One metre equals 100 cm, giving 400.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=181 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=181
      AND o."Id"=713 AND o."IsCorrect" AND o."LatexCode"='400');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 181: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='قاعدة التحويل: 1 متر = 100 سنتيمتر، لذا عند التحويل من المتر إلى السنتيمتر نضرب في 100. المعطى 5 أمتار، وبالتعويض: 5 × 100 = 500 سنتيمتر. النتيجة 500 سم.', "DetailedSolutionEn"='Conversion rule: 1 metre = 100 centimetres. To convert metres to centimetres, multiply by 100. Given 5 metres, compute 5 × 100 = 500 centimetres. Answer: 500 cm.'
 WHERE "Id"=193 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='حوّل 5 متر إلى سنتيمترات.' AND "QuestionTextEn"='Convert 5 metres to centimetres.'
   AND "DetailedSolutionAr"='بما أن المتر 100 سم فالنتيجة 500.' AND "DetailedSolutionEn"='One metre equals 100 cm, giving 500.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=193 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=193
      AND o."Id"=764 AND o."IsCorrect" AND o."LatexCode"='500');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 193: stale data/answer, abort all'; END IF;
 UPDATE public."Problems"
 SET "DetailedSolutionAr"='قاعدة التحويل: 1 متر = 100 سنتيمتر، لذا عند التحويل من المتر إلى السنتيمتر نضرب في 100. المعطى 6 أمتار، وبالتعويض: 6 × 100 = 600 سنتيمتر. النتيجة 600 سم.', "DetailedSolutionEn"='Conversion rule: 1 metre = 100 centimetres. To convert metres to centimetres, multiply by 100. Given 6 metres, compute 6 × 100 = 600 centimetres. Answer: 600 cm.'
 WHERE "Id"=205 AND "StageId"=1 AND "CategoryId"=3
   AND "QuestionTextAr"='حوّل 6 متر إلى سنتيمترات.' AND "QuestionTextEn"='Convert 6 metres to centimetres.'
   AND "DetailedSolutionAr"='بما أن المتر 100 سم فالنتيجة 600.' AND "DetailedSolutionEn"='One metre equals 100 cm, giving 600.'
   AND (SELECT COUNT(*) FROM public."QuestionOptions" o WHERE o."ProblemId"=205 AND o."IsCorrect")=1
   AND EXISTS(SELECT 1 FROM public."QuestionOptions" o WHERE o."ProblemId"=205
      AND o."Id"=811 AND o."IsCorrect" AND o."LatexCode"='600');
 GET DIAGNOSTICS affected = ROW_COUNT;
 IF affected <> 1 THEN RAISE EXCEPTION 'Geometry problem 205: stale data/answer, abort all'; END IF;
END $mw_primary_geo_complete$;
COMMIT;