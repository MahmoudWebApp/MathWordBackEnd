-- Reviewed, idempotent content-only correction for three example solutions.
-- Does not touch problems' prompts, four options, answers, stages, attempts,
-- points, subscriptions, mastery or historical progress.
BEGIN;

DO $block$
DECLARE affected integer;
BEGIN
  UPDATE public."Problems" SET
    "DetailedSolutionAr" = $ar$القانون المستخدم: مساحة المستطيل = الطول × العرض.
المعطيات: الطول = 9 سم، العرض = 6 سم.
التعويض: المساحة = 9 × 6 = 54.
الإجابة النهائية: 54 سم²، لأن المساحة تُقاس بوحدات مربعة.$ar$,
    "DetailedSolutionEn" = $en$Rule used: Rectangle area = length × width.
Given: length = 9 cm and width = 6 cm.
Substitute: area = 9 × 6 = 54.
Final answer: 54 cm², because area is measured in square units.$en$
  WHERE "Id" = 116 AND "StageId" = 1 AND "CategoryId" = 3
    AND "DetailedSolutionAr" = 'المساحة = الطول × العرض = 9×6=54 سم².'
    AND "DetailedSolutionEn" = 'Area = length × width = 9×6=54 cm².';
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 116 unexpectedly changed; refusing partial correction'; END IF;

  UPDATE public."Problems" SET
    "DetailedSolutionAr" = $ar$القانون المستخدم: محيط المستطيل = 2 × (الطول + العرض).
المعطيات: الطول = 9 سم، العرض = 6 سم.
التعويض: المحيط = 2 × (9 + 6) = 2 × 15 = 30.
الإجابة النهائية: 30 سم. المحيط طول الحدود الخارجية، لذلك وحدته سم وليست سم².$ar$,
    "DetailedSolutionEn" = $en$Rule used: Rectangle perimeter = 2 × (length + width).
Given: length = 9 cm and width = 6 cm.
Substitute: perimeter = 2 × (9 + 6) = 2 × 15 = 30.
Final answer: 30 cm. Perimeter is a length, so the unit is cm, not cm².$en$
  WHERE "Id" = 179 AND "StageId" = 1 AND "CategoryId" = 3
    AND "DetailedSolutionAr" = 'المحيط=2×(9+6)=30 سم.'
    AND "DetailedSolutionEn" = 'Perimeter=2×(9+6)=30 cm.';
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 179 unexpectedly changed; refusing partial correction'; END IF;

  UPDATE public."Problems" SET
    "DetailedSolutionAr" = $ar$القانون المستخدم: مساحة المثلث = (القاعدة × الارتفاع) ÷ 2.
المبدأ الهندسي: قطر المستطيل يقسمه إلى مثلثين متطابقين ومتساويين في المساحة.
المعطيات: القاعدة = 10 سم والارتفاع العمودي = 6 سم.
التعويض: مساحة أحد المثلثين = (10 × 6) ÷ 2 = 60 ÷ 2 = 30.
الإجابة النهائية: 30 سم².$ar$,
    "DetailedSolutionEn" = $en$Rule used: Triangle area = (base × perpendicular height) ÷ 2.
Geometric principle: A rectangle's diagonal divides it into two congruent triangles of equal area.
Given: base = 10 cm and perpendicular height = 6 cm.
Substitute: area of either triangle = (10 × 6) ÷ 2 = 60 ÷ 2 = 30.
Final answer: 30 cm².$en$
  WHERE "Id" = 616 AND "StageId" = 1 AND "CategoryId" = 3
    AND "DetailedSolutionAr" = 'مساحة المستطيل 10 × 6 = 60، والقطر يقسمها بالتساوي، إذن 30.'
    AND "DetailedSolutionEn" = 'The rectangle area is 10 × 6 = 60. A diagonal halves it, giving 30.';
  GET DIAGNOSTICS affected = ROW_COUNT;
  IF affected <> 1 THEN RAISE EXCEPTION 'Problem 616 unexpectedly changed; refusing partial correction'; END IF;
END
$block$;

COMMIT;
