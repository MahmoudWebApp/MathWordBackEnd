-- One-time, exact-match reviewed curriculum learning-objectives release.
-- Only already-existing CurriculumSkills rows are updated; no new schema, ID,
-- relationship, problem, answer, attempts, student state, or Premium changes.
-- Run exactly once. The 75-row assertion rolls back all edits on mismatch.
BEGIN;
DO $release$
DECLARE changed int;
BEGIN
  WITH improvements(id,stage_id,category_id,name_ar,name_en,old_ar,old_en,new_ar,new_en) AS (
    VALUES
  (1,1,1,'الجمع ضمن الأعداد الطبيعية','Whole-number addition','جمع الأعداد وفهم القيمة المكانية','Add whole numbers with place-value understanding','يجمع أعداداً طبيعية باستخدام القيمة المكانية، ويفسّر الحمل ويتحقق بالتقدير.','Add whole numbers by place value, explain regrouping and check with estimation.'),
  (2,1,1,'الطرح ضمن الأعداد الطبيعية','Whole-number subtraction','طرح الأعداد في مسائل مباشرة وحياتية','Subtract whole numbers in numerical and contextual problems','يطرح أعداداً طبيعية مع إعادة التجميع ويتحقق بإجراء عملية جمع عكسية.','Subtract whole numbers with regrouping and verify using inverse addition.'),
  (3,1,1,'العمليات الحسابية متعددة الخطوات','Multi-step arithmetic','حل تعبيرات جمع وطرح مترابطة مع ترتيب العمليات','Solve connected addition and subtraction steps','يحل مسألة من خطوتين أو أكثر ويبرر ترتيب عمليات الجمع والطرح.','Solve multi-step arithmetic tasks and justify the order of additions and subtractions.'),
  (4,1,33,'الضرب','Multiplication','فهم الضرب وحساب نواتج بأعداد متدرجة','Understand and calculate products of whole numbers','يمثل الضرب بمجموعات متساوية ويحسب الناتج باستراتيجية مناسبة.','Model multiplication as equal groups and calculate products with a suitable strategy.'),
  (5,1,33,'القسمة','Division','حل مسائل القسمة المباشرة والتحقق من النتائج','Solve direct division problems and verify quotients','يستخدم القسمة لتوزيع كميات متساوية ويتحقق بضرب الناتج في المقسوم عليه.','Use division for equal sharing and verify quotients by multiplication.'),
  (6,1,33,'مسائل الضرب الحياتية','Multiplicative word problems','تحويل مواقف حياتية إلى عملية ضرب صحيحة','Model simple real-world situations using multiplication','يستخرج المعطيات والمطلوب من موقف حياتي ويبني عملية ضرب ويفسّر الناتج.','Identify knowns and the target in word problems, model multiplication and interpret its result.'),
  (7,1,2,'معادلات الجمع والطرح','One-step additive equations','معادلات الجمع والطرح','One-step additive equations','يحدد العدد المجهول في معادلة جمع أو طرح باستخدام العملية العكسية.','Find unknowns in one-step addition or subtraction equations using inverse operations.'),
  (8,1,2,'الأنماط والمتتاليات العددية','Number patterns and sequences','الأنماط والمتتاليات العددية','Number patterns and sequences','يكتشف قاعدة نمط عددي ويكمل المتتالية مع توضيح العلاقة بين حدودها.','Identify number-pattern rules, extend sequences and explain relationships between terms.'),
  (9,1,2,'معادلات الضرب البسيطة','One-step multiplicative equations','معادلات الضرب البسيطة','One-step multiplicative equations','يحل معادلة ضرب بخطوة واحدة باستخدام القسمة والتحقق بالتعويض.','Solve one-step multiplication equations by division and check by substitution.'),
  (10,1,2,'المعادلات ذات الخطوتين','Two-step linear equations','المعادلات ذات الخطوتين','Two-step linear equations','يعزل المتغير في معادلة خطية من خطوتين ويعيد التعويض للتحقق.','Isolate a variable in two-step linear equations and verify by substitution.'),
  (11,1,2,'التعويض في التعابير الجبرية','Substitution in algebraic expressions','التعويض في التعابير الجبرية','Substitution in algebraic expressions','يعوّض قيماً عددية في تعبير جبري ويحسب الناتج حسب ترتيب العمليات.','Substitute numerical values into algebraic expressions and evaluate in the proper order.'),
  (12,1,3,'حساب المحيط','Perimeter calculations','حساب المحيط','Perimeter calculations','يختار قانون محيط الشكل المناسب ويجمع أطوال حدوده مع كتابة وحدة طول.','Select an appropriate perimeter rule, sum boundary lengths and report length units.'),
  (13,1,3,'مساحة المستطيل','Area of rectangles','مساحة المستطيل','Area of rectangles','يطبق مساحة المستطيل = الطول × العرض ويميز وحدات المساحة المربعة.','Apply rectangle area = length × width and distinguish square area units.'),
  (14,1,3,'مساحة المثلث','Area of triangles','مساحة المثلث','Area of triangles','يطبق مساحة المثلث = القاعدة × الارتفاع العمودي ÷ 2 ويحدد الارتفاع الصحيح.','Apply triangle area = base × perpendicular height ÷ 2 and identify the correct height.'),
  (15,1,3,'زوايا المثلث','Angles in triangles','زوايا المثلث','Angles in triangles','يوظف مجموع زوايا المثلث البالغ 180° لإيجاد زوايا مجهولة.','Use the 180° triangle-angle sum to calculate unknown interior angles.'),
  (16,1,3,'التحويل بين وحدات الطول','Length-unit conversions','التحويل بين وحدات الطول','Length-unit conversions','يحوّل بين المتر والسنتيمتر والكيلومتر مع التحقق من عامل التحويل.','Convert between metres, centimetres and kilometres using verified conversion factors.'),
  (17,1,4,'الاحتمال البسيط','Simple probability','الاحتمال البسيط','Simple probability','يحسب احتمال حدث بسيط من النتائج المتساوية الإمكان ويفسر قيمته بين 0 و1.','Find simple probabilities from equally likely outcomes and interpret values from 0 to 1.'),
  (18,1,4,'الوسيط','Median','الوسيط','Median','يرتب القيم ويستخرج الوسيط مع معالجة حالتي العدد الفردي والزوجي.','Sort data and identify the median for both odd-sized and even-sized datasets.'),
  (19,1,4,'المتوسط الحسابي','Arithmetic mean','المتوسط الحسابي','Arithmetic mean','يجمع قيم البيانات ويقسم على عددها لاستخراج المتوسط الحسابي وتفسيره.','Compute the arithmetic mean as sum of values divided by count, and interpret it.'),
  (20,1,4,'المنوال','Mode','المنوال','Mode','يحدد المنوال بوصفه القيمة الأكثر تكراراً ويميز حالات تعدد المنوال.','Identify the most frequent value as the mode and recognise multiple modes.'),
  (21,2,5,'قوانين الأسس','Exponent laws','قوانين الأسس','Exponent laws','يستخدم قوانين ضرب القوى وقسمتها ورفع القوة لقوة مع مراعاة شروط الأسس.','Apply product, quotient and power-of-a-power rules under valid exponent conditions.'),
  (22,2,5,'القاسم المشترك الأكبر','Greatest common divisor','القاسم المشترك الأكبر','Greatest common divisor','يحلل أعداداً إلى عوامل ويجد أكبر قاسم مشترك بينها ويستخدمه في مسألة.','Use factorisation to find the greatest common divisor and apply it to a problem.'),
  (23,2,5,'حساب قيم القوى','Evaluating powers','حساب قيم القوى','Evaluating powers','يحسب قيمة قوة ذات أساس وأس محددين ويفسر الأس بوصفه ضرباً متكرراً.','Evaluate powers with a given base and exponent and explain repeated multiplication.'),
  (24,2,5,'المضاعف المشترك الأصغر','Least common multiple','المضاعف المشترك الأصغر','Least common multiple','يحدد أصغر مضاعف مشترك لأعداد باستخدام المضاعفات أو التحليل إلى عوامل.','Find the least common multiple using multiples or prime-factor decomposition.'),
  (25,2,6,'المعادلات الخطية','Linear equations','المعادلات الخطية','Linear equations','يحل المعادلات الخطية ويحافظ على توازن طرفي المعادلة ويتحقق من الحل.','Solve linear equations using equivalent operations and verify resulting values.'),
  (26,2,6,'قيمة الدالة الخطية','Evaluating linear functions','قيمة الدالة الخطية','Evaluating linear functions','يعوّض في دالة خطية ويحدد قيمة المخرَج ويفسر معدل التغير.','Evaluate linear functions at chosen inputs and interpret the constant rate of change.'),
  (27,2,6,'قيمة الدالة التربيعية','Evaluating quadratic functions','قيمة الدالة التربيعية','Evaluating quadratic functions','يعوّض في دالة تربيعية مع مراعاة الأقواس والأسس والإشارات.','Evaluate quadratic functions while respecting parentheses, powers and signs.'),
  (28,2,6,'حل معادلة من قيمة دالة','Finding inputs from function values','حل معادلة من قيمة دالة','Finding inputs from function values','يعكس خطوات حساب الدالة لإيجاد المدخل الموافق لمخرَج معلوم.','Reverse function operations to find inputs corresponding to specified outputs.'),
  (29,2,6,'ميل المستقيم','Slope of a line','ميل المستقيم','Slope of a line','يحسب ميل خط مستقيم من نقطتين بوصفه التغير الرأسي إلى الأفقي.','Calculate a line''s slope from two points as rise divided by run.'),
  (30,2,7,'النسب وتوزيع الكميات','Ratios and proportional quantities','النسب وتوزيع الكميات','Ratios and proportional quantities','يبسّط النسب ويوزع الكميات وفق أجزاء متناسبة مع الحفاظ على مجموعها.','Simplify ratios and divide quantities in proportion while preserving their total.'),
  (31,2,7,'المعدل والوحدة','Unit rates and proportional pricing','المعدل والوحدة','Unit rates and proportional pricing','يحسب معدل الوحدة ويستخدمه لمقارنة الأسعار والكميات ذات الوحدات المختلفة.','Calculate unit rates to compare prices and quantities with appropriate units.'),
  (32,2,7,'حساب الخصم المئوي','Percentage discounts','حساب الخصم المئوي','Percentage discounts','يحسب قيمة الخصم والناتج بعد الخصم ويميز النسبة من المبلغ النهائي.','Calculate discount amounts and discounted prices, distinguishing rate from final value.'),
  (33,2,7,'مقياس الرسم','Map scales','مقياس الرسم','Map scales','يستخدم مقياس الرسم للتحويل بين أبعاد الخريطة والمسافات الفعلية.','Use a map scale to convert between represented distances and real distances.'),
  (34,2,7,'الزيادة المئوية','Percentage increase','الزيادة المئوية','Percentage increase','يحسب الزيادة المئوية اعتماداً على القيمة الأصلية ويعطي القيمة الجديدة.','Calculate percent increase relative to the original value and determine the new amount.'),
  (35,2,8,'مجموع زوايا المثلث','Triangle angle sum','مجموع زوايا المثلث','Triangle angle sum','يستعمل مجموع الزوايا الداخلية للمثلث 180° لاستخراج زاوية مجهولة.','Use the 180° interior-angle sum to determine a missing triangle angle.'),
  (36,2,8,'مساحة الدائرة','Area of circles','مساحة الدائرة','Area of circles','يطبق مساحة الدائرة = π × نصف القطر² مع التمييز بين القطر ونصف القطر.','Apply circle area = π × radius² and distinguish diameter from radius.'),
  (37,2,34,'نظرية فيثاغورس','Pythagorean theorem','نظرية فيثاغورس','Pythagorean theorem','يطبق في المثلث القائم أ² + ب² = ج² مع تحديد الوتر والتحقق من المعطيات.','Apply a² + b² = c² in right triangles, correctly identifying the hypotenuse.'),
  (38,2,8,'الزوايا المتقابلة بالرأس','Vertically opposite angles','الزوايا المتقابلة بالرأس','Vertically opposite angles','يستخدم تساوي الزوايا المتقابلة بالرأس بعد تقاطع مستقيمين لإيجاد المجهول.','Use equality of vertically opposite angles to find unknown angle measures.'),
  (39,2,8,'زوايا المضلعات','Angles in polygons','زوايا المضلعات','Angles in polygons','يحسب مجموع الزوايا الداخلية لمضلع ويستنتج قياسات الزوايا المطلوبة.','Calculate polygon interior-angle sums and deduce missing angle measures.'),
  (40,2,34,'المثلثات المتشابهة','Similar triangles','المثلثات المتشابهة','Similar triangles','يستدل على تشابه مثلثين ويستخدم تناسب الأضلاع المناظرة.','Establish triangle similarity and use proportional corresponding sides.'),
  (41,3,9,'جذور المعادلة التربيعية','Roots of quadratic equations','جذور المعادلة التربيعية','Roots of quadratic equations','يحل المعادلة التربيعية بالتحليل أو القانون العام ويتحقق بالتعويض.','Solve quadratic equations by factoring or the quadratic formula and verify roots.'),
  (42,3,9,'حساب اللوغاريتمات','Evaluating logarithms','حساب اللوغاريتمات','Evaluating logarithms','يفسر اللوغاريتم بوصفه أساً ويحوّل بين الصيغتين اللوغاريتمية والأسية.','Interpret logarithms as exponents and convert between logarithmic and exponential forms.'),
  (43,3,9,'مجموع وحاصل ضرب الجذور','Sums and products of roots','مجموع وحاصل ضرب الجذور','Sums and products of roots','يستخدم علاقات فييتا لإيجاد مجموع جذري معادلة تربيعية وحاصل ضربهما.','Use Viète''s relations to find the sum and product of quadratic roots.'),
  (44,3,9,'مميز المعادلة التربيعية','Quadratic discriminant','مميز المعادلة التربيعية','Quadratic discriminant','يحسب المميز ب² − 4أج ويستنتج منه عدد الجذور الحقيقية.','Compute the discriminant b² − 4ac and determine the number of real roots.'),
  (45,3,9,'تحليل ثلاثيات الحدود','Factoring quadratics','تحليل ثلاثيات الحدود','Factoring quadratics','يحلل تعبيراً تربيعياً إلى عاملين ويتحقق بإعادة النشر.','Factor quadratic expressions and verify by multiplying the factors.'),
  (46,3,10,'قيم النسب المثلثية للزوايا الخاصة','Trigonometric values at special angles','قيم النسب المثلثية للزوايا الخاصة','Trigonometric values at special angles','يستنتج جيب وجيب تمام وظل الزوايا الخاصة من مثلثات معيارية ودائرة الوحدة.','Evaluate sine, cosine and tangent at special angles using standard triangles or the unit circle.'),
  (47,3,10,'المتطابقات المثلثية الأساسية','Basic trigonometric identities','المتطابقات المثلثية الأساسية','Basic trigonometric identities','يطبق متطابقات مثلثية أساسية لتحويل التعابير والتحقق من تساوي الطرفين.','Apply fundamental trigonometric identities to simplify expressions and verify equivalence.'),
  (48,3,10,'النسب المثلثية في المثلث القائم','Trigonometric ratios in right triangles','النسب المثلثية في المثلث القائم','Trigonometric ratios in right triangles','يختار نسبة الجيب أو جيب التمام أو الظل من أضلاع المثلث القائم ويحسب المجهول.','Select sine, cosine or tangent in a right triangle to find missing sides or angles.'),
  (49,3,11,'اشتقاق كثيرات الحدود','Derivatives of polynomials','اشتقاق كثيرات الحدود','Derivatives of polynomials','يشتق حدود كثيرات الحدود باستخدام قاعدة القوة وقواعد الجمع والثوابت.','Differentiate polynomials using the power, sum and constant rules.'),
  (50,3,11,'التكاملات غير المحددة','Indefinite integrals','التكاملات غير المحددة','Indefinite integrals','يوجد دالة أصلية مع إضافة ثابت التكامل ويتحقق باشتقاقها.','Find antiderivatives including the integration constant and check by differentiation.'),
  (51,3,11,'التكاملات المحددة','Definite integrals','التكاملات المحددة','Definite integrals','يحسب تكاملاً محدداً باستخدام الدالة الأصلية وتقييم الحدين ويشرح إشارة الناتج.','Evaluate definite integrals from antiderivatives and limits, interpreting signed results.'),
  (52,3,12,'احتمالات رمي حجرَي النرد','Two-dice probability','احتمالات رمي حجرَي النرد','Two-dice probability','يبني فضاء نتائج حجرَي نرد ويحسب احتمال حدث بعد عد نتائجه المواتية.','Build the two-dice sample space and compute event probability by counting outcomes.'),
  (53,3,35,'المتوسط الحسابي للبيانات','Arithmetic mean of data','المتوسط الحسابي للبيانات','Arithmetic mean of data','يحسب متوسط مجموعة بيانات ويشرح أثر القيم الكبيرة أو الشاذة فيه.','Compute data means and explain how unusually large or small values affect them.'),
  (54,3,35,'التباين السكاني','Population variance','التباين السكاني','Population variance','يحسب التباين السكاني من متوسط مربعات الانحرافات ويميزه عن الانحراف المعياري.','Calculate population variance as the mean squared deviation and distinguish standard deviation.'),
  (55,3,12,'احتمالات رمي القطعة النقدية','Coin-toss probability','احتمالات رمي القطعة النقدية','Coin-toss probability','يميز الأحداث في رمي قطعة نقدية ويحسب احتمالاتها لنتائج متساوية الإمكان.','Model coin-toss events and calculate probabilities of equally likely outcomes.'),
  (56,3,12,'التوافيق والاختيارات','Combinations and selections','التوافيق والاختيارات','Combinations and selections','يستخدم التوافيق لاختيار عناصر دون ترتيب ويميزها عن التباديل.','Count unordered selections using combinations and distinguish them from permutations.'),
  (57,4,13,'المشتقات الجزئية','Partial derivatives','المشتقات الجزئية','Partial derivatives','يحسب مشتقات جزئية بتثبيت المتغيرات الأخرى ويحدد مجال الدالة.','Compute partial derivatives by holding other variables fixed and checking the domain.'),
  (58,4,13,'التكامل المزدوج','Double integrals','التكامل المزدوج','Double integrals','يقيم تكاملاً مزدوجاً على مجال معطى مع ضبط ترتيب التكامل وحدوده.','Evaluate double integrals over specified regions with correct limits and order.'),
  (59,4,13,'متجه التدرج','Gradient vectors','متجه التدرج','Gradient vectors','يكوّن متجه التدرج من المشتقات الجزئية ويفسر اتجاه الزيادة الأسرع.','Construct the gradient from partial derivatives and interpret steepest increase.'),
  (60,4,13,'المشتقة الاتجاهية','Directional derivatives','المشتقة الاتجاهية','Directional derivatives','يحسب المشتقة الاتجاهية من جداء التدرج مع متجه اتجاه موحّد.','Compute directional derivatives as a gradient dot product with a unit direction.'),
  (61,4,14,'محددات المصفوفات','Matrix determinants','محددات المصفوفات','Matrix determinants','يحسب محدد مصفوفة مربعة ويستخدمه في التحقق من القابلية للعكس عند اللزوم.','Evaluate square-matrix determinants and infer invertibility when appropriate.'),
  (62,4,14,'الاستقلال الخطي','Linear independence','الاستقلال الخطي','Linear independence','يفحص استقلال مجموعة متجهات باستخدام تراكيب خطية أو رتبة مصفوفة.','Test vector-set independence through linear combinations or matrix rank.'),
  (63,4,14,'الضرب القياسي','Dot product','الضرب القياسي','Dot product','يحسب الجداء القياسي لمتجهين ويفسره بالنسبة للزاوية والتعامد.','Compute vector dot products and relate the result to angle and orthogonality.'),
  (64,4,14,'أثر المصفوفة','Matrix trace','أثر المصفوفة','Matrix trace','يجمع عناصر القطر الرئيسي لمصفوفة مربعة ليحدد أثرها.','Calculate the trace of a square matrix as the sum of diagonal entries.'),
  (65,4,14,'ضرب المتجه بعدد','Scalar multiplication of vectors','ضرب المتجه بعدد','Scalar multiplication of vectors','يضرب كل مركبة متجه بعدد ثابت ويفسر أثر الإشارة والمقدار.','Scale each vector component and interpret changes in magnitude and direction.'),
  (66,4,15,'معادلات تفاضلية أُسية','Exponential first-order ODEs','معادلات تفاضلية أُسية','Exponential first-order ODEs','يحل معادلة تفاضلية أولية من نوع تغير يتناسب مع المقدار ويطبق شرط البداية.','Solve basic exponential-growth/decay ODEs and apply given initial conditions.'),
  (67,4,15,'رتبة المعادلة التفاضلية','Order of differential equations','رتبة المعادلة التفاضلية','Order of differential equations','يحدد رتبة المعادلة التفاضلية من أعلى مشتقة ظاهرة فيها.','Identify the order of a differential equation from its highest derivative.'),
  (68,4,15,'حل معادلات تفاضلية بالتكامل','Solving ODEs by integration','حل معادلات تفاضلية بالتكامل','Solving ODEs by integration','يحصل على حل معادلة تفاضلية قابلة للتكامل ويختبره بالتعويض.','Integrate a solvable differential equation and verify by substitution.'),
  (69,4,15,'مسائل ابتدائية من الرتبة الثانية','Second-order initial-value problems','مسائل ابتدائية من الرتبة الثانية','Second-order initial-value problems','يوظف شرطَي البداية لإيجاد ثوابت حل معادلة تفاضلية من الرتبة الثانية.','Use two initial conditions to determine constants in a second-order ODE solution.'),
  (70,4,16,'نهايات الدوال','Limits of functions','نهايات الدوال','Limits of functions','يقوّم نهاية دالة بتحليل سلوكها قرب القيمة ويتحقق من شروط التعويض أو التحليل.','Evaluate a function limit by analysing nearby behaviour and valid algebraic simplification.'),
  (71,4,16,'الاشتقاق والاستمرارية','Differentiability and continuity','الاشتقاق والاستمرارية','Differentiability and continuity','يميز بين استمرارية الدالة وقابلية اشتقاقها ويفسر الحالات الاستثنائية.','Distinguish continuity from differentiability and explain counterexamples.'),
  (72,4,36,'نهايات المتتاليات','Limits of sequences','نهايات المتتاليات','Limits of sequences','يحدد سلوك حدود متتالية عند ازدياد رقم الحد ويفحص وجود نهايتها.','Analyse terms of a sequence as the index grows and establish any limit.'),
  (73,4,16,'نظرية القيمة الوسيطة','Intermediate value theorem','نظرية القيمة الوسيطة','Intermediate value theorem','يستخدم نظرية القيمة الوسيطة ضمن شروط الاستمرارية لإثبات وجود قيمة.','Apply the intermediate value theorem under continuity assumptions to establish existence.'),
  (74,4,36,'تقارب المتتاليات الرتيبة','Monotone sequence convergence','تقارب المتتاليات الرتيبة','Monotone sequence convergence','يفحص رتابة متتالية وحدودها ويطبق مبدأ تقارب المتتالية الرتيبة المحدودة.','Check monotonicity and boundedness to apply the monotone convergence principle.'),
  (75,4,36,'تقارب المتسلسلات','Convergence of series','تقارب المتسلسلات','Convergence of series','يختار اختباراً مناسباً لتقارب سلسلة عددية ويميّز السلسلة عن المتتالية.','Choose and justify an appropriate series-convergence test and distinguish series from sequences.')
  ),
  updated AS (
    UPDATE public."CurriculumSkills" AS s
    SET "DescriptionAr" = i.new_ar, "DescriptionEn" = i.new_en, "IsPublished" = TRUE
    FROM improvements i, public."Categories" c
    WHERE s."Id" = i.id AND s."StageId" = i.stage_id
      AND s."CategoryId" = i.category_id
      AND c."Id" = s."CategoryId" AND c."StageId" = s."StageId"
      AND s."NameAr" = i.name_ar AND s."NameEn" = i.name_en
      AND s."DescriptionAr" = i.old_ar AND s."DescriptionEn" = i.old_en
      AND s."IsPublished" = FALSE
      AND EXISTS (SELECT 1 FROM public."CurriculumProblemSkills" ps
                  WHERE ps."SkillId" = s."Id"
                  GROUP BY ps."SkillId"
                  HAVING COUNT(DISTINCT ps."ProblemId") >= 5)
    RETURNING s."Id"
  )
  SELECT count(*) INTO changed FROM updated;
  IF changed <> 75 THEN
    RAISE EXCEPTION 'Expected exactly 75 verified skill publication updates; got %, aborting', changed;
  END IF;
END
$release$;
COMMIT;
