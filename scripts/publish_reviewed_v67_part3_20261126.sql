-- One-time owner-authorized v67 school depth. Existing linked categories only.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v67-grade-9-grouped-data-largest-possible-range-from-classes-1$mw$,$mw$grouped-data-largest-possible-range-from-classes$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"أكبر مدى ممكن من فئات","En":"Largest possible grouped range"},"Question":{"Ar":"توجد 3 قيم صحيحة في الفئة 10–19 و4 في الفئة 20–29 و2 في الفئة 30–39. ما أكبر مدى ممكن للبيانات؟ الحدود مشمولة.","En":"There are three integer values in 10–19, four in 20–29 and two in 30–39. What is the largest possible range? Endpoints are included."},"Options":[{"LatexCode":"39","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذه القيمة الكبرى الممكنة وليست المدى.","En":"This is the possible maximum, not the range."}},{"LatexCode":"29","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح بدايتي الفئتين فقط.","En":"Subtracts just the class starts."}},{"LatexCode":"19","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"لم يستخدم الحد الأعلى للفئة الأخيرة.","En":"Does not use the last class upper endpoint."}}],"Hints":[{"Ar":"حدد أصغر قيمة مسموحة.","En":"Find the smallest allowed value."},{"Ar":"حدد أكبر قيمة مسموحة.","En":"Find the largest allowed value."}],"Solution":{"Idea":{"Ar":"أكبر مدى يتحقق عند أصغر حد ممكن وأكبر حد ممكن.","En":"The largest range uses the smallest possible minimum and largest possible maximum."},"FormulaLatex":"R_{max}=39-10","Steps":[{"Ar":"$R_{max}=29$","En":"$R_{max}=29$"}],"Substitution":{"Ar":"$39-10$","En":"$39-10$"},"Result":{"Ar":"$29$","En":"$29$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"تُحقق البيانات $(10,11,12,20,21,22,23,30,39)$ جميع التكرارات والمدى 29.","En":"The data $(10,11,12,20,21,22,23,30,39)$ satisfy all class counts and attain range 29."},"CommonError":{"Ar":"طرح بدايتي الفئتين فقط.","En":"Subtracts just the class starts."}}}$mw$::jsonb,$mw$أكبر مدى يتحقق عند أصغر حد ممكن وأكبر حد ممكن.

$R_{max}=39-10$

1. $R_{max}=29$

$39-10$

$29$

تُحقق البيانات $(10,11,12,20,21,22,23,30,39)$ جميع التكرارات والمدى 29.

طرح بدايتي الفئتين فقط.$mw$,$mw$The largest range uses the smallest possible minimum and largest possible maximum.

$R_{max}=39-10$

1. $R_{max}=29$

$39-10$

$29$

The data $(10,11,12,20,21,22,23,30,39)$ satisfy all class counts and attain range 29.

