-- One-time owner-authorized import AND publication from reviewed v15/v16/v18 school waves.
-- Existing skills and tracks only; explicit source keys, no duplicate imports.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v15-grade-11-equal-point-and-line-distance-1$mw$,$mw$equal-point-and-line-distance$mw$,$mw$loci$mw$,$mw$grade-11$mw$,11,3,88,330,$mw${"StageId":3,"CategoryId":88,"PrimarySkillId":330,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"المسافة إلى نقطة وإلى مستقيم","En":"Equidistant from a point and a line"},"Question":{"Ar":"تبعد نقطة $P$ عن النقطة $(0,2)$ بقدر بعدها العمودي عن المستقيم $y=-2$. إذا كان الإحداثي الأفقي لـ $P$ يساوي 4، فما إحداثيها الرأسي؟","En":"Point $P$ is as far from $(0,2)$ as it is perpendicularly from the line $y=-2$. If its horizontal coordinate is 4, what is its vertical coordinate?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى المسافة المشتركة.","En":"Reports the common distance."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أخذ منتصف المسافة الرأسية بين النقطة والمستقيم وأهمل الإزاحة الأفقية.","En":"Takes the vertical halfway mark while ignoring the horizontal offset."}},{"LatexCode":"-2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى إحداثي المستقيم الأفقي.","En":"Reports the height of the horizontal line."}}],"Hints":[{"Ar":"اكتب P على الصورة (4، y) وارسم أقصر قطعة تصلها بالمستقيم الأفقي.","En":"Write P as (4, y) and draw the shortest segment from it to the horizontal line."},{"Ar":"قارن مربّعي المسافتين للتخلص من الجذر والقيمة المطلقة.","En":"Compare the squared distances to eliminate the radical and absolute value."}],"Solution":{"Idea":{"Ar":"نساوي مربعي المسافتين غير السالبتين، إلى النقطة وإلى المستقيم، ثم نحل للإحداثي الرأسي.","En":"Equate the squares of the nonnegative point and line distances, then solve for the vertical coordinate."},"FormulaLatex":"4^2+(y-2)^2=(y+2)^2","Steps":[{"Ar":"مربع المسافة إلى النقطة هو 16 + (y−2)²، ومربع المسافة إلى المستقيم هو (y+2)².","En":"The squared point distance is 16 + (y−2)². The squared line distance is (y+2)²."},{"Ar":"بعد فك التربيع يُحذف y² من الطرفين ويبقى 16 = 8y.","En":"Expanding cancels y² on both sides and leaves 16 = 8y."}],"Substitution":{"Ar":"$16+(y-2)^2=(y+2)^2\\Rightarrow y=2$","En":"$16+(y-2)^2=(y+2)^2\\Rightarrow y=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"وحدة إحداثية","En":"coordinate units"},"Verification":{"Ar":"النقطة (4، 2) تبعد أربع وحدات أفقياً عن (0، 2) وأربع وحدات رأسياً عن المستقيم.","En":"The point (4, 2) is four units horizontally from (0, 2) and four units vertically from the line."},"CommonError":{"Ar":"أعطى المسافة المشتركة.","En":"Reports the common distance."}}}$mw$::jsonb,$mw$نساوي مربعي المسافتين غير السالبتين، إلى النقطة وإلى المستقيم، ثم نحل للإحداثي الرأسي.

$4^2+(y-2)^2=(y+2)^2$

1. مربع المسافة إلى النقطة هو 16 + (y−2)²، ومربع المسافة إلى المستقيم هو (y+2)².

2. بعد فك التربيع يُحذف y² من الطرفين ويبقى 16 = 8y.

$16+(y-2)^2=(y+2)^2\Rightarrow y=2$

$2$ وحدة إحداثية

النقطة (4، 2) تبعد أربع وحدات أفقياً عن (0، 2) وأربع وحدات رأسياً عن المستقيم.

أعطى المسافة المشتركة.$mw$,$mw$Equate the squares of the nonnegative point and line distances, then solve for the vertical coordinate.

$4^2+(y-2)^2=(y+2)^2$

1. The squared point distance is 16 + (y−2)². The squared line distance is (y+2)².

2. Expanding cancels y² on both sides and leaves 16 = 8y.

$16+(y-2)^2=(y+2)^2\Rightarrow y=2$

$2$ coordinate units

The point (4, 2) is four units horizontally from (0, 2) and four units vertically from the line.

Reports the common distance.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"اكتب P على الصورة (4، y) وارسم أقصر قطعة تصلها بالمستقيم الأفقي.","En":"Write P as (4, y) and draw the shortest segment from it to the horizontal line."},{"Ar":"قارن مربّعي المسافتين للتخلص من الجذر والقيمة المطلقة.","En":"Compare the squared distances to eliminate the radical and absolute value."}],"Solution":{"Idea":{"Ar":"نساوي مربعي المسافتين غير السالبتين، إلى النقطة وإلى المستقيم، ثم نحل للإحداثي الرأسي.","En":"Equate the squares of the nonnegative point and line distances, then solve for the vertical coordinate."},"FormulaLatex":"4^2+(y-2)^2=(y+2)^2","Steps":[{"Ar":"مربع المسافة إلى النقطة هو 16 + (y−2)²، ومربع المسافة إلى المستقيم هو (y+2)².","En":"The squared point distance is 16 + (y−2)². The squared line distance is (y+2)²."},{"Ar":"بعد فك التربيع يُحذف y² من الطرفين ويبقى 16 = 8y.","En":"Expanding cancels y² on both sides and leaves 16 = 8y."}],"Substitution":{"Ar":"$16+(y-2)^2=(y+2)^2\\Rightarrow y=2$","En":"$16+(y-2)^2=(y+2)^2\\Rightarrow y=2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"وحدة إحداثية","En":"coordinate units"},"Verification":{"Ar":"النقطة (4، 2) تبعد أربع وحدات أفقياً عن (0، 2) وأربع وحدات رأسياً عن المستقيم.","En":"The point (4, 2) is four units horizontally from (0, 2) and four units vertically from the line."},"CommonError":{"Ar":"أعطى المسافة المشتركة.","En":"Reports the common distance."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أعطى المسافة المشتركة.","En":"Reports the common distance."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أخذ منتصف المسافة الرأسية بين النقطة والمستقيم وأهمل الإزاحة الأفقية.","En":"Takes the vertical halfway mark while ignoring the horizontal offset."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى إحداثي المستقيم الأفقي.","En":"Reports the height of the horizontal line."},"Order":4}]}$mw$),
($mw$growth-v15-grade-11-choose-nonadjacent-display-spaces-1$mw$,$mw$choose-nonadjacent-display-spaces$mw$,$mw$secondary-combinations$mw$,$mw$grade-11$mw$,11,3,12,56,$mw${"StageId":3,"CategoryId":12,"PrimarySkillId":56,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"ثلاث لوحات تفصلها فراغات","En":"Three panels with separating gaps"},"Question":{"Ar":"في صف مستقيم سبعة مواضع مرقّمة من 1 إلى 7. نختار ثلاثة مواضع للوحات متطابقة بحيث لا يتجاور موضعان مختاران. كم مجموعة مواضع تحقق الشرط؟","En":"Seven spaces numbered 1 through 7 form a straight row. Three spaces are chosen for identical panels, with no two chosen spaces adjacent. How many sets of spaces are possible?"},"Options":[{"LatexCode":"35","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اختار ثلاثة مواضع من السبعة من دون شرط الفصل.","En":"Chooses any three spaces out of seven."}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب ترتيباً متناوباً واحداً فقط.","En":"Counts just one alternating arrangement."}},{"LatexCode":"10","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ميّز بين اللوحات الثلاث فعدّ تبديلاتها.","En":"Labels the three identical panels and counts their permutations."}}],"Hints":[{"Ar":"رتّب الفراغات الأربعة أولاً، وتخيّل أين يمكن إدخال اللوحات بينها وعند الطرفين.","En":"Arrange the four unused spaces first. Consider where a panel can be inserted between them or at the ends."},{"Ar":"هل يمكن وضع لوحتين في الفجوة نفسها؟ احسب عدد الفجوات المتاحة.","En":"Can two panels occupy the same gap? Count the available gaps."}],"Solution":{"Idea":{"Ar":"نختار ثلاث فجوات مختلفة حول أربعة مواضع فارغة، فيتحقق شرط عدم التجاور تلقائياً.","En":"Choose three distinct insertion gaps around the four unchosen spaces, ensuring no adjacent selections."},"FormulaLatex":"\\binom{n-k+1}{k}","Steps":[{"Ar":"للفراغات الأربعة ثلاث فجوات داخلية وطرفان، أي خمسة أماكن ممكنة لإدخال لوحة.","En":"The four unused spaces have three interior gaps and two ends, giving five slots for a panel."},{"Ar":"كل اختيار لثلاث فجوات من الخمس يحدد ترتيباً صالحاً واحداً، والعكس صحيح.","En":"Each choice of three of the five slots defines one valid row, and every valid row arises this way."}],"Substitution":{"Ar":"$\\binom{5}{3}=10$","En":"$\\binom{5}{3}=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"مجموعات مواضع","En":"sets of spaces"},"Verification":{"Ar":"إذا بدأ الاختيار في الموضع 1 فهناك ستة إكمالات، وفي 2 ثلاثة، وفي 3 إكمال واحد؛ ومجموعها عشرة.","En":"Starting at 1 allows six completions, starting at 2 allows three, and starting at 3 allows one, for a total of ten."},"CommonError":{"Ar":"اختار ثلاثة مواضع من السبعة من دون شرط الفصل.","En":"Chooses any three spaces out of seven."}}}$mw$::jsonb,$mw$نختار ثلاث فجوات مختلفة حول أربعة مواضع فارغة، فيتحقق شرط عدم التجاور تلقائياً.

$\binom{n-k+1}{k}$

1. للفراغات الأربعة ثلاث فجوات داخلية وطرفان، أي خمسة أماكن ممكنة لإدخال لوحة.

2. كل اختيار لثلاث فجوات من الخمس يحدد ترتيباً صالحاً واحداً، والعكس صحيح.

$\binom{5}{3}=10$

$10$ مجموعات مواضع

إذا بدأ الاختيار في الموضع 1 فهناك ستة إكمالات، وفي 2 ثلاثة، وفي 3 إكمال واحد؛ ومجموعها عشرة.

اختار ثلاثة مواضع من السبعة من دون شرط الفصل.$mw$,$mw$Choose three distinct insertion gaps around the four unchosen spaces, ensuring no adjacent selections.

$\binom{n-k+1}{k}$

1. The four unused spaces have three interior gaps and two ends, giving five slots for a panel.

2. Each choice of three of the five slots defines one valid row, and every valid row arises this way.

$\binom{5}{3}=10$

$10$ sets of spaces

Starting at 1 allows six completions, starting at 2 allows three, and starting at 3 allows one, for a total of ten.

Chooses any three spaces out of seven.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"رتّب الفراغات الأربعة أولاً، وتخيّل أين يمكن إدخال اللوحات بينها وعند الطرفين.","En":"Arrange the four unused spaces first. Consider where a panel can be inserted between them or at the ends."},{"Ar":"هل يمكن وضع لوحتين في الفجوة نفسها؟ احسب عدد الفجوات المتاحة.","En":"Can two panels occupy the same gap? Count the available gaps."}],"Solution":{"Idea":{"Ar":"نختار ثلاث فجوات مختلفة حول أربعة مواضع فارغة، فيتحقق شرط عدم التجاور تلقائياً.","En":"Choose three distinct insertion gaps around the four unchosen spaces, ensuring no adjacent selections."},"FormulaLatex":"\\binom{n-k+1}{k}","Steps":[{"Ar":"للفراغات الأربعة ثلاث فجوات داخلية وطرفان، أي خمسة أماكن ممكنة لإدخال لوحة.","En":"The four unused spaces have three interior gaps and two ends, giving five slots for a panel."},{"Ar":"كل اختيار لثلاث فجوات من الخمس يحدد ترتيباً صالحاً واحداً، والعكس صحيح.","En":"Each choice of three of the five slots defines one valid row, and every valid row arises this way."}],"Substitution":{"Ar":"$\\binom{5}{3}=10$","En":"$\\binom{5}{3}=10$"},"Result":{"Ar":"$10$","En":"$10$"},"Unit":{"Ar":"مجموعات مواضع","En":"sets of spaces"},"Verification":{"Ar":"إذا بدأ الاختيار في الموضع 1 فهناك ستة إكمالات، وفي 2 ثلاثة، وفي 3 إكمال واحد؛ ومجموعها عشرة.","En":"Starting at 1 allows six completions, starting at 2 allows three, and starting at 3 allows one, for a total of ten."},"CommonError":{"Ar":"اختار ثلاثة مواضع من السبعة من دون شرط الفصل.","En":"Chooses any three spaces out of seven."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"اختار ثلاثة مواضع من السبعة من دون شرط الفصل.","En":"Chooses any three spaces out of seven."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب ترتيباً متناوباً واحداً فقط.","En":"Counts just one alternating arrangement."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"ميّز بين اللوحات الثلاث فعدّ تبديلاتها.","En":"Labels the three identical panels and counts their permutations."},"Order":4}]}$mw$),
($mw$growth-v15-grade-11-pool-variance-with-separated-group-means-1$mw$,$mw$pool-variance-with-separated-group-means$mw$,$mw$secondary-population-variance$mw$,$mw$grade-11$mw$,11,3,35,54,$mw${"StageId":3,"CategoryId":35,"PrimarySkillId":54,"SecondarySkillIds":[],"TrackIds":[11],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"تباين مجموعتين بعد دمجهما","En":"Variance after pooling two groups"},"Question":{"Ar":"لفوجين متساويي العدد أزمنة إنجاز مقاسة بالدقائق. متوسط الفوج الأول 10 ومتوسط الثاني 14، وتباين المجتمع داخل كل فوج 5 دقائق مربعة. ما تباين المجتمع لجميع الأزمنة مجتمعة؟","En":"Two equally large groups record completion times in minutes. Their means are 10 and 14. Within each group the population variance is 5 square minutes. What is the population variance of all the times pooled together?"},"Options":[{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تجاهل اختلاف المتوسطين.","En":"Ignores the separation of the means."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب تباين متوسطي الفوجين وحدهما.","En":"Uses only the variance of the two group means."}},{"LatexCode":"21","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف مربع الفرق الكامل بين المتوسطين إلى التباين الداخلي.","En":"Adds the square of the full gap between group means to the within-group variance."}},{"LatexCode":"9","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب المتوسط المشترك أولاً. ما بعد متوسط كل فوج عنه؟","En":"Find the pooled mean first. How far is each group mean from it?"},{"Ar":"احسب متوسط مربعات الانحرافات داخل الأفواج، ثم أضف متوسط مربعات انحراف متوسطيهما عن المتوسط المشترك.","En":"Take the mean within-group variance, then add the mean squared displacement of the group means from the pooled mean."}],"Solution":{"Idea":{"Ar":"يشمل التباين الكلي التشتت داخل المجموعات وتشتت متوسطات المجموعات حول المتوسط العام.","En":"Pooled variance combines within-group variation and variation of group means about the overall mean."},"FormulaLatex":"V=\\tfrac12\\sum_{j=1}^{2}[V_j+(m_j-m)^2]","Steps":[{"Ar":"لتساوي العددين يكون المتوسط المشترك 12، ويبعد متوسطا الفوجين عنه بمقدار دقيقتين.","En":"Equal group sizes give a pooled mean of 12. Each group mean differs from it by two minutes."},{"Ar":"يسهم التشتت الداخلي بخمس دقائق مربعة، واختلاف المتوسطين بأربع دقائق مربعة أخرى.","En":"Within-group spread contributes five square minutes, and the displaced group means contribute four more."}],"Substitution":{"Ar":"$5+(2)^2=9$","En":"$5+(2)^2=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"دقائق مربعة","En":"square minutes"},"Verification":{"Ar":"متوسط مربعات الأزمنة يساوي متوسط 105 و201، أي 153. وبطرح مربع المتوسط المشترك 144 نحصل على 9.","En":"The mean square time is the average of 105 and 201, or 153. Subtracting the squared pooled mean of 144 gives 9."},"CommonError":{"Ar":"تجاهل اختلاف المتوسطين.","En":"Ignores the separation of the means."}}}$mw$::jsonb,$mw$يشمل التباين الكلي التشتت داخل المجموعات وتشتت متوسطات المجموعات حول المتوسط العام.

$V=\tfrac12\sum_{j=1}^{2}[V_j+(m_j-m)^2]$

1. لتساوي العددين يكون المتوسط المشترك 12، ويبعد متوسطا الفوجين عنه بمقدار دقيقتين.

2. يسهم التشتت الداخلي بخمس دقائق مربعة، واختلاف المتوسطين بأربع دقائق مربعة أخرى.

$5+(2)^2=9$

$9$ دقائق مربعة

متوسط مربعات الأزمنة يساوي متوسط 105 و201، أي 153. وبطرح مربع المتوسط المشترك 144 نحصل على 9.

تجاهل اختلاف المتوسطين.$mw$,$mw$Pooled variance combines within-group variation and variation of group means about the overall mean.

$V=\tfrac12\sum_{j=1}^{2}[V_j+(m_j-m)^2]$

1. Equal group sizes give a pooled mean of 12. Each group mean differs from it by two minutes.

2. Within-group spread contributes five square minutes, and the displaced group means contribute four more.

$5+(2)^2=9$

$9$ square minutes

The mean square time is the average of 105 and 201, or 153. Subtracting the squared pooled mean of 144 gives 9.

Ignores the separation of the means.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"احسب المتوسط المشترك أولاً. ما بعد متوسط كل فوج عنه؟","En":"Find the pooled mean first. How far is each group mean from it?"},{"Ar":"احسب متوسط مربعات الانحرافات داخل الأفواج، ثم أضف متوسط مربعات انحراف متوسطيهما عن المتوسط المشترك.","En":"Take the mean within-group variance, then add the mean squared displacement of the group means from the pooled mean."}],"Solution":{"Idea":{"Ar":"يشمل التباين الكلي التشتت داخل المجموعات وتشتت متوسطات المجموعات حول المتوسط العام.","En":"Pooled variance combines within-group variation and variation of group means about the overall mean."},"FormulaLatex":"V=\\tfrac12\\sum_{j=1}^{2}[V_j+(m_j-m)^2]","Steps":[{"Ar":"لتساوي العددين يكون المتوسط المشترك 12، ويبعد متوسطا الفوجين عنه بمقدار دقيقتين.","En":"Equal group sizes give a pooled mean of 12. Each group mean differs from it by two minutes."},{"Ar":"يسهم التشتت الداخلي بخمس دقائق مربعة، واختلاف المتوسطين بأربع دقائق مربعة أخرى.","En":"Within-group spread contributes five square minutes, and the displaced group means contribute four more."}],"Substitution":{"Ar":"$5+(2)^2=9$","En":"$5+(2)^2=9$"},"Result":{"Ar":"$9$","En":"$9$"},"Unit":{"Ar":"دقائق مربعة","En":"square minutes"},"Verification":{"Ar":"متوسط مربعات الأزمنة يساوي متوسط 105 و201، أي 153. وبطرح مربع المتوسط المشترك 144 نحصل على 9.","En":"The mean square time is the average of 105 and 201, or 153. Subtracting the squared pooled mean of 144 gives 9."},"CommonError":{"Ar":"تجاهل اختلاف المتوسطين.","En":"Ignores the separation of the means."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"تجاهل اختلاف المتوسطين.","En":"Ignores the separation of the means."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب تباين متوسطي الفوجين وحدهما.","En":"Uses only the variance of the two group means."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أضاف مربع الفرق الكامل بين المتوسطين إلى التباين الداخلي.","En":"Adds the square of the full gap between group means to the within-group variance."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v15-grade-12-integrate-periods-and-a-shifted-remainder-1$mw$,$mw$integrate-periods-and-a-shifted-remainder$mw$,$mw$secondary-definite-integrals$mw$,$mw$grade-12$mw$,12,3,11,51,$mw${"StageId":3,"CategoryId":11,"PrimarySkillId":51,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"فترات كاملة وجزء من فترة","En":"Full periods and a leftover interval"},"Question":{"Ar":"معدل التدفق $q(t)$ باللتر في الساعة دوريّ بفترة 3 ساعات. يمرّ 8 لترات في الساعات الثلاث الأولى ولتران في الساعة الأولى. كم لتراً يمرّ من الزمن $t=3$ إلى $t=10$ ساعات؟","En":"A flow rate $q(t)$ in litres per hour is periodic with period 3 hours. Eight litres pass during the first three hours and two litres during the first hour. How many litres pass from $t=3$ to $t=10$ hours?"},"Options":[{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب الدورتين الكاملتين فقط.","En":"Counts only the two complete cycles."}},{"LatexCode":"18","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بدأ القياس من الزمن صفر.","En":"Starts measuring at time zero."}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ الساعة المتبقية دورة كاملة ثالثة.","En":"Treats the extra hour as a third full cycle."}}],"Hints":[{"Ar":"قسّم فترة القياس عند الأزمنة التي تبدأ فيها دورة جديدة.","En":"Split the measured interval at times when a new cycle begins."},{"Ar":"قارن الساعة من 9 إلى 10 بالساعة من 0 إلى 1.","En":"Compare the hour from 9 to 10 with the hour from 0 to 1."}],"Solution":{"Idea":{"Ar":"دورية المعدل تجعل التكامل على كل فترة كاملة متساوياً، وكذلك الأجزاء المتناظرة من الدورات.","En":"Periodicity gives equal integrals over complete periods and matching partial periods."},"FormulaLatex":"q(t+3)=q(t)\\Rightarrow\\int_a^b q(t)\\,dt=\\int_{a+3}^{b+3} q(t)\\,dt","Steps":[{"Ar":"الفترتان من 3 إلى 6 ومن 6 إلى 9 دورتان كاملتان، فتسهمان بمجموع 16 لتراً.","En":"The intervals from 3 to 6 and 6 to 9 are complete cycles, contributing 16 litres together."},{"Ar":"الفترة من 9 إلى 10 نسخة من الساعة الأولى، فتسهم بلترين.","En":"The interval from 9 to 10 repeats the first hour and contributes two litres."}],"Substitution":{"Ar":"$2(8)+2=18$","En":"$2(8)+2=18$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"لتراً","En":"litres"},"Verification":{"Ar":"يمرّ 26 لتراً بين 0 و10 في ثلاث دورات وساعة إضافية. بحذف أول ثمانية لترات نحصل على 18.","En":"From 0 to 10, three cycles and an extra hour give 26 litres. Removing the first eight leaves 18."},"CommonError":{"Ar":"حسب الدورتين الكاملتين فقط.","En":"Counts only the two complete cycles."}}}$mw$::jsonb,$mw$دورية المعدل تجعل التكامل على كل فترة كاملة متساوياً، وكذلك الأجزاء المتناظرة من الدورات.

$q(t+3)=q(t)\Rightarrow\int_a^b q(t)\,dt=\int_{a+3}^{b+3} q(t)\,dt$

1. الفترتان من 3 إلى 6 ومن 6 إلى 9 دورتان كاملتان، فتسهمان بمجموع 16 لتراً.

2. الفترة من 9 إلى 10 نسخة من الساعة الأولى، فتسهم بلترين.

$2(8)+2=18$

$18$ لتراً

يمرّ 26 لتراً بين 0 و10 في ثلاث دورات وساعة إضافية. بحذف أول ثمانية لترات نحصل على 18.

حسب الدورتين الكاملتين فقط.$mw$,$mw$Periodicity gives equal integrals over complete periods and matching partial periods.

$q(t+3)=q(t)\Rightarrow\int_a^b q(t)\,dt=\int_{a+3}^{b+3} q(t)\,dt$

1. The intervals from 3 to 6 and 6 to 9 are complete cycles, contributing 16 litres together.

2. The interval from 9 to 10 repeats the first hour and contributes two litres.

$2(8)+2=18$

$18$ litres

From 0 to 10, three cycles and an extra hour give 26 litres. Removing the first eight leaves 18.

Counts only the two complete cycles.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"قسّم فترة القياس عند الأزمنة التي تبدأ فيها دورة جديدة.","En":"Split the measured interval at times when a new cycle begins."},{"Ar":"قارن الساعة من 9 إلى 10 بالساعة من 0 إلى 1.","En":"Compare the hour from 9 to 10 with the hour from 0 to 1."}],"Solution":{"Idea":{"Ar":"دورية المعدل تجعل التكامل على كل فترة كاملة متساوياً، وكذلك الأجزاء المتناظرة من الدورات.","En":"Periodicity gives equal integrals over complete periods and matching partial periods."},"FormulaLatex":"q(t+3)=q(t)\\Rightarrow\\int_a^b q(t)\\,dt=\\int_{a+3}^{b+3} q(t)\\,dt","Steps":[{"Ar":"الفترتان من 3 إلى 6 ومن 6 إلى 9 دورتان كاملتان، فتسهمان بمجموع 16 لتراً.","En":"The intervals from 3 to 6 and 6 to 9 are complete cycles, contributing 16 litres together."},{"Ar":"الفترة من 9 إلى 10 نسخة من الساعة الأولى، فتسهم بلترين.","En":"The interval from 9 to 10 repeats the first hour and contributes two litres."}],"Substitution":{"Ar":"$2(8)+2=18$","En":"$2(8)+2=18$"},"Result":{"Ar":"$18$","En":"$18$"},"Unit":{"Ar":"لتراً","En":"litres"},"Verification":{"Ar":"يمرّ 26 لتراً بين 0 و10 في ثلاث دورات وساعة إضافية. بحذف أول ثمانية لترات نحصل على 18.","En":"From 0 to 10, three cycles and an extra hour give 26 litres. Removing the first eight leaves 18."},"CommonError":{"Ar":"حسب الدورتين الكاملتين فقط.","En":"Counts only the two complete cycles."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب الدورتين الكاملتين فقط.","En":"Counts only the two complete cycles."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"بدأ القياس من الزمن صفر.","En":"Starts measuring at time zero."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدّ الساعة المتبقية دورة كاملة ثالثة.","En":"Treats the extra hour as a third full cycle."},"Order":4}]}$mw$),
($mw$growth-v15-grade-12-squared-trig-difference-from-sum-1$mw$,$mw$squared-trig-difference-from-sum$mw$,$mw$secondary-pythagorean-trig-identity$mw$,$mw$grade-12$mw$,12,3,10,47,$mw${"StageId":3,"CategoryId":10,"PrimarySkillId":47,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"مربع فرق الجيب وجيب التمام","En":"Squared difference of sine and cosine"},"Question":{"Ar":"لزاوية $\\theta$ نعلم أن $\\sin\\theta+\\cos\\theta=1.4$. ما قيمة $(\\sin\\theta-\\cos\\theta)^2$ دون إيجاد قياس الزاوية؟","En":"For an angle $\\theta$, $\\sin\\theta+\\cos\\theta=1.4$. What is $(\\sin\\theta-\\cos\\theta)^2$ without finding the angle?"},"Options":[{"LatexCode":"1.96","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ربّع المجموع المعطى ولم يحسب مربع الفرق.","En":"Squares the given sum and stops."}},{"LatexCode":"0.2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى القيمة المطلقة للفرق قبل التربيع.","En":"Reports the absolute difference before squaring."}},{"LatexCode":"0.04","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"0.96","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب ضعف حاصل ضرب الجيب وجيب التمام.","En":"Calculates twice the product of sine and cosine."}}],"Hints":[{"Ar":"وسّع مربّع المجموع ومربّع الفرق. أي حدين يتلاشيان عند جمع العبارتين؟","En":"Expand the squared sum and the squared difference. Which terms cancel when you add the expansions?"},{"Ar":"استعمل أن مجموع مربّعي الجيب وجيب التمام يساوي واحداً.","En":"Use the fact that the squares of sine and cosine sum to one."}],"Solution":{"Idea":{"Ar":"مجموع مربعي مجموع الجيب وجيب التمام وفرقِهما يساوي ضعف مجموع مربعيهما.","En":"The sum of the squared sum and squared difference of sine and cosine is twice their sum of squares."},"FormulaLatex":"(\\sin\\theta+\\cos\\theta)^2+(\\sin\\theta-\\cos\\theta)^2=2","Steps":[{"Ar":"بجمع المربعين يزول الحدّان المتقابلان 2sc و−2sc، ويصبح المجموع 2.","En":"Adding the two expansions cancels 2sc and −2sc, giving a total of 2."},{"Ar":"مربع المجموع المعطى هو 1.96، فنطرحه من 2.","En":"The given sum squares to 1.96, which we subtract from 2."}],"Substitution":{"Ar":"$2-1.4^2=0.04$","En":"$2-1.4^2=0.04$"},"Result":{"Ar":"$0.04$","En":"$0.04$"},"Unit":{"Ar":"بلا وحدة","En":"unitless"},"Verification":{"Ar":"العددان 0.6 و0.8 يحققان مجموع المربعين 1 والمجموع 1.4، ومربع فرقهما 0.04 بأي ترتيب.","En":"The values 0.6 and 0.8 have sum of squares 0.36 + 0.64 = 1 and sum 1.4. In either order their difference squares to 0.04."},"CommonError":{"Ar":"ربّع المجموع المعطى ولم يحسب مربع الفرق.","En":"Squares the given sum and stops."}}}$mw$::jsonb,$mw$مجموع مربعي مجموع الجيب وجيب التمام وفرقِهما يساوي ضعف مجموع مربعيهما.

$(\sin\theta+\cos\theta)^2+(\sin\theta-\cos\theta)^2=2$

1. بجمع المربعين يزول الحدّان المتقابلان 2sc و−2sc، ويصبح المجموع 2.

2. مربع المجموع المعطى هو 1.96، فنطرحه من 2.

$2-1.4^2=0.04$

$0.04$ بلا وحدة

العددان 0.6 و0.8 يحققان مجموع المربعين 1 والمجموع 1.4، ومربع فرقهما 0.04 بأي ترتيب.

ربّع المجموع المعطى ولم يحسب مربع الفرق.$mw$,$mw$The sum of the squared sum and squared difference of sine and cosine is twice their sum of squares.

$(\sin\theta+\cos\theta)^2+(\sin\theta-\cos\theta)^2=2$

1. Adding the two expansions cancels 2sc and −2sc, giving a total of 2.

2. The given sum squares to 1.96, which we subtract from 2.

$2-1.4^2=0.04$

$0.04$ unitless

The values 0.6 and 0.8 have sum of squares 0.36 + 0.64 = 1 and sum 1.4. In either order their difference squares to 0.04.

Squares the given sum and stops.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"وسّع مربّع المجموع ومربّع الفرق. أي حدين يتلاشيان عند جمع العبارتين؟","En":"Expand the squared sum and the squared difference. Which terms cancel when you add the expansions?"},{"Ar":"استعمل أن مجموع مربّعي الجيب وجيب التمام يساوي واحداً.","En":"Use the fact that the squares of sine and cosine sum to one."}],"Solution":{"Idea":{"Ar":"مجموع مربعي مجموع الجيب وجيب التمام وفرقِهما يساوي ضعف مجموع مربعيهما.","En":"The sum of the squared sum and squared difference of sine and cosine is twice their sum of squares."},"FormulaLatex":"(\\sin\\theta+\\cos\\theta)^2+(\\sin\\theta-\\cos\\theta)^2=2","Steps":[{"Ar":"بجمع المربعين يزول الحدّان المتقابلان 2sc و−2sc، ويصبح المجموع 2.","En":"Adding the two expansions cancels 2sc and −2sc, giving a total of 2."},{"Ar":"مربع المجموع المعطى هو 1.96، فنطرحه من 2.","En":"The given sum squares to 1.96, which we subtract from 2."}],"Substitution":{"Ar":"$2-1.4^2=0.04$","En":"$2-1.4^2=0.04$"},"Result":{"Ar":"$0.04$","En":"$0.04$"},"Unit":{"Ar":"بلا وحدة","En":"unitless"},"Verification":{"Ar":"العددان 0.6 و0.8 يحققان مجموع المربعين 1 والمجموع 1.4، ومربع فرقهما 0.04 بأي ترتيب.","En":"The values 0.6 and 0.8 have sum of squares 0.36 + 0.64 = 1 and sum 1.4. In either order their difference squares to 0.04."},"CommonError":{"Ar":"ربّع المجموع المعطى ولم يحسب مربع الفرق.","En":"Squares the given sum and stops."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"ربّع المجموع المعطى ولم يحسب مربع الفرق.","En":"Squares the given sum and stops."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى القيمة المطلقة للفرق قبل التربيع.","En":"Reports the absolute difference before squaring."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"حسب ضعف حاصل ضرب الجيب وجيب التمام.","En":"Calculates twice the product of sine and cosine."},"Order":4}]}$mw$),
($mw$growth-v15-grade-12-least-terms-for-geometric-tail-tolerance-1$mw$,$mw$least-terms-for-geometric-tail-tolerance$mw$,$mw$s-sequences-series-series-convergence$mw$,$mw$grade-12$mw$,12,3,23,113,$mw${"StageId":3,"CategoryId":23,"PrimarySkillId":113,"SecondarySkillIds":[],"TrackIds":[12],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"متى يصغر ذيل المتسلسلة؟","En":"When is the remaining tail small enough?"},"Question":{"Ar":"يتحرك روبوت 48 متراً في خطوته الأولى، ثم يقطع في كل خطوة نصف مسافة السابقة، ويستمر هكذا. ما أقل عدد من الخطوات المكتملة يجعل مجموع مسافات جميع الخطوات المتبقية أقل من 4 أمتار؟","En":"A robot travels 48 metres on its first move and half the previous distance on each later move, continuing indefinitely. After how many completed moves, at minimum, is the sum of all remaining travel less than 4 metres?"},"Options":[{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اكتفى بالتأكد من أن الخطوة التالية وحدها أقصر من أربعة أمتار.","En":"Checks only that the next single move is shorter than four metres."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف خطوة أخرى بعد تحقق الشرط.","En":"Adds a move after the threshold has already been crossed."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد الأمتار المتبقية عند تحقق الشرط.","En":"Reports the metres remaining at the first qualifying stop."}},{"LatexCode":"5","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"المطلوب هو مجموع ذيل المتسلسلة كله. حدِّد أول حدّ في الذيل بعد n خطوات.","En":"You need the entire remaining tail. Identify its first term after n moves."},{"Ar":"اقسم أول حد متبقٍّ على واحد ناقص النسبة لإيجاد مجموع المسافات المتبقية.","En":"Divide the first remaining term by one minus the ratio to find the remaining distance."}],"Solution":{"Idea":{"Ar":"نحسب مجموع الذيل الهندسي المتناقص بعد عدد من الخطوات، ونبحث عن أول عدد يحقق الحد الصارم.","En":"Find the decreasing geometric tail after completed moves and the first integer satisfying the strict bound."},"FormulaLatex":"R_n=\\frac{48(1/2)^n}{1-1/2}=\\frac{96}{2^n},\\quad n\\in\\mathbb{Z}_{\\ge0}","Steps":[{"Ar":"بعد n خطوات تكون المسافة المتبقية 96 مقسومة على 2ⁿ متر.","En":"After n moves the remaining distance in metres is 96 divided by 2ⁿ."},{"Ar":"تبقى ستة أمتار بعد أربع خطوات وثلاثة أمتار بعد خمس؛ والذيل يتناقص مع كل خطوة.","En":"Six metres remain after four moves and three after five. The tail decreases at each move."}],"Substitution":{"Ar":"$96/2^4=6,\\quad 96/2^5=3<4$","En":"$96/2^4=6,\\quad 96/2^5=3<4$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"خطوات","En":"moves"},"Verification":{"Ar":"مجموع الرحلة 96 م. بعد أربع خطوات قطع الروبوت 90 م وبعد خمس قطع 93 م، فيعبر الحد المطلوب في الخامسة.","En":"Total travel is 96 m. The first four moves cover 90 m and the first five cover 93 m, so the threshold is crossed on move five."},"CommonError":{"Ar":"اكتفى بالتأكد من أن الخطوة التالية وحدها أقصر من أربعة أمتار.","En":"Checks only that the next single move is shorter than four metres."}}}$mw$::jsonb,$mw$نحسب مجموع الذيل الهندسي المتناقص بعد عدد من الخطوات، ونبحث عن أول عدد يحقق الحد الصارم.

$R_n=\frac{48(1/2)^n}{1-1/2}=\frac{96}{2^n},\quad n\in\mathbb{Z}_{\ge0}$

1. بعد n خطوات تكون المسافة المتبقية 96 مقسومة على 2ⁿ متر.

2. تبقى ستة أمتار بعد أربع خطوات وثلاثة أمتار بعد خمس؛ والذيل يتناقص مع كل خطوة.

$96/2^4=6,\quad 96/2^5=3<4$

$5$ خطوات

مجموع الرحلة 96 م. بعد أربع خطوات قطع الروبوت 90 م وبعد خمس قطع 93 م، فيعبر الحد المطلوب في الخامسة.

اكتفى بالتأكد من أن الخطوة التالية وحدها أقصر من أربعة أمتار.$mw$,$mw$Find the decreasing geometric tail after completed moves and the first integer satisfying the strict bound.

$R_n=\frac{48(1/2)^n}{1-1/2}=\frac{96}{2^n},\quad n\in\mathbb{Z}_{\ge0}$

1. After n moves the remaining distance in metres is 96 divided by 2ⁿ.

2. Six metres remain after four moves and three after five. The tail decreases at each move.

$96/2^4=6,\quad 96/2^5=3<4$

$5$ moves

Total travel is 96 m. The first four moves cover 90 m and the first five cover 93 m, so the threshold is crossed on move five.

Checks only that the next single move is shorter than four metres.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"المطلوب هو مجموع ذيل المتسلسلة كله. حدِّد أول حدّ في الذيل بعد n خطوات.","En":"You need the entire remaining tail. Identify its first term after n moves."},{"Ar":"اقسم أول حد متبقٍّ على واحد ناقص النسبة لإيجاد مجموع المسافات المتبقية.","En":"Divide the first remaining term by one minus the ratio to find the remaining distance."}],"Solution":{"Idea":{"Ar":"نحسب مجموع الذيل الهندسي المتناقص بعد عدد من الخطوات، ونبحث عن أول عدد يحقق الحد الصارم.","En":"Find the decreasing geometric tail after completed moves and the first integer satisfying the strict bound."},"FormulaLatex":"R_n=\\frac{48(1/2)^n}{1-1/2}=\\frac{96}{2^n},\\quad n\\in\\mathbb{Z}_{\\ge0}","Steps":[{"Ar":"بعد n خطوات تكون المسافة المتبقية 96 مقسومة على 2ⁿ متر.","En":"After n moves the remaining distance in metres is 96 divided by 2ⁿ."},{"Ar":"تبقى ستة أمتار بعد أربع خطوات وثلاثة أمتار بعد خمس؛ والذيل يتناقص مع كل خطوة.","En":"Six metres remain after four moves and three after five. The tail decreases at each move."}],"Substitution":{"Ar":"$96/2^4=6,\\quad 96/2^5=3<4$","En":"$96/2^4=6,\\quad 96/2^5=3<4$"},"Result":{"Ar":"$5$","En":"$5$"},"Unit":{"Ar":"خطوات","En":"moves"},"Verification":{"Ar":"مجموع الرحلة 96 م. بعد أربع خطوات قطع الروبوت 90 م وبعد خمس قطع 93 م، فيعبر الحد المطلوب في الخامسة.","En":"Total travel is 96 m. The first four moves cover 90 m and the first five cover 93 m, so the threshold is crossed on move five."},"CommonError":{"Ar":"اكتفى بالتأكد من أن الخطوة التالية وحدها أقصر من أربعة أمتار.","En":"Checks only that the next single move is shorter than four metres."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"اكتفى بالتأكد من أن الخطوة التالية وحدها أقصر من أربعة أمتار.","En":"Checks only that the next single move is shorter than four metres."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أضاف خطوة أخرى بعد تحقق الشرط.","En":"Adds a move after the threshold has already been crossed."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد الأمتار المتبقية عند تحقق الشرط.","En":"Reports the metres remaining at the first qualifying stop."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v16-grade-1-three-step-square-stair-1$mw$,$mw$three-step-square-stair$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"درجات من المربعات","En":"A three-step square staircase"},"Question":{"Ar":"رسمت هدى ثلاثة صفوف من مربعات متساوية. في الصف العلوي مربع واحد، وكل صف تحته يحوي مربعاً أكثر من الصف الذي فوقه. كم مربعاً رسمت؟","En":"Huda draws three rows of equal squares. The top row has one square, and each row below it has one more square than the row above it. How many squares does she draw?"},"Options":[{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ الصفوف بدلاً من المربعات.","En":"Counts rows instead of squares."}},{"LatexCode":"5","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع مربعات الصفين السفليين فقط.","En":"Adds only the bottom two rows."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل كل صف كأن فيه ثلاثة مربعات كالصف السفلي.","En":"Treats all three rows as having three squares like the bottom row."}}],"Hints":[{"Ar":"ارسم الصف العلوي أولاً.","En":"Draw the top row first."},{"Ar":"عدّ مربعات كل صف قبل جمع الأعداد.","En":"Count the squares in each row before adding."}],"Solution":{"Idea":{"Ar":"نكوّن الصفوف وفق قاعدة الزيادة بمربع واحد ثم نجمع عدد المربعات.","En":"Build each row by adding one square to the previous row, then sum the counts."},"FormulaLatex":"N=1+2+3","Steps":[{"Ar":"في الصف الثاني مربعان، وفي الثالث ثلاثة مربعات.","En":"There are two squares in the second row and three in the third."},{"Ar":"اجمع أعداد المربعات في الصفوف الثلاثة.","En":"Add the counts in the three rows."}],"Substitution":{"Ar":"$1+2+3=6$","En":"$1+2+3=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"مربعات","En":"squares"},"Verification":{"Ar":"إذا أزلنا مربعات الصف السفلي الثلاثة يبقى ثلاثة، وهو مجموع مربع الصف الأول ومربعي الصف الثاني.","En":"Removing the three bottom squares leaves three, the one top square and two middle squares."},"CommonError":{"Ar":"عدّ الصفوف بدلاً من المربعات.","En":"Counts rows instead of squares."}}}$mw$::jsonb,$mw$نكوّن الصفوف وفق قاعدة الزيادة بمربع واحد ثم نجمع عدد المربعات.

$N=1+2+3$

1. في الصف الثاني مربعان، وفي الثالث ثلاثة مربعات.

2. اجمع أعداد المربعات في الصفوف الثلاثة.

$1+2+3=6$

$6$ مربعات

إذا أزلنا مربعات الصف السفلي الثلاثة يبقى ثلاثة، وهو مجموع مربع الصف الأول ومربعي الصف الثاني.

عدّ الصفوف بدلاً من المربعات.$mw$,$mw$Build each row by adding one square to the previous row, then sum the counts.

$N=1+2+3$

1. There are two squares in the second row and three in the third.

2. Add the counts in the three rows.

$1+2+3=6$

$6$ squares

Removing the three bottom squares leaves three, the one top square and two middle squares.

Counts rows instead of squares.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"ارسم الصف العلوي أولاً.","En":"Draw the top row first."},{"Ar":"عدّ مربعات كل صف قبل جمع الأعداد.","En":"Count the squares in each row before adding."}],"Solution":{"Idea":{"Ar":"نكوّن الصفوف وفق قاعدة الزيادة بمربع واحد ثم نجمع عدد المربعات.","En":"Build each row by adding one square to the previous row, then sum the counts."},"FormulaLatex":"N=1+2+3","Steps":[{"Ar":"في الصف الثاني مربعان، وفي الثالث ثلاثة مربعات.","En":"There are two squares in the second row and three in the third."},{"Ar":"اجمع أعداد المربعات في الصفوف الثلاثة.","En":"Add the counts in the three rows."}],"Substitution":{"Ar":"$1+2+3=6$","En":"$1+2+3=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"مربعات","En":"squares"},"Verification":{"Ar":"إذا أزلنا مربعات الصف السفلي الثلاثة يبقى ثلاثة، وهو مجموع مربع الصف الأول ومربعي الصف الثاني.","En":"Removing the three bottom squares leaves three, the one top square and two middle squares."},"CommonError":{"Ar":"عدّ الصفوف بدلاً من المربعات.","En":"Counts rows instead of squares."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"عدّ الصفوف بدلاً من المربعات.","En":"Counts rows instead of squares."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"جمع مربعات الصفين السفليين فقط.","En":"Adds only the bottom two rows."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عامل كل صف كأن فيه ثلاثة مربعات كالصف السفلي.","En":"Treats all three rows as having three squares like the bottom row."},"Order":4}]}$mw$),
($mw$growth-v16-grade-2-two-stocks-with-same-total-movements-1$mw$,$mw$two-stocks-with-same-total-movements$mw$,$mw$primary-multistep-arithmetic$mw$,$mw$grade-2$mw$,2,1,1,3,$mw${"StageId":1,"CategoryId":1,"PrimarySkillId":3,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"أين انتهت الكتب؟","En":"Where did the books end up?"},"Question":{"Ar":"على رفّين معاً 19 كتاباً. أُخذت ثلاثة كتب من الرف العلوي، ثم أُضيفت خمسة كتب من خارج الرفّين إلى الرف السفلي. إذا بقي على الرف العلوي 7 كتب، فكم كتاباً صار على الرف السفلي؟","En":"Two shelves hold 19 books in all. Three books are removed from the upper shelf, and five books from elsewhere are added to the lower shelf. If seven books stay on the upper shelf, how many are now on the lower shelf?"},"Options":[{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح السبعة من المجموع الأصلي.","En":"Subtracts seven from the original total."}},{"LatexCode":"14","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أوجد ما كان في السفلي قبل الإضافة.","En":"Finds what was below before adding books."}},{"LatexCode":"21","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع الكتب على الرفّين.","En":"Reports the total across both shelves."}}],"Hints":[{"Ar":"كم كتاباً صار على الرفّين معاً بعد التغييرين؟","En":"How many books are on both shelves after the two changes?"},{"Ar":"اطرح عدد كتب الرف العلوي الحالي من المجموع الجديد.","En":"Subtract the current upper-shelf count from the new total."}],"Solution":{"Idea":{"Ar":"نحدّث المجموع الكلي بعد الإزالة والإضافة، ثم نستبعد العدد الحالي على الرف العلوي.","En":"Update the total after removal and addition, then subtract the current upper-shelf count."},"FormulaLatex":"L=(T-r+a)-U","Steps":[{"Ar":"ينقص المجموع ثلاثة ثم يزيد خمسة، فيصير 21 كتاباً.","En":"The total falls by three and rises by five, ending at 21."},{"Ar":"للعلوي سبعة كتب، وللسفلي كل الكتب الباقية.","En":"The upper shelf has seven books and the lower shelf has the rest."}],"Substitution":{"Ar":"$19-3+5-7=14$","En":"$19-3+5-7=14$"},"Result":{"Ar":"$14$","En":"$14$"},"Unit":{"Ar":"كتاباً","En":"books"},"Verification":{"Ar":"كان في العلوي 10 كتب وفي السفلي 9. إضافة خمسة إلى السفلي تعطي 14.","En":"The shelves started with 10 books above and 9 below. Adding five below gives 14."},"CommonError":{"Ar":"طرح السبعة من المجموع الأصلي.","En":"Subtracts seven from the original total."}}}$mw$::jsonb,$mw$نحدّث المجموع الكلي بعد الإزالة والإضافة، ثم نستبعد العدد الحالي على الرف العلوي.

$L=(T-r+a)-U$

1. ينقص المجموع ثلاثة ثم يزيد خمسة، فيصير 21 كتاباً.

2. للعلوي سبعة كتب، وللسفلي كل الكتب الباقية.

$19-3+5-7=14$

$14$ كتاباً

كان في العلوي 10 كتب وفي السفلي 9. إضافة خمسة إلى السفلي تعطي 14.

طرح السبعة من المجموع الأصلي.$mw$,$mw$Update the total after removal and addition, then subtract the current upper-shelf count.

$L=(T-r+a)-U$

1. The total falls by three and rises by five, ending at 21.

2. The upper shelf has seven books and the lower shelf has the rest.

$19-3+5-7=14$

$14$ books

The shelves started with 10 books above and 9 below. Adding five below gives 14.

Subtracts seven from the original total.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"كم كتاباً صار على الرفّين معاً بعد التغييرين؟","En":"How many books are on both shelves after the two changes?"},{"Ar":"اطرح عدد كتب الرف العلوي الحالي من المجموع الجديد.","En":"Subtract the current upper-shelf count from the new total."}],"Solution":{"Idea":{"Ar":"نحدّث المجموع الكلي بعد الإزالة والإضافة، ثم نستبعد العدد الحالي على الرف العلوي.","En":"Update the total after removal and addition, then subtract the current upper-shelf count."},"FormulaLatex":"L=(T-r+a)-U","Steps":[{"Ar":"ينقص المجموع ثلاثة ثم يزيد خمسة، فيصير 21 كتاباً.","En":"The total falls by three and rises by five, ending at 21."},{"Ar":"للعلوي سبعة كتب، وللسفلي كل الكتب الباقية.","En":"The upper shelf has seven books and the lower shelf has the rest."}],"Substitution":{"Ar":"$19-3+5-7=14$","En":"$19-3+5-7=14$"},"Result":{"Ar":"$14$","En":"$14$"},"Unit":{"Ar":"كتاباً","En":"books"},"Verification":{"Ar":"كان في العلوي 10 كتب وفي السفلي 9. إضافة خمسة إلى السفلي تعطي 14.","En":"The shelves started with 10 books above and 9 below. Adding five below gives 14."},"CommonError":{"Ar":"طرح السبعة من المجموع الأصلي.","En":"Subtracts seven from the original total."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح السبعة من المجموع الأصلي.","En":"Subtracts seven from the original total."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أوجد ما كان في السفلي قبل الإضافة.","En":"Finds what was below before adding books."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى مجموع الكتب على الرفّين.","En":"Reports the total across both shelves."},"Order":4}]}$mw$),
($mw$growth-v16-grade-3-uncovered-border-count-1$mw$,$mw$uncovered-border-count$mw$,$mw$primary-rectangle-area$mw$,$mw$grade-3$mw$,3,1,3,13,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":13,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"إطار من البلاطات","En":"A border made of tiles"},"Question":{"Ar":"تغطي بلاطات مربّعة طول ضلعها متر واحد أرضية مستطيلة طولها 8 أمتار وعرضها 6 أمتار. إن طُلِي صفّ واحد من البلاطات على طول كل حافة، فكم بلاطة تُطلى؟","En":"One-metre square tiles cover a rectangular floor measuring 8 m by 6 m. A single row of tiles along each edge is painted. How many tiles are painted?"},"Options":[{"LatexCode":"28","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع بلاطات الحواف الأربع وعدّ كل زاوية مرتين.","En":"Adds the four edge counts and counts each corner twice."}},{"LatexCode":"20","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حذف بلاطات الزوايا من جميع الحواف.","En":"Leaves the corner tiles out of every edge count."}},{"LatexCode":"24","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"48","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ كل بلاطات الأرضية.","En":"Counts the entire floor."}}],"Hints":[{"Ar":"تخيّل المستطيل المتبقي بلا طلاء في الوسط.","En":"Picture the unpainted rectangle inside the border."},{"Ar":"أنقص بلاطتين من كل بُعد لحساب أبعاد الجزء غير المطلي.","En":"Subtract two tiles from each dimension to find the unpainted dimensions."}],"Solution":{"Idea":{"Ar":"عدد بلاطات الحواف يساوي عدد البلاطات الكلي ناقص بلاطات المستطيل الداخلي.","En":"The border count equals the total tiles minus the inner rectangle's tiles."},"FormulaLatex":"N=LW-(L-2)(W-2)","Steps":[{"Ar":"في الأرضية كلها 8 × 6 = 48 بلاطة.","En":"The full floor contains 8 × 6 = 48 tiles."},{"Ar":"أبعاد الجزء الداخلي 6 بلاطات في اتجاه الطول و4 في اتجاه العرض، وفيه 24 بلاطة غير مطلية.","En":"The inner rectangle is 6 tiles long and 4 tiles wide, containing 24 unpainted tiles."},{"Ar":"اطرح البلاطات غير المطلية من العدد الكلي.","En":"Subtract unpainted tiles from the total."}],"Substitution":{"Ar":"$48-6(4)=24$","En":"$48-6(4)=24$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"بلاطة","En":"tiles"},"Verification":{"Ar":"عدّ ثماني بلاطات على كل من الحافتين الطويلتين، وأربعاً على كل من الحافتين القصيرتين بعد إسقاط الزوايا من العدّ فيهما.","En":"Count eight tiles along each long edge and four along each short edge after skipping its already counted corners."},"CommonError":{"Ar":"جمع بلاطات الحواف الأربع وعدّ كل زاوية مرتين.","En":"Adds the four edge counts and counts each corner twice."}}}$mw$::jsonb,$mw$عدد بلاطات الحواف يساوي عدد البلاطات الكلي ناقص بلاطات المستطيل الداخلي.

$N=LW-(L-2)(W-2)$

1. في الأرضية كلها 8 × 6 = 48 بلاطة.

2. أبعاد الجزء الداخلي 6 بلاطات في اتجاه الطول و4 في اتجاه العرض، وفيه 24 بلاطة غير مطلية.

3. اطرح البلاطات غير المطلية من العدد الكلي.

$48-6(4)=24$

$24$ بلاطة

عدّ ثماني بلاطات على كل من الحافتين الطويلتين، وأربعاً على كل من الحافتين القصيرتين بعد إسقاط الزوايا من العدّ فيهما.

جمع بلاطات الحواف الأربع وعدّ كل زاوية مرتين.$mw$,$mw$The border count equals the total tiles minus the inner rectangle's tiles.

$N=LW-(L-2)(W-2)$

1. The full floor contains 8 × 6 = 48 tiles.

2. The inner rectangle is 6 tiles long and 4 tiles wide, containing 24 unpainted tiles.

3. Subtract unpainted tiles from the total.

$48-6(4)=24$

$24$ tiles

Count eight tiles along each long edge and four along each short edge after skipping its already counted corners.

Adds the four edge counts and counts each corner twice.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"تخيّل المستطيل المتبقي بلا طلاء في الوسط.","En":"Picture the unpainted rectangle inside the border."},{"Ar":"أنقص بلاطتين من كل بُعد لحساب أبعاد الجزء غير المطلي.","En":"Subtract two tiles from each dimension to find the unpainted dimensions."}],"Solution":{"Idea":{"Ar":"عدد بلاطات الحواف يساوي عدد البلاطات الكلي ناقص بلاطات المستطيل الداخلي.","En":"The border count equals the total tiles minus the inner rectangle's tiles."},"FormulaLatex":"N=LW-(L-2)(W-2)","Steps":[{"Ar":"في الأرضية كلها 8 × 6 = 48 بلاطة.","En":"The full floor contains 8 × 6 = 48 tiles."},{"Ar":"أبعاد الجزء الداخلي 6 بلاطات في اتجاه الطول و4 في اتجاه العرض، وفيه 24 بلاطة غير مطلية.","En":"The inner rectangle is 6 tiles long and 4 tiles wide, containing 24 unpainted tiles."},{"Ar":"اطرح البلاطات غير المطلية من العدد الكلي.","En":"Subtract unpainted tiles from the total."}],"Substitution":{"Ar":"$48-6(4)=24$","En":"$48-6(4)=24$"},"Result":{"Ar":"$24$","En":"$24$"},"Unit":{"Ar":"بلاطة","En":"tiles"},"Verification":{"Ar":"عدّ ثماني بلاطات على كل من الحافتين الطويلتين، وأربعاً على كل من الحافتين القصيرتين بعد إسقاط الزوايا من العدّ فيهما.","En":"Count eight tiles along each long edge and four along each short edge after skipping its already counted corners."},"CommonError":{"Ar":"جمع بلاطات الحواف الأربع وعدّ كل زاوية مرتين.","En":"Adds the four edge counts and counts each corner twice."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"جمع بلاطات الحواف الأربع وعدّ كل زاوية مرتين.","En":"Adds the four edge counts and counts each corner twice."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حذف بلاطات الزوايا من جميع الحواف.","En":"Leaves the corner tiles out of every edge count."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدّ كل بلاطات الأرضية.","En":"Counts the entire floor."},"Order":4}]}$mw$),
($mw$growth-v16-grade-3-fraction-of-a-group-of-half-panels-1$mw$,$mw$fraction-of-a-group-of-half-panels$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"أنصاف اللوحات","En":"Half-panels in a bundle"},"Question":{"Ar":"تتألف رزمة من 8 قطع متساوية، وكل قطعة نصف لوحة. طُلي ربع القطع. كم لوحة كاملة يمكن تركيبها من القطع المطلية؟","En":"A bundle contains eight equal pieces, each half of a panel. One quarter of the pieces are painted. How many whole panels can be assembled from the painted pieces?"},"Options":[{"LatexCode":"2","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد القطع المطلية.","En":"Reports the number of painted pieces."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد اللوحات الممكنة من جميع القطع.","En":"Reports the panels possible from all the pieces."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد اللوحات الممكنة من القطع غير المطلية.","En":"Reports the panels possible from the unpainted pieces."}},{"LatexCode":"1","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"احسب أولاً عدد القطع التي طُليت.","En":"First count how many pieces were painted."},{"Ar":"كل لوح كامل يحتاج قطعتين.","En":"Each whole panel needs two pieces."}],"Solution":{"Idea":{"Ar":"نحدد عدد أنصاف اللوحات المطلية أولاً؛ ثم نكوّن لوحة كاملة من كل نصفين.","En":"Find the number of painted half-panels first, then combine every two halves into a whole."},"FormulaLatex":"N=(8/4)/2","Steps":[{"Ar":"ربع القطع الثماني يساوي قطعتين.","En":"One quarter of the eight pieces is two pieces."},{"Ar":"ضمّ القطعتين المطليتين ليكوّنا لوحة كاملة واحدة.","En":"Join the two painted pieces to make one whole panel."}],"Substitution":{"Ar":"$2/2=1$","En":"$2/2=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"لوحة كاملة","En":"whole panels"},"Verification":{"Ar":"إذا فُصلت اللوحة المركّبة عاد لدينا نصفان مطليان من أصل ثمانية أنصاف.","En":"Splitting the assembled panel restores the two painted halves out of the eight halves."},"CommonError":{"Ar":"أعطى عدد القطع المطلية.","En":"Reports the number of painted pieces."}}}$mw$::jsonb,$mw$نحدد عدد أنصاف اللوحات المطلية أولاً؛ ثم نكوّن لوحة كاملة من كل نصفين.