Subtracts just the class starts.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"حدد أصغر قيمة مسموحة.","En":"Find the smallest allowed value."},{"Ar":"حدد أكبر قيمة مسموحة.","En":"Find the largest allowed value."}],"Solution":{"Idea":{"Ar":"أكبر مدى يتحقق عند أصغر حد ممكن وأكبر حد ممكن.","En":"The largest range uses the smallest possible minimum and largest possible maximum."},"FormulaLatex":"R_{max}=39-10","Steps":[{"Ar":"$R_{max}=29$","En":"$R_{max}=29$"}],"Substitution":{"Ar":"$39-10$","En":"$39-10$"},"Result":{"Ar":"$29$","En":"$29$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"تُحقق البيانات $(10,11,12,20,21,22,23,30,39)$ جميع التكرارات والمدى 29.","En":"The data $(10,11,12,20,21,22,23,30,39)$ satisfy all class counts and attain range 29."},"CommonError":{"Ar":"طرح بدايتي الفئتين فقط.","En":"Subtracts just the class starts."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"هذه القيمة الكبرى الممكنة وليست المدى.","En":"This is the possible maximum, not the range."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح بدايتي الفئتين فقط.","En":"Subtracts just the class starts."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"لم يستخدم الحد الأعلى للفئة الأخيرة.","En":"Does not use the last class upper endpoint."},"Order":4}]}$mw$),
($mw$growth-v67-grade-9-iqr-bounds-identify-impossible-from-range-1$mw$,$mw$iqr-bounds-identify-impossible-from-range$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"المدى الربعي والمدى الكلي","En":"IQR and full range"},"Question":{"Ar":"مدى مجموعة بيانات يساوي 12. أي قيمة من الخيارات يستحيل أن تكون مداها الربعي؟ احسب الربيعين بطريقة وسيط النصفين مع استبعاد الوسيط الكلي إن كان عدد القيم فردياً.","En":"A data set has range twelve. Which listed value cannot be its interquartile range? Use the medians of the two halves, excluding the overall median for an odd count."},"Options":[{"LatexCode":"15","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمكن أن يتطابق الربيعان مع بقاء قيم طرفية مختلفة.","En":"Quartiles can coincide despite distinct extremes."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمكن أن يقع المدى الربعي بين صفر والمدى الكلي.","En":"IQR can lie between zero and the full range."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"يمكن أن يساوي المدى الربعي المدى الكلي.","En":"IQR can equal the full range."}}],"Hints":[{"Ar":"قارن مجال الربيعين بمجال البيانات كله.","En":"Compare the quartile interval with the full data interval."},{"Ar":"ابحث عن قيمة أكبر من المدى.","En":"Find a value greater than the range."}],"Solution":{"Idea":{"Ar":"الربيعان يقعان ضمن أصغر وأكبر قيمة، لذلك لا يتجاوز المدى الربعي المدى الكلي.","En":"Quartiles lie between the minimum and maximum, so IQR cannot exceed the range."},"FormulaLatex":"0\\le Q_3-Q_1\\le12","Steps":[{"Ar":"$IQR\\le12$","En":"$IQR\\le12$"},{"Ar":"$15>12$","En":"$15>12$"}],"Substitution":{"Ar":"$15>12$","En":"$15>12$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مثلاً البيانات $(0,0,12,12)$ تعطي مدى ومدى ربعياً يساويان 12، ولا يمكن تجاوز هذا الحد.","En":"For example, $(0,0,12,12)$ has range and IQR both equal to 12; the IQR cannot exceed that bound."},"CommonError":{"Ar":"يمكن أن يتطابق الربيعان مع بقاء قيم طرفية مختلفة.","En":"Quartiles can coincide despite distinct extremes."}}}$mw$::jsonb,$mw$الربيعان يقعان ضمن أصغر وأكبر قيمة، لذلك لا يتجاوز المدى الربعي المدى الكلي.

$0\le Q_3-Q_1\le12$

1. $IQR\le12$

2. $15>12$

$15>12$

$15$

مثلاً البيانات $(0,0,12,12)$ تعطي مدى ومدى ربعياً يساويان 12، ولا يمكن تجاوز هذا الحد.

يمكن أن يتطابق الربيعان مع بقاء قيم طرفية مختلفة.$mw$,$mw$Quartiles lie between the minimum and maximum, so IQR cannot exceed the range.

$0\le Q_3-Q_1\le12$

1. $IQR\le12$

2. $15>12$

$15>12$

$15$

For example, $(0,0,12,12)$ has range and IQR both equal to 12; the IQR cannot exceed that bound.

Quartiles can coincide despite distinct extremes.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"قارن مجال الربيعين بمجال البيانات كله.","En":"Compare the quartile interval with the full data interval."},{"Ar":"ابحث عن قيمة أكبر من المدى.","En":"Find a value greater than the range."}],"Solution":{"Idea":{"Ar":"الربيعان يقعان ضمن أصغر وأكبر قيمة، لذلك لا يتجاوز المدى الربعي المدى الكلي.","En":"Quartiles lie between the minimum and maximum, so IQR cannot exceed the range."},"FormulaLatex":"0\\le Q_3-Q_1\\le12","Steps":[{"Ar":"$IQR\\le12$","En":"$IQR\\le12$"},{"Ar":"$15>12$","En":"$15>12$"}],"Substitution":{"Ar":"$15>12$","En":"$15>12$"},"Result":{"Ar":"$15$","En":"$15$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"مثلاً البيانات $(0,0,12,12)$ تعطي مدى ومدى ربعياً يساويان 12، ولا يمكن تجاوز هذا الحد.","En":"For example, $(0,0,12,12)$ has range and IQR both equal to 12; the IQR cannot exceed that bound."},"CommonError":{"Ar":"يمكن أن يتطابق الربيعان مع بقاء قيم طرفية مختلفة.","En":"Quartiles can coincide despite distinct extremes."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"يمكن أن يتطابق الربيعان مع بقاء قيم طرفية مختلفة.","En":"Quartiles can coincide despite distinct extremes."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"يمكن أن يقع المدى الربعي بين صفر والمدى الكلي.","En":"IQR can lie between zero and the full range."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"يمكن أن يساوي المدى الربعي المدى الكلي.","En":"IQR can equal the full range."},"Order":4}]}$mw$),
($mw$growth-v67-grade-9-mad-single-outlier-equal-baseline-three-zeros-1$mw$,$mw$mad-single-outlier-equal-baseline-three-zeros$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"انحراف مطلق مع قيمة شاذة","En":"MAD with one outlier"},"Question":{"Ar":"البيانات 0،0،0،8 ومتوسطها 2. ما نسبة متوسط الانحرافات المطلقة إلى المدى؟","En":"The data are 0,0,0,8 with mean two. What is the ratio of the mean absolute deviation to the range?"},"Options":[{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم المتوسط نفسه على المدى.","En":"Divides the mean itself by the range."}},{"LatexCode":"\\frac34","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم انحراف القيمة الكبرى فقط على المدى.","En":"Divides only the largest deviation by the range."}},{"LatexCode":"\\frac32","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم مجموع الانحرافات على المدى قبل حساب المتوسط.","En":"Divides total deviation by the range before averaging."}},{"LatexCode":"\\frac38","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب بعد كل قيمة عن 2.","En":"Find each observation's distance from two."},{"Ar":"اقسم المتوسط الناتج على المدى.","En":"Divide the resulting average by the range."}],"Solution":{"Idea":{"Ar":"نحسب متوسط الانحرافات المطلقة ثم نقسم على المدى.","En":"Find the mean absolute deviation then divide by range."},"FormulaLatex":"MAD=(2+2+2+6)/4","Steps":[{"Ar":"$MAD=12/4=3$","En":"$MAD=12/4=3$"},{"Ar":"$R=8-0=8$","En":"$R=8-0=8$"},{"Ar":"$MAD/R=3/8$","En":"$MAD/R=3/8$"}],"Substitution":{"Ar":"$3/8$","En":"$3/8$"},"Result":{"Ar":"$\\frac38$","En":"$\\frac38$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8\\cdot(3/8)=3$","En":"$8\\cdot(3/8)=3$"},"CommonError":{"Ar":"قسم المتوسط نفسه على المدى.","En":"Divides the mean itself by the range."}}}$mw$::jsonb,$mw$نحسب متوسط الانحرافات المطلقة ثم نقسم على المدى.

$MAD=(2+2+2+6)/4$

1. $MAD=12/4=3$

2. $R=8-0=8$

3. $MAD/R=3/8$

$3/8$

$\frac38$

$8\cdot(3/8)=3$

قسم المتوسط نفسه على المدى.$mw$,$mw$Find the mean absolute deviation then divide by range.

$MAD=(2+2+2+6)/4$

1. $MAD=12/4=3$

2. $R=8-0=8$

3. $MAD/R=3/8$

$3/8$

$\frac38$

$8\cdot(3/8)=3$

Divides the mean itself by the range.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"احسب بعد كل قيمة عن 2.","En":"Find each observation's distance from two."},{"Ar":"اقسم المتوسط الناتج على المدى.","En":"Divide the resulting average by the range."}],"Solution":{"Idea":{"Ar":"نحسب متوسط الانحرافات المطلقة ثم نقسم على المدى.","En":"Find the mean absolute deviation then divide by range."},"FormulaLatex":"MAD=(2+2+2+6)/4","Steps":[{"Ar":"$MAD=12/4=3$","En":"$MAD=12/4=3$"},{"Ar":"$R=8-0=8$","En":"$R=8-0=8$"},{"Ar":"$MAD/R=3/8$","En":"$MAD/R=3/8$"}],"Substitution":{"Ar":"$3/8$","En":"$3/8$"},"Result":{"Ar":"$\\frac38$","En":"$\\frac38$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$8\\cdot(3/8)=3$","En":"$8\\cdot(3/8)=3$"},"CommonError":{"Ar":"قسم المتوسط نفسه على المدى.","En":"Divides the mean itself by the range."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قسم المتوسط نفسه على المدى.","En":"Divides the mean itself by the range."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قسم انحراف القيمة الكبرى فقط على المدى.","En":"Divides only the largest deviation by the range."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"قسم مجموع الانحرافات على المدى قبل حساب المتوسط.","En":"Divides total deviation by the range before averaging."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v67-grade-9-grouped-data-class-relative-frequency-combined-1$mw$,$mw$grouped-data-class-relative-frequency-combined$mw$,$mw$m-statistics-distributions$mw$,$mw$grade-9$mw$,9,2,22,98,$mw${"StageId":2,"CategoryId":22,"PrimarySkillId":98,"SecondarySkillIds":[],"TrackIds":[9],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"نسبة تكرار فئتين متجاورتين","En":"Relative frequency of two classes"},"Question":{"Ar":"في 40 قياساً، تقع 9 قيم في الفئة الأولى و11 في الثانية و20 في الثالثة. ما التكرار النسبي للفئتين الأولى والثانية مجتمعتين؟","En":"Among forty measurements, nine fall in the first class, eleven in the second, and twenty in the third. What is the combined relative frequency of the first two classes?"},"Options":[{"LatexCode":"\\frac{11}{40}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الفئة الثانية فقط.","En":"Uses only the second class."}},{"LatexCode":"\\frac14","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قسم التكرار المشترك على ضعف العدد الكلي.","En":"Divides the combined count by twice the total."}},{"LatexCode":"\\frac12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"\\frac9{40}","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل الفئة الأولى فقط.","En":"Uses only the first class."}}],"Hints":[{"Ar":"اجمع 9 و11.","En":"Add nine and eleven."},{"Ar":"اقسم على 40.","En":"Divide by forty."}],"Solution":{"Idea":{"Ar":"نجمع تكراري الفئتين ثم نقسم على العدد الكلي.","En":"Add both class counts then divide by the total."},"FormulaLatex":"(9+11)/40","Steps":[{"Ar":"$20/40=1/2$","En":"$20/40=1/2$"}],"Substitution":{"Ar":"$20/40$","En":"$20/40$"},"Result":{"Ar":"$\\frac12$","En":"$\\frac12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$40\\cdot(1/2)=20$","En":"$40\\cdot(1/2)=20$"},"CommonError":{"Ar":"استعمل الفئة الأولى فقط.","En":"Uses only the first class."}}}$mw$::jsonb,$mw$نجمع تكراري الفئتين ثم نقسم على العدد الكلي.

$(9+11)/40$

1. $20/40=1/2$

$20/40$

$\frac12$

$40\cdot(1/2)=20$

استعمل الفئة الأولى فقط.$mw$,$mw$Add both class counts then divide by the total.

$(9+11)/40$

1. $20/40=1/2$

$20/40$

$\frac12$

$40\cdot(1/2)=20$

Uses only the first class.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اجمع 9 و11.","En":"Add nine and eleven."},{"Ar":"اقسم على 40.","En":"Divide by forty."}],"Solution":{"Idea":{"Ar":"نجمع تكراري الفئتين ثم نقسم على العدد الكلي.","En":"Add both class counts then divide by the total."},"FormulaLatex":"(9+11)/40","Steps":[{"Ar":"$20/40=1/2$","En":"$20/40=1/2$"}],"Substitution":{"Ar":"$20/40$","En":"$20/40$"},"Result":{"Ar":"$\\frac12$","En":"$\\frac12$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$40\\cdot(1/2)=20$","En":"$40\\cdot(1/2)=20$"},"CommonError":{"Ar":"استعمل الفئة الأولى فقط.","En":"Uses only the first class."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"استعمل الفئة الثانية فقط.","En":"Uses only the second class."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"قسم التكرار المشترك على ضعف العدد الكلي.","En":"Divides the combined count by twice the total."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل الفئة الأولى فقط.","En":"Uses only the first class."},"Order":4}]}$mw$),
($mw$growth-v67-grade-10-arithmetic-sequence-two-terms-fixed-difference-index-gap-1$mw$,$mw$arithmetic-sequence-two-terms-fixed-difference-index-gap$mw$,$mw$s-sequences-series-arithmetic-sequences$mw$,$mw$grade-10$mw$,10,3,23,104,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":104,"SecondarySkillIds":[],"TrackIds":[10],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"فرق فهرسي من فرق حدين","En":"Index gap from term difference"},"Question":{"Ar":"متتالية حسابية فرقها المشترك 6. إذا كان $a_j-a_i=42$، فما $j-i$؟","En":"An arithmetic sequence has common difference six. If $a_j-a_i=42$, find $j-i$."},"Options":[{"LatexCode":"252","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضرب بدلاً من القسمة.","En":"Multiplies instead of dividing."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق المشترك.","En":"This is the common difference."}},{"LatexCode":"36","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح الفرق المشترك من فرق الحدين.","En":"Subtracts the common difference from the term difference."}}],"Hints":[{"Ar":"اكتب علاقة الفرق بين حدين.","En":"Write the term-difference relation."},{"Ar":"اقسم 42 على 6.","En":"Divide forty-two by six."}],"Solution":{"Idea":{"Ar":"فرق الحدين يساوي الفرق المشترك مضروباً في فرق الفهرسين.","En":"The term difference equals the common difference times the index gap."},"FormulaLatex":"a_j-a_i=(j-i)d","Steps":[{"Ar":"$j-i=7$","En":"$j-i=7$"}],"Substitution":{"Ar":"$42/6$","En":"$42/6$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7\\cdot6=42$","En":"$7\\cdot6=42$"},"CommonError":{"Ar":"هذا الفرق المشترك.","En":"This is the common difference."}}}$mw$::jsonb,$mw$فرق الحدين يساوي الفرق المشترك مضروباً في فرق الفهرسين.