$N=(8/4)/2$

1. ربع القطع الثماني يساوي قطعتين.

2. ضمّ القطعتين المطليتين ليكوّنا لوحة كاملة واحدة.

$2/2=1$

$1$ لوحة كاملة

إذا فُصلت اللوحة المركّبة عاد لدينا نصفان مطليان من أصل ثمانية أنصاف.

أعطى عدد القطع المطلية.$mw$,$mw$Find the number of painted half-panels first, then combine every two halves into a whole.

$N=(8/4)/2$

1. One quarter of the eight pieces is two pieces.

2. Join the two painted pieces to make one whole panel.

$2/2=1$

$1$ whole panels

Splitting the assembled panel restores the two painted halves out of the eight halves.

Reports the number of painted pieces.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"احسب أولاً عدد القطع التي طُليت.","En":"First count how many pieces were painted."},{"Ar":"كل لوح كامل يحتاج قطعتين.","En":"Each whole panel needs two pieces."}],"Solution":{"Idea":{"Ar":"نحدد عدد أنصاف اللوحات المطلية أولاً؛ ثم نكوّن لوحة كاملة من كل نصفين.","En":"Find the number of painted half-panels first, then combine every two halves into a whole."},"FormulaLatex":"N=(8/4)/2","Steps":[{"Ar":"ربع القطع الثماني يساوي قطعتين.","En":"One quarter of the eight pieces is two pieces."},{"Ar":"ضمّ القطعتين المطليتين ليكوّنا لوحة كاملة واحدة.","En":"Join the two painted pieces to make one whole panel."}],"Substitution":{"Ar":"$2/2=1$","En":"$2/2=1$"},"Result":{"Ar":"$1$","En":"$1$"},"Unit":{"Ar":"لوحة كاملة","En":"whole panels"},"Verification":{"Ar":"إذا فُصلت اللوحة المركّبة عاد لدينا نصفان مطليان من أصل ثمانية أنصاف.","En":"Splitting the assembled panel restores the two painted halves out of the eight halves."},"CommonError":{"Ar":"أعطى عدد القطع المطلية.","En":"Reports the number of painted pieces."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد القطع المطلية.","En":"Reports the number of painted pieces."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد اللوحات الممكنة من جميع القطع.","En":"Reports the panels possible from all the pieces."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"أعطى عدد اللوحات الممكنة من القطع غير المطلية.","En":"Reports the panels possible from the unpainted pieces."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$);
DO $growth$
DECLARE b record; did bigint; pid int; actor int;
BEGIN
 SELECT d."OwnerUserId" INTO STRICT actor FROM public."CurriculumDraftItems" d JOIN public."Users" u ON u."Id"=d."OwnerUserId" WHERE d."Id"=1088 AND d."EditorialStatus"='Published' AND d."PublishedProblemId"=1806 AND u."Role"='Admin' AND u."IsActive" AND NOT u."StaffSetupPending";
 FOR b IN SELECT * FROM growth_batch ORDER BY track,key LOOP
  PERFORM 1 FROM public."LearningTracks" WHERE "Id"=b.track FOR UPDATE;
  IF NOT EXISTS(SELECT 1 FROM public."LearningTracks" WHERE "Id"=b.track AND "Code"=b.track_code AND "StageId"=b.stage AND "IsPublished" AND "Revision"<2147483647) OR NOT EXISTS(SELECT 1 FROM public."Categories" WHERE "Id"=b.category AND "StageId"=b.stage) OR NOT EXISTS(SELECT 1 FROM public."CurriculumSkills" s JOIN public."CurriculumDomains" dm ON dm."Id"=s."DomainId" WHERE s."Id"=b.skill AND s."StableKey"=b.skill_key AND s."StageId"=b.stage AND s."CategoryId"=b.category AND s."IsPublished" AND dm."IsPublished") OR NOT EXISTS(SELECT 1 FROM public."LearningTrackCategories" WHERE "TrackId"=b.track AND "CategoryId"=b.category) OR NOT EXISTS(SELECT 1 FROM public."LearningTrackSkills" WHERE "TrackId"=b.track AND "SkillId"=b.skill) THEN RAISE EXCEPTION 'Scope changed %',b.key; END IF;
  IF EXISTS(SELECT 1 FROM public."CurriculumDraftItems" WHERE "ContentKey"=b.key) OR EXISTS(SELECT 1 FROM public."Problems" q WHERE upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g'))) OR EXISTS(SELECT 1 FROM public."CurriculumDraftItems" q WHERE q."EditorialStatus"<>'Withdrawn' AND q."WizardJson" IS NOT NULL AND (upper(regexp_replace(btrim(q."QuestionTextAr"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,Ar}'),'[[:space:]]+',' ','g')) OR upper(regexp_replace(btrim(q."QuestionTextEn"),'[[:space:]]+',' ','g'))=upper(regexp_replace(btrim(b.wizard#>>'{Question,En}'),'[[:space:]]+',' ','g')))) THEN RAISE EXCEPTION 'Duplicate %',b.key; END IF;
  INSERT INTO public."CurriculumDraftItems"("ContentKey","PrimarySkillKey","TemplateFamilyKey","DifficultyLevel","PisaProcess","LearningObjectiveAr","LearningObjectiveEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","OptionsJson","EditorialStatus","WizardJson","OwnerUserId","LastEditorUserId","Revision") VALUES(b.key,b.skill_key,'',(b.wizard->>'DifficultyLevel')::int,'','','',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}','','','[]'::jsonb,'Draft',b.wizard::text,actor,actor,0) RETURNING "Id" INTO did;
  INSERT INTO public."Problems"("TitleAr","TitleEn","QuestionTextAr","QuestionTextEn","DetailedSolutionAr","DetailedSolutionEn","StageId","CategoryId","Points","ViewsCount","SolvedCount","CreatedAt","EditorialDetailsJson") VALUES(b.wizard#>>'{Title,Ar}',b.wizard#>>'{Title,En}',b.wizard#>>'{Question,Ar}',b.wizard#>>'{Question,En}',b.flat_ar,b.flat_en,b.stage,b.category,10,0,0,now(),b.metadata) RETURNING "Id" INTO pid;
  INSERT INTO public."QuestionOptions"("ProblemId","Order","LatexCode","IsCorrect") SELECT pid,ord::int,o->>'LatexCode',(o->>'IsCorrect')::boolean FROM jsonb_array_elements(b.wizard->'Options') WITH ORDINALITY AS x(o,ord);
  INSERT INTO public."CurriculumProblemSkills"("ProblemId","SkillId","IsPrimary") VALUES(pid,b.skill,true);
  INSERT INTO public."LearningTrackProblems"("TrackId","ProblemId") VALUES(b.track,pid);
  UPDATE public."LearningTracks" SET "Revision"="Revision"+1 WHERE "Id"=b.track;
  UPDATE public."CurriculumDraftItems" SET "EditorialStatus"='Published',"Revision"=3,"SubmittedAtUtc"=now(),"ReviewedAtUtc"=now(),"ReviewedByUserId"=actor,"ReviewNote"='Owner-authorized SQL maintenance; AI educational review of repository v15/v16/v18 candidate; existing admin owner used for attribution, not an API login.',"PublishedAtUtc"=now(),"PublishedProblemId"=pid WHERE "Id"=did;
  INSERT INTO public."PlatformActivityEvents"("ActorUserId","ActorRole","Action","Resource","ResourceId","Origin","CreatedAtUtc") SELECT actor,'Admin',action,'EditorialProblem',did::text,'owner_sql',now() FROM unnest(ARRAY['EditorialDraftImported','EditorialDraftSubmitted','EditorialDraftApproved','EditorialDraftPublished']) action;
 END LOOP;
END $growth$;
COMMIT;