$a_j-a_i=(j-i)d$

1. $j-i=7$

$42/6$

$7$

$7\cdot6=42$

هذا الفرق المشترك.$mw$,$mw$The term difference equals the common difference times the index gap.

$a_j-a_i=(j-i)d$

1. $j-i=7$

$42/6$

$7$

$7\cdot6=42$

This is the common difference.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"اكتب علاقة الفرق بين حدين.","En":"Write the term-difference relation."},{"Ar":"اقسم 42 على 6.","En":"Divide forty-two by six."}],"Solution":{"Idea":{"Ar":"فرق الحدين يساوي الفرق المشترك مضروباً في فرق الفهرسين.","En":"The term difference equals the common difference times the index gap."},"FormulaLatex":"a_j-a_i=(j-i)d","Steps":[{"Ar":"$j-i=7$","En":"$j-i=7$"}],"Substitution":{"Ar":"$42/6$","En":"$42/6$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"","En":""},"Verification":{"Ar":"$7\\cdot6=42$","En":"$7\\cdot6=42$"},"CommonError":{"Ar":"هذا الفرق المشترك.","En":"This is the common difference."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ضرب بدلاً من القسمة.","En":"Multiplies instead of dividing."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"هذا الفرق المشترك.","En":"This is the common difference."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"طرح الفرق المشترك من فرق الحدين.","En":"Subtracts the common difference from the term difference."},"Order":4}]}$mw$);
DO $growth$
DECLARE b record; did bigint; pid int; actor int;
BEGIN
 SELECT d."OwnerUserId" INTO STRICT actor FROM public."CurriculumDraftItems" d JOIN public."Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=1088 AND d."EditorialStatus"='Published' AND d."PublishedProblemId"=1806 AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
 FOR b IN SELECT * FROM growth_batch ORDER BY track,key LOOP
  PERFORM 1 FROM public."LearningTracks" WHERE "Id"=b.track FOR UPDATE;
  IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=b.track AND "Code"=b.track_code AND "StageId"=b.stage AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=b.category AND "StageId"=b.stage) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=b.skill AND s."StableKey"=b.skill_key AND s."StageId"=b.stage AND s."CategoryId"=b.category AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=b.track AND "CategoryId"=b.category) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=b.skill) THEN RAISE EXCEPTION 'Scope changed %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" WHERE "ContentKey"=b.key) OR EXISTS(SELECT 1 FROM public."Problems" q WHERE upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g'))) OR EXISTS(SELECT 1 FROM public."CurriculumDraftItems" q WHERE q."EditorialStatus"<>'Withdrawn' AND q."WizardJson" IS NOT NULL AND (upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')))) THEN RAISE EXCEPTION 'Duplicate %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" q WHERE q."EditorialStatus"<>'Withdrawn' AND (upper(regexp_replace(btrim(q."WizardJson"::jsonb#>>'{Question,Ar}'),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."WizardJson"::jsonb#>>'{Question,En}'),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')))) THEN RAISE EXCEPTION 'Wizard duplicate %',b.key; END IF;
  INSERT INTO public."CurriculumDraftItems"("ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus","WizardJson","OwnerUserId","LastEditorUserId","Revision") VALUES(b.key,b.skill_key,'',(b.wizard->>'DifficultyLevel')::int,'','','',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}','','','[]'::jsonb,'Draft',b.wizard::text,actor,actor,0) RETURNING "Id" INTO did;
  INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(b.wizard#>>'{Title,Ar}',b.wizard#>>'{Title,En}',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}',b.flat_ar,b.flat_en,b.stage,b.category,10,0,0,now(),b.metadata) RETURNING "Id" INTO pid;
  INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(b.wizard->'Options') WITH ORDINALITY AS x(o,ord);
  INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,b.skill,true);
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=b.track;
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of original v67 school depth candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
