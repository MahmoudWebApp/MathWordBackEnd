-- One-time owner-authorized import AND publication from reviewed v15/v16/v18 school waves.
-- Existing skills and tracks only; explicit source keys, no duplicate imports.
BEGIN;
SET LOCAL lock_timeout='3s';
SET LOCAL statement_timeout='35s';
SELECT pg_advisory_xact_lock(-987654319::bigint);
CREATE TEMP TABLE growth_batch(key text,family text,skill_key text,track_code text,track int,stage int,category int,skill int,wizard jsonb,flat_ar text,flat_en text,metadata text) ON COMMIT DROP;
INSERT INTO growth_batch VALUES
($mw$growth-v15-grade-1-correct-double-touch-count-1$mw$,$mw$correct-double-touch-count$mw$,$mw$counting$mw$,$mw$grade-1$mw$,1,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[1],"DifficultyLevel":2,"Points":10,"Title":{"Ar":"الحصاة التي عُدّت مرتين","En":"The pebble counted twice"},"Question":{"Ar":"لمست هدى الحصى واحدة بعد أخرى وهي تعدّ من 1 إلى 8. لمست حصاة واحدة مرتين وكل حصاة أخرى مرة واحدة. كم حصاة أمامها؟","En":"Huda touches pebbles one by one while counting from 1 to 8. She touches one pebble twice and every other pebble once. How many pebbles are in front of her?"},"Options":[{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب عدد اللمسات كما هو.","En":"Uses the touch count unchanged."}},{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حذف اللمستين فأسقط الحصاة نفسها.","En":"Removes both touches and loses the pebble itself."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أضاف اللمسة الزائدة إلى العدد المسجّل.","En":"Adds the extra touch to the recorded count."}}],"Hints":[{"Ar":"كل عدد نطقت به هدى يقابل لمسة.","En":"Each number Huda says counts one touch."},{"Ar":"اسأل نفسك كم لمسة زائدة نالتها الحصاة التي لمستها مرتين.","En":"How many extra touches did the twice-touched pebble get?"}],"Solution":{"Idea":{"Ar":"نعدّ الحصيات المختلفة، لا عدد اللمسات؛ نحذف اللمسة المكررة فقط.","En":"Count distinct pebbles, not touches; remove only the repeated touch."},"FormulaLatex":"N=T-(2-1)","Steps":[{"Ar":"ثماني لمسات لا تعني ثماني حصيات هنا، لأن لمستين تخصّان الحصاة نفسها.","En":"Two of the eight touches belong to the same pebble."},{"Ar":"نحتفظ بلمسة لكل حصاة ونحذف اللمسة الزائدة فقط.","En":"Keep one touch for each pebble and remove just the extra touch."}],"Substitution":{"Ar":"$8-1=7$","En":"$8-1=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"حصيات","En":"pebbles"},"Verification":{"Ar":"ست حصيات نالت ست لمسات، ونالت السابعة لمستين، فيكون المجموع ثماني لمسات.","En":"Six pebbles receive six touches and the seventh receives two, totalling eight touches."},"CommonError":{"Ar":"حسب عدد اللمسات كما هو.","En":"Uses the touch count unchanged."}}}$mw$::jsonb,$mw$نعدّ الحصيات المختلفة، لا عدد اللمسات؛ نحذف اللمسة المكررة فقط.

$N=T-(2-1)$

1. ثماني لمسات لا تعني ثماني حصيات هنا، لأن لمستين تخصّان الحصاة نفسها.

2. نحتفظ بلمسة لكل حصاة ونحذف اللمسة الزائدة فقط.

$8-1=7$

$7$ حصيات

ست حصيات نالت ست لمسات، ونالت السابعة لمستين، فيكون المجموع ثماني لمسات.

حسب عدد اللمسات كما هو.$mw$,$mw$Count distinct pebbles, not touches; remove only the repeated touch.

$N=T-(2-1)$

1. Two of the eight touches belong to the same pebble.

2. Keep one touch for each pebble and remove just the extra touch.

$8-1=7$

$7$ pebbles

Six pebbles receive six touches and the seventh receives two, totalling eight touches.

Uses the touch count unchanged.$mw$,$mw${"DifficultyLevel":2,"Hints":[{"Ar":"كل عدد نطقت به هدى يقابل لمسة.","En":"Each number Huda says counts one touch."},{"Ar":"اسأل نفسك كم لمسة زائدة نالتها الحصاة التي لمستها مرتين.","En":"How many extra touches did the twice-touched pebble get?"}],"Solution":{"Idea":{"Ar":"نعدّ الحصيات المختلفة، لا عدد اللمسات؛ نحذف اللمسة المكررة فقط.","En":"Count distinct pebbles, not touches; remove only the repeated touch."},"FormulaLatex":"N=T-(2-1)","Steps":[{"Ar":"ثماني لمسات لا تعني ثماني حصيات هنا، لأن لمستين تخصّان الحصاة نفسها.","En":"Two of the eight touches belong to the same pebble."},{"Ar":"نحتفظ بلمسة لكل حصاة ونحذف اللمسة الزائدة فقط.","En":"Keep one touch for each pebble and remove just the extra touch."}],"Substitution":{"Ar":"$8-1=7$","En":"$8-1=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"حصيات","En":"pebbles"},"Verification":{"Ar":"ست حصيات نالت ست لمسات، ونالت السابعة لمستين، فيكون المجموع ثماني لمسات.","En":"Six pebbles receive six touches and the seventh receives two, totalling eight touches."},"CommonError":{"Ar":"حسب عدد اللمسات كما هو.","En":"Uses the touch count unchanged."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"حسب عدد اللمسات كما هو.","En":"Uses the touch count unchanged."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حذف اللمستين فأسقط الحصاة نفسها.","En":"Removes both touches and loses the pebble itself."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أضاف اللمسة الزائدة إلى العدد المسجّل.","En":"Adds the extra touch to the recorded count."},"Order":4}]}$mw$),
($mw$growth-v15-grade-2-count-printed-page-digits-1$mw$,$mw$count-printed-page-digits$mw$,$mw$counting$mw$,$mw$grade-2$mw$,2,1,81,302,$mw${"StageId":1,"CategoryId":81,"PrimarySkillId":302,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"أختام أرقام الصفحات","En":"Stamping page numbers"},"Question":{"Ar":"ترقّم نور صفحات كتيّب من 1 إلى 13 بلا أصفار على اليسار. تضغط الختم مرة واحدة لكل رقم منفرد، فالصفحة 12 تحتاج ضغطتين. كم ضغطة تحتاج لترقيم الصفحات كلها؟","En":"Noor numbers booklet pages from 1 through 13 with no leading zeros. She presses a stamp once per digit, so page 12 takes two presses. How many presses does she need for all the pages?"},"Options":[{"LatexCode":"13","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل رقم كل صفحة كأنه خانة واحدة.","En":"Treats every page label as a single digit."}},{"LatexCode":"16","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أغفل الضغطة الثانية للصفحة 10.","En":"Misses the second press for page 10."}},{"LatexCode":"17","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"استعمل ضغطتين لكل صفحة حتى ذات الخانة الواحدة.","En":"Uses two presses even for single-digit pages."}}],"Hints":[{"Ar":"افصل الصفحات التي لها رقم من خانة واحدة عن الصفحات التي لها رقم من خانتين.","En":"Separate pages with one-digit labels from pages with two-digit labels."},{"Ar":"كم صفحة رقمها من خانتين؟ لكل منها ضغطتان.","En":"How many pages have two-digit numbers? Each takes two presses."}],"Solution":{"Idea":{"Ar":"عدد الضغطات يساوي عدد الخانات المطبوعة، لا عدد الصفحات.","En":"The number of presses equals the printed digit count, not the page count."},"FormulaLatex":"P=n_1+2n_2","Steps":[{"Ar":"تحتاج الصفحات من 1 إلى 9 إلى تسع ضغطات.","En":"Pages 1 through 9 take nine presses."},{"Ar":"تحتاج الصفحات 10 و11 و12 و13 ضغطتين لكل منها، أي ثماني ضغطات أخرى.","En":"Pages 10, 11, 12 and 13 each take two presses, adding eight more."}],"Substitution":{"Ar":"$9+2(4)=17$","En":"$9+2(4)=17$"},"Result":{"Ar":"$17$","En":"$17$"},"Unit":{"Ar":"ضغطة","En":"presses"},"Verification":{"Ar":"ضغطة أولى لكل صفحة تعطي 13 ضغطة، وبإضافة ضغطة ثانية لكل من الصفحات الأربع الأخيرة نحصل على 17.","En":"One press per page uses 13 presses, plus a second press on each of the last four pages gives 17."},"CommonError":{"Ar":"عامل رقم كل صفحة كأنه خانة واحدة.","En":"Treats every page label as a single digit."}}}$mw$::jsonb,$mw$عدد الضغطات يساوي عدد الخانات المطبوعة، لا عدد الصفحات.

$P=n_1+2n_2$

1. تحتاج الصفحات من 1 إلى 9 إلى تسع ضغطات.

2. تحتاج الصفحات 10 و11 و12 و13 ضغطتين لكل منها، أي ثماني ضغطات أخرى.

$9+2(4)=17$

$17$ ضغطة

ضغطة أولى لكل صفحة تعطي 13 ضغطة، وبإضافة ضغطة ثانية لكل من الصفحات الأربع الأخيرة نحصل على 17.

عامل رقم كل صفحة كأنه خانة واحدة.$mw$,$mw$The number of presses equals the printed digit count, not the page count.

$P=n_1+2n_2$

1. Pages 1 through 9 take nine presses.

2. Pages 10, 11, 12 and 13 each take two presses, adding eight more.

$9+2(4)=17$

$17$ presses

One press per page uses 13 presses, plus a second press on each of the last four pages gives 17.

Treats every page label as a single digit.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"افصل الصفحات التي لها رقم من خانة واحدة عن الصفحات التي لها رقم من خانتين.","En":"Separate pages with one-digit labels from pages with two-digit labels."},{"Ar":"كم صفحة رقمها من خانتين؟ لكل منها ضغطتان.","En":"How many pages have two-digit numbers? Each takes two presses."}],"Solution":{"Idea":{"Ar":"عدد الضغطات يساوي عدد الخانات المطبوعة، لا عدد الصفحات.","En":"The number of presses equals the printed digit count, not the page count."},"FormulaLatex":"P=n_1+2n_2","Steps":[{"Ar":"تحتاج الصفحات من 1 إلى 9 إلى تسع ضغطات.","En":"Pages 1 through 9 take nine presses."},{"Ar":"تحتاج الصفحات 10 و11 و12 و13 ضغطتين لكل منها، أي ثماني ضغطات أخرى.","En":"Pages 10, 11, 12 and 13 each take two presses, adding eight more."}],"Substitution":{"Ar":"$9+2(4)=17$","En":"$9+2(4)=17$"},"Result":{"Ar":"$17$","En":"$17$"},"Unit":{"Ar":"ضغطة","En":"presses"},"Verification":{"Ar":"ضغطة أولى لكل صفحة تعطي 13 ضغطة، وبإضافة ضغطة ثانية لكل من الصفحات الأربع الأخيرة نحصل على 17.","En":"One press per page uses 13 presses, plus a second press on each of the last four pages gives 17."},"CommonError":{"Ar":"عامل رقم كل صفحة كأنه خانة واحدة.","En":"Treats every page label as a single digit."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عامل رقم كل صفحة كأنه خانة واحدة.","En":"Treats every page label as a single digit."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أغفل الضغطة الثانية للصفحة 10.","En":"Misses the second press for page 10."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"استعمل ضغطتين لكل صفحة حتى ذات الخانة الواحدة.","En":"Uses two presses even for single-digit pages."},"Order":4}]}$mw$),
($mw$growth-v15-grade-2-unfold-paired-holes-distance-1$mw$,$mw$unfold-paired-holes-distance$mw$,$mw$length$mw$,$mw$grade-2$mw$,2,1,82,321,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":321,"SecondarySkillIds":[],"TrackIds":[2],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"ثقبان بعد فتح الشريط","En":"Two holes after unfolding"},"Question":{"Ar":"طُوي شريط ورقي طوله 18 سم نصفين حتى تطابق طرفاه. ثُقبت الطبقتان معاً عند نقطة تبعد 3 سم عن الثنية على طول الشريط. ما المسافة بين الثقبين بعد فتح الشريط وفرده؟","En":"An 18 cm paper strip is folded in half so its ends meet. A hole is punched through both layers 3 cm from the crease along the strip. How far apart are the two holes after the strip is unfolded and laid flat?"},"Options":[{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"قاس من ثقب إلى الثنية فقط.","En":"Measures from one hole only to the crease."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى طول نصف الشريط.","En":"Reports half the strip length."}},{"LatexCode":"12","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح 3 سم من كل طرف كأن القياس بدأ من الطرفين.","En":"Removes 3 cm at each end as if the punch distance were measured from the ends."}},{"LatexCode":"6","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"تخيّل مكان الثنية بعد فتح الشريط، وعلى أي جانب يقع كل ثقب.","En":"Picture the crease after unfolding and locate a hole on each side."},{"Ar":"للوصول من ثقب إلى الآخر، مرّ بالثنية واجمع طولي الجزأين.","En":"Travel from one hole to the other via the crease and add the two lengths."}],"Solution":{"Idea":{"Ar":"الطي يجعل الثقبين متناظرين على جانبي الثنية؛ نجمع بعديهما عنها.","En":"Folding makes the holes symmetric about the crease; add their distances from it."},"FormulaLatex":"L=d+d","Steps":[{"Ar":"الثقبان متطابقان عند الطي. وبعد الفتح يكون كل منهما على بعد 3 سم من الثنية في اتجاه مخالف للآخر.","En":"The holes coincide when folded. Once unfolded, each is 3 cm from the crease on a different side."},{"Ar":"من الثقب الأول إلى الثنية 3 سم، ومن الثنية إلى الثقب الثاني 3 سم أخرى.","En":"Go 3 cm from the first hole to the crease and another 3 cm to the other hole."}],"Substitution":{"Ar":"$3+3=6$","En":"$3+3=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"الثنية عند علامة 9 سم من أحد الطرفين، والثقبان عند 6 و12 سم، والفرق 6 سم.","En":"Measured from one end, the crease is at 9 cm and the holes at 6 and 12 cm, a difference of 6 cm."},"CommonError":{"Ar":"قاس من ثقب إلى الثنية فقط.","En":"Measures from one hole only to the crease."}}}$mw$::jsonb,$mw$الطي يجعل الثقبين متناظرين على جانبي الثنية؛ نجمع بعديهما عنها.

$L=d+d$

1. الثقبان متطابقان عند الطي. وبعد الفتح يكون كل منهما على بعد 3 سم من الثنية في اتجاه مخالف للآخر.

2. من الثقب الأول إلى الثنية 3 سم، ومن الثنية إلى الثقب الثاني 3 سم أخرى.

$3+3=6$

$6$ سم

الثنية عند علامة 9 سم من أحد الطرفين، والثقبان عند 6 و12 سم، والفرق 6 سم.

قاس من ثقب إلى الثنية فقط.$mw$,$mw$Folding makes the holes symmetric about the crease; add their distances from it.

$L=d+d$

1. The holes coincide when folded. Once unfolded, each is 3 cm from the crease on a different side.

2. Go 3 cm from the first hole to the crease and another 3 cm to the other hole.

$3+3=6$

$6$ cm

Measured from one end, the crease is at 9 cm and the holes at 6 and 12 cm, a difference of 6 cm.

Measures from one hole only to the crease.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"تخيّل مكان الثنية بعد فتح الشريط، وعلى أي جانب يقع كل ثقب.","En":"Picture the crease after unfolding and locate a hole on each side."},{"Ar":"للوصول من ثقب إلى الآخر، مرّ بالثنية واجمع طولي الجزأين.","En":"Travel from one hole to the other via the crease and add the two lengths."}],"Solution":{"Idea":{"Ar":"الطي يجعل الثقبين متناظرين على جانبي الثنية؛ نجمع بعديهما عنها.","En":"Folding makes the holes symmetric about the crease; add their distances from it."},"FormulaLatex":"L=d+d","Steps":[{"Ar":"الثقبان متطابقان عند الطي. وبعد الفتح يكون كل منهما على بعد 3 سم من الثنية في اتجاه مخالف للآخر.","En":"The holes coincide when folded. Once unfolded, each is 3 cm from the crease on a different side."},{"Ar":"من الثقب الأول إلى الثنية 3 سم، ومن الثنية إلى الثقب الثاني 3 سم أخرى.","En":"Go 3 cm from the first hole to the crease and another 3 cm to the other hole."}],"Substitution":{"Ar":"$3+3=6$","En":"$3+3=6$"},"Result":{"Ar":"$6$","En":"$6$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"الثنية عند علامة 9 سم من أحد الطرفين، والثقبان عند 6 و12 سم، والفرق 6 سم.","En":"Measured from one end, the crease is at 9 cm and the holes at 6 and 12 cm, a difference of 6 cm."},"CommonError":{"Ar":"قاس من ثقب إلى الثنية فقط.","En":"Measures from one hole only to the crease."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"قاس من ثقب إلى الثنية فقط.","En":"Measures from one hole only to the crease."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"أعطى طول نصف الشريط.","En":"Reports half the strip length."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"طرح 3 سم من كل طرف كأن القياس بدأ من الطرفين.","En":"Removes 3 cm at each end as if the punch distance were measured from the ends."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v15-grade-3-reconstruct-whole-from-three-fifths-1$mw$,$mw$reconstruct-whole-from-three-fifths$mw$,$mw$p-fractions-decimals-fraction-models$mw$,$mw$grade-3$mw$,3,1,21,97,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":97,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"الشكل الكامل خلف الورقة","En":"The whole behind the cover"},"Question":{"Ar":"غطّت ورقة جزءاً من شكل مكوّن من مربعات متساوية. المربعات الظاهرة وعددها 12 تمثّل ثلاثة أخماس الشكل الكامل. كم مربعاً يتكوّن منه الشكل الكامل؟","En":"A sheet covers part of a shape built from equal squares. The 12 visible squares make up three fifths of the whole shape. How many squares make up the whole shape?"},"Options":[{"LatexCode":"20","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"اكتفى بعدد مربعات خُمس واحد.","En":"Stops at one fifth."}},{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب المربعات المغطاة فقط.","En":"Counts only the covered squares."}},{"LatexCode":"60","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عامل المربعات الاثني عشر كأنها خُمس واحد.","En":"Treats the visible 12 squares as one fifth."}}],"Hints":[{"Ar":"مثّل الشكل بخمس مجموعات متساوية من المربعات.","En":"Represent the shape by five equal groups of squares."},{"Ar":"وزّع المربعات الظاهرة على ثلاث مجموعات لتعرف عدد المربعات في خُمس واحد.","En":"Share the visible squares across three groups to find one fifth."}],"Solution":{"Idea":{"Ar":"نستعيد الكل من جزء معلوم بتقسيم الجزء على عدد الأخماس التي يمثلها ثم تكوين خمسة أخماس.","En":"Recover the whole by finding one fifth of the whole from the known three fifths, then forming five fifths."},"FormulaLatex":"N=5\\times\\frac{V}{3}","Steps":[{"Ar":"ثلاثة أخماس فيها 12 مربعاً، إذن في كل خُمس أربعة مربعات.","En":"Three fifths contain 12 squares, so each fifth contains four."},{"Ar":"يتألف الشكل الكامل من خمسة أخماس، أي خمس مجموعات من أربعة مربعات.","En":"The whole consists of five fifths, or five groups of four squares."}],"Substitution":{"Ar":"$5\\times\\frac{12}{3}=20$","En":"$5\\times\\frac{12}{3}=20$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"مربعاً","En":"squares"},"Verification":{"Ar":"إذا كان في الشكل 20 مربعاً، ففي خُمسيه المخفيّين 8 مربعات، ويبقى 12 مربعاً ظاهراً.","En":"With 20 squares in the shape, its hidden two fifths contain 8, leaving 12 visible."},"CommonError":{"Ar":"اكتفى بعدد مربعات خُمس واحد.","En":"Stops at one fifth."}}}$mw$::jsonb,$mw$نستعيد الكل من جزء معلوم بتقسيم الجزء على عدد الأخماس التي يمثلها ثم تكوين خمسة أخماس.

$N=5\times\frac{V}{3}$

1. ثلاثة أخماس فيها 12 مربعاً، إذن في كل خُمس أربعة مربعات.

2. يتألف الشكل الكامل من خمسة أخماس، أي خمس مجموعات من أربعة مربعات.

$5\times\frac{12}{3}=20$

$20$ مربعاً

إذا كان في الشكل 20 مربعاً، ففي خُمسيه المخفيّين 8 مربعات، ويبقى 12 مربعاً ظاهراً.

اكتفى بعدد مربعات خُمس واحد.$mw$,$mw$Recover the whole by finding one fifth of the whole from the known three fifths, then forming five fifths.

$N=5\times\frac{V}{3}$

1. Three fifths contain 12 squares, so each fifth contains four.

2. The whole consists of five fifths, or five groups of four squares.

$5\times\frac{12}{3}=20$

$20$ squares

With 20 squares in the shape, its hidden two fifths contain 8, leaving 12 visible.

Stops at one fifth.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"مثّل الشكل بخمس مجموعات متساوية من المربعات.","En":"Represent the shape by five equal groups of squares."},{"Ar":"وزّع المربعات الظاهرة على ثلاث مجموعات لتعرف عدد المربعات في خُمس واحد.","En":"Share the visible squares across three groups to find one fifth."}],"Solution":{"Idea":{"Ar":"نستعيد الكل من جزء معلوم بتقسيم الجزء على عدد الأخماس التي يمثلها ثم تكوين خمسة أخماس.","En":"Recover the whole by finding one fifth of the whole from the known three fifths, then forming five fifths."},"FormulaLatex":"N=5\\times\\frac{V}{3}","Steps":[{"Ar":"ثلاثة أخماس فيها 12 مربعاً، إذن في كل خُمس أربعة مربعات.","En":"Three fifths contain 12 squares, so each fifth contains four."},{"Ar":"يتألف الشكل الكامل من خمسة أخماس، أي خمس مجموعات من أربعة مربعات.","En":"The whole consists of five fifths, or five groups of four squares."}],"Substitution":{"Ar":"$5\\times\\frac{12}{3}=20$","En":"$5\\times\\frac{12}{3}=20$"},"Result":{"Ar":"$20$","En":"$20$"},"Unit":{"Ar":"مربعاً","En":"squares"},"Verification":{"Ar":"إذا كان في الشكل 20 مربعاً، ففي خُمسيه المخفيّين 8 مربعات، ويبقى 12 مربعاً ظاهراً.","En":"With 20 squares in the shape, its hidden two fifths contain 8, leaving 12 visible."},"CommonError":{"Ar":"اكتفى بعدد مربعات خُمس واحد.","En":"Stops at one fifth."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"اكتفى بعدد مربعات خُمس واحد.","En":"Stops at one fifth."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حسب المربعات المغطاة فقط.","En":"Counts only the covered squares."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عامل المربعات الاثني عشر كأنها خُمس واحد.","En":"Treats the visible 12 squares as one fifth."},"Order":4}]}$mw$),
($mw$growth-v15-grade-3-elapsed-time-opposite-clock-errors-1$mw$,$mw$elapsed-time-opposite-clock-errors$mw$,$mw$time$mw$,$mw$grade-3$mw$,3,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"ساعتان غير مضبوطتين","En":"Two clocks with different errors"},"Question":{"Ar":"عند بدء العرض قرأت مريم 4:12 على ساعة تسبق الوقت الصحيح بدقيقتين. وعند انتهائه قرأت 4:35 على ساعة أخرى تتأخر عن الوقت الصحيح بثلاث دقائق. كم دقيقة استمر العرض؟","En":"At the start of a show Mariam reads 4:12 on a clock that is two minutes fast. At the end she reads 4:35 on a different clock that is three minutes slow. How many minutes did the show last?"},"Options":[{"LatexCode":"23","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"طرح القراءتين قبل تصحيحهما.","En":"Subtracts the displayed readings before correcting them."}},{"LatexCode":"28","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"18","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عكس التصحيحين فقرّب وقتي البداية والنهاية من بعضهما.","En":"Reverses both corrections and brings the times closer together."}},{"LatexCode":"26","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"صحّح ساعة النهاية فقط.","En":"Corrects only the ending clock."}}],"Hints":[{"Ar":"حوّل كل قراءة إلى الوقت الصحيح قبل إيجاد المدة.","En":"Convert each reading to the actual time before finding the duration."},{"Ar":"الساعة السريعة تعرض وقتاً متقدماً، والبطيئة تعرض وقتاً متأخراً عن الوقت الصحيح.","En":"For the fast clock the real time is earlier than its reading. For the slow clock it is later."}],"Solution":{"Idea":{"Ar":"نصحح وقت البداية والنهاية كلّاً على حدة، ثم نطرح البداية من النهاية.","En":"Correct the two clock readings separately, then subtract the start time from the end time."},"FormulaLatex":"D=(35+3)-(12-2)","Steps":[{"Ar":"بدأ العرض عند 4:10 لأننا نطرح دقيقتين من قراءة ساعة البداية.","En":"The show starts at 4:10 after subtracting two minutes from the starting clock."},{"Ar":"انتهى عند 4:38 بعد إضافة ثلاث دقائق إلى قراءة ساعة النهاية. نحسب المدة بين الوقتين.","En":"It ends at 4:38 after adding three minutes to the ending clock. Find the gap between those times."}],"Substitution":{"Ar":"$38-10=28$","En":"$38-10=28$"},"Result":{"Ar":"$28$","En":"$28$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"من 4:10 إلى 4:30 عشرون دقيقة ومن 4:30 إلى 4:38 ثماني دقائق، فيكون المجموع 28.","En":"From 4:10 to 4:30 is twenty minutes and from 4:30 to 4:38 is eight more, totalling 28."},"CommonError":{"Ar":"طرح القراءتين قبل تصحيحهما.","En":"Subtracts the displayed readings before correcting them."}}}$mw$::jsonb,$mw$نصحح وقت البداية والنهاية كلّاً على حدة، ثم نطرح البداية من النهاية.

$D=(35+3)-(12-2)$

1. بدأ العرض عند 4:10 لأننا نطرح دقيقتين من قراءة ساعة البداية.

2. انتهى عند 4:38 بعد إضافة ثلاث دقائق إلى قراءة ساعة النهاية. نحسب المدة بين الوقتين.

$38-10=28$

$28$ دقيقة

من 4:10 إلى 4:30 عشرون دقيقة ومن 4:30 إلى 4:38 ثماني دقائق، فيكون المجموع 28.

طرح القراءتين قبل تصحيحهما.$mw$,$mw$Correct the two clock readings separately, then subtract the start time from the end time.

$D=(35+3)-(12-2)$

1. The show starts at 4:10 after subtracting two minutes from the starting clock.

2. It ends at 4:38 after adding three minutes to the ending clock. Find the gap between those times.

$38-10=28$

$28$ minutes

From 4:10 to 4:30 is twenty minutes and from 4:30 to 4:38 is eight more, totalling 28.

Subtracts the displayed readings before correcting them.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"حوّل كل قراءة إلى الوقت الصحيح قبل إيجاد المدة.","En":"Convert each reading to the actual time before finding the duration."},{"Ar":"الساعة السريعة تعرض وقتاً متقدماً، والبطيئة تعرض وقتاً متأخراً عن الوقت الصحيح.","En":"For the fast clock the real time is earlier than its reading. For the slow clock it is later."}],"Solution":{"Idea":{"Ar":"نصحح وقت البداية والنهاية كلّاً على حدة، ثم نطرح البداية من النهاية.","En":"Correct the two clock readings separately, then subtract the start time from the end time."},"FormulaLatex":"D=(35+3)-(12-2)","Steps":[{"Ar":"بدأ العرض عند 4:10 لأننا نطرح دقيقتين من قراءة ساعة البداية.","En":"The show starts at 4:10 after subtracting two minutes from the starting clock."},{"Ar":"انتهى عند 4:38 بعد إضافة ثلاث دقائق إلى قراءة ساعة النهاية. نحسب المدة بين الوقتين.","En":"It ends at 4:38 after adding three minutes to the ending clock. Find the gap between those times."}],"Substitution":{"Ar":"$38-10=28$","En":"$38-10=28$"},"Result":{"Ar":"$28$","En":"$28$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"من 4:10 إلى 4:30 عشرون دقيقة ومن 4:30 إلى 4:38 ثماني دقائق، فيكون المجموع 28.","En":"From 4:10 to 4:30 is twenty minutes and from 4:30 to 4:38 is eight more, totalling 28."},"CommonError":{"Ar":"طرح القراءتين قبل تصحيحهما.","En":"Subtracts the displayed readings before correcting them."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"طرح القراءتين قبل تصحيحهما.","En":"Subtracts the displayed readings before correcting them."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"عكس التصحيحين فقرّب وقتي البداية والنهاية من بعضهما.","En":"Reverses both corrections and brings the times closer together."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"صحّح ساعة النهاية فقط.","En":"Corrects only the ending clock."},"Order":4}]}$mw$),
($mw$growth-v15-grade-3-extra-perimeter-after-straight-cut-1$mw$,$mw$extra-perimeter-after-straight-cut$mw$,$mw$primary-perimeter$mw$,$mw$grade-3$mw$,3,1,3,12,$mw${"StageId":1,"CategoryId":3,"PrimarySkillId":12,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"حافّتان جديدتان بعد القصّ","En":"Two new edges after cutting"},"Question":{"Ar":"قصّت منى ورقة مستطيلة أبعادها 10 سم و6 سم بخط مستقيم طوله 6 سم موازٍ للضلع القصير، فقسمتها إلى مستطيلين. بكم يزيد مجموع محيطي القطعتين على محيط الورقة الأصلية؟","En":"Mona cuts a 10 cm by 6 cm rectangle along a straight 6 cm line parallel to the short side, making two rectangles. By how much does the sum of their perimeters exceed the original perimeter?"},"Options":[{"LatexCode":"6","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ حافة القصّ في قطعة واحدة.","En":"Counts the cut edge on only one piece."}},{"LatexCode":"0","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"افترض أن حفظ المساحة يحفظ مجموع المحيطين.","En":"Assumes preserving area also preserves total perimeter."}},{"LatexCode":"12","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"32","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"أعطى محيط الورقة قبل القصّ.","En":"Gives the perimeter before cutting."}}],"Hints":[{"Ar":"تتبّع حدود الورقة الأصلية بعد فصل القطعتين.","En":"Trace the original outer boundary after separating the two pieces."},{"Ar":"كم حافة جديدة بطول خط القصّ تظهر عند الفصل؟","En":"How many new edges as long as the cut appear after separation?"}],"Solution":{"Idea":{"Ar":"تبقى جميع الحواف الخارجية، ويضيف القطع حافتين جديدتين متساويتين.","En":"All exterior edges remain; the cut adds two equal new edges."},"FormulaLatex":"P_1+P_2-P=2c","Steps":[{"Ar":"يبقى كل جزء من حواف الورقة الخارجية حافةً لقطعة واحدة، فلا يتغير مجموع أطوال تلك الأجزاء.","En":"Each part of the original outer boundary remains on one piece, so the sum of those lengths stays the same."},{"Ar":"يُضاف للمجموع ضلع طوله 6 سم في كل قطعة، كلاهما بمحاذاة خط القصّ.","En":"Each piece gains one 6 cm edge along the cut."}],"Substitution":{"Ar":"$6+6=12$","En":"$6+6=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"لو كان القصّ في المنتصف لكان محيط كل مستطيل 5 × 6 هو 22 سم. المجموع 44 مقابل 32 سم للورقة، بزيادة 12 سم.","En":"A central cut would give two 5 by 6 rectangles of perimeter 22 cm each. Their total 44 cm exceeds the original 32 cm by 12 cm."},"CommonError":{"Ar":"عدّ حافة القصّ في قطعة واحدة.","En":"Counts the cut edge on only one piece."}}}$mw$::jsonb,$mw$تبقى جميع الحواف الخارجية، ويضيف القطع حافتين جديدتين متساويتين.

$P_1+P_2-P=2c$

1. يبقى كل جزء من حواف الورقة الخارجية حافةً لقطعة واحدة، فلا يتغير مجموع أطوال تلك الأجزاء.

2. يُضاف للمجموع ضلع طوله 6 سم في كل قطعة، كلاهما بمحاذاة خط القصّ.

$6+6=12$

$12$ سم

لو كان القصّ في المنتصف لكان محيط كل مستطيل 5 × 6 هو 22 سم. المجموع 44 مقابل 32 سم للورقة، بزيادة 12 سم.

عدّ حافة القصّ في قطعة واحدة.$mw$,$mw$All exterior edges remain; the cut adds two equal new edges.

$P_1+P_2-P=2c$

1. Each part of the original outer boundary remains on one piece, so the sum of those lengths stays the same.

2. Each piece gains one 6 cm edge along the cut.

$6+6=12$

$12$ cm

A central cut would give two 5 by 6 rectangles of perimeter 22 cm each. Their total 44 cm exceeds the original 32 cm by 12 cm.

Counts the cut edge on only one piece.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"تتبّع حدود الورقة الأصلية بعد فصل القطعتين.","En":"Trace the original outer boundary after separating the two pieces."},{"Ar":"كم حافة جديدة بطول خط القصّ تظهر عند الفصل؟","En":"How many new edges as long as the cut appear after separation?"}],"Solution":{"Idea":{"Ar":"تبقى جميع الحواف الخارجية، ويضيف القطع حافتين جديدتين متساويتين.","En":"All exterior edges remain; the cut adds two equal new edges."},"FormulaLatex":"P_1+P_2-P=2c","Steps":[{"Ar":"يبقى كل جزء من حواف الورقة الخارجية حافةً لقطعة واحدة، فلا يتغير مجموع أطوال تلك الأجزاء.","En":"Each part of the original outer boundary remains on one piece, so the sum of those lengths stays the same."},{"Ar":"يُضاف للمجموع ضلع طوله 6 سم في كل قطعة، كلاهما بمحاذاة خط القصّ.","En":"Each piece gains one 6 cm edge along the cut."}],"Substitution":{"Ar":"$6+6=12$","En":"$6+6=12$"},"Result":{"Ar":"$12$","En":"$12$"},"Unit":{"Ar":"سم","En":"cm"},"Verification":{"Ar":"لو كان القصّ في المنتصف لكان محيط كل مستطيل 5 × 6 هو 22 سم. المجموع 44 مقابل 32 سم للورقة، بزيادة 12 سم.","En":"A central cut would give two 5 by 6 rectangles of perimeter 22 cm each. Their total 44 cm exceeds the original 32 cm by 12 cm."},"CommonError":{"Ar":"عدّ حافة القصّ في قطعة واحدة.","En":"Counts the cut edge on only one piece."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عدّ حافة القصّ في قطعة واحدة.","En":"Counts the cut edge on only one piece."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"افترض أن حفظ المساحة يحفظ مجموع المحيطين.","En":"Assumes preserving area also preserves total perimeter."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"أعطى محيط الورقة قبل القصّ.","En":"Gives the perimeter before cutting."},"Order":4}]}$mw$),
($mw$growth-v15-grade-3-cyclic-distribution-last-tray-1$mw$,$mw$cyclic-distribution-last-tray$mw$,$mw$primary-division$mw$,$mw$grade-3$mw$,3,1,33,5,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":5,"SecondarySkillIds":[],"TrackIds":[3],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"أين تستقر البطاقة الأخيرة؟","En":"Where does the last card land?"},"Question":{"Ar":"توزّع هناء 26 بطاقة، واحدة تلو الأخرى، على أربعة أطباق مرقّمة. تبدأ بالطبق 1 ثم 2 ثم 3 ثم 4 وتعود إلى 1، وتكرّر ذلك حتى تنتهي البطاقات. ما رقم الطبق الذي يستقبل البطاقة الأخيرة؟","En":"Hana deals 26 cards one at a time into four numbered trays. She visits trays 1, 2, 3 and 4 in order, returns to 1, and repeats until the cards run out. Which tray number receives the last card?"},"Options":[{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"بدأ دورة جديدة لكنه لم يتقدّم بعد البطاقة 25.","En":"Starts the new round but stops at card 25."}},{"LatexCode":"3","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"تحرّك خطوتين بعد الطبق الأول بدلاً من عدّ البطاقة 25 فيه.","En":"Moves two steps past tray one instead of counting card 25 there."}},{"LatexCode":"4","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"توقّف عند نهاية آخر دورة كاملة.","En":"Stops at the end of the last full round."}},{"LatexCode":"2","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}}],"Hints":[{"Ar":"بعد كل أربع بطاقات تكتمل دورة وتبدأ التالية من الطبق الأول.","En":"Every four cards finish a round and the next round starts at tray one."},{"Ar":"أوجد أكبر مضاعف للعدد 4 لا يتجاوز 26، ثم تتبّع البطاقات الباقية.","En":"Find the greatest multiple of 4 no larger than 26 and trace the remaining cards."}],"Solution":{"Idea":{"Ar":"كل أربع بطاقات تشكل دورة كاملة؛ الباقي يحدد موضع البطاقة الأخيرة.","En":"Every four cards form one complete cycle; the remainder identifies the last tray."},"FormulaLatex":"26=4q+r","Steps":[{"Ar":"تملأ البطاقات الأربع والعشرون الأولى ست دورات، وتنتهي البطاقة 24 في الطبق الرابع.","En":"The first 24 cards fill six rounds, with card 24 landing in tray four."},{"Ar":"تذهب البطاقة 25 إلى الطبق الأول والتي تليها إلى الطبق الثاني.","En":"Card 25 goes to tray one and the next to tray two."}],"Substitution":{"Ar":"$26=4(6)+2$","En":"$26=4(6)+2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"رقم الطبق","En":"tray number"},"Verification":{"Ar":"أرقام البطاقات التي تصل إلى الطبق الثاني هي 2 و6 و10 و14 و18 و22 و26.","En":"Tray two receives cards 2, 6, 10, 14, 18, 22 and 26."},"CommonError":{"Ar":"بدأ دورة جديدة لكنه لم يتقدّم بعد البطاقة 25.","En":"Starts the new round but stops at card 25."}}}$mw$::jsonb,$mw$كل أربع بطاقات تشكل دورة كاملة؛ الباقي يحدد موضع البطاقة الأخيرة.

$26=4q+r$

1. تملأ البطاقات الأربع والعشرون الأولى ست دورات، وتنتهي البطاقة 24 في الطبق الرابع.

2. تذهب البطاقة 25 إلى الطبق الأول والتي تليها إلى الطبق الثاني.

$26=4(6)+2$

$2$ رقم الطبق

أرقام البطاقات التي تصل إلى الطبق الثاني هي 2 و6 و10 و14 و18 و22 و26.

بدأ دورة جديدة لكنه لم يتقدّم بعد البطاقة 25.$mw$,$mw$Every four cards form one complete cycle; the remainder identifies the last tray.

$26=4q+r$

1. The first 24 cards fill six rounds, with card 24 landing in tray four.

2. Card 25 goes to tray one and the next to tray two.

$26=4(6)+2$

$2$ tray number

Tray two receives cards 2, 6, 10, 14, 18, 22 and 26.

Starts the new round but stops at card 25.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"بعد كل أربع بطاقات تكتمل دورة وتبدأ التالية من الطبق الأول.","En":"Every four cards finish a round and the next round starts at tray one."},{"Ar":"أوجد أكبر مضاعف للعدد 4 لا يتجاوز 26، ثم تتبّع البطاقات الباقية.","En":"Find the greatest multiple of 4 no larger than 26 and trace the remaining cards."}],"Solution":{"Idea":{"Ar":"كل أربع بطاقات تشكل دورة كاملة؛ الباقي يحدد موضع البطاقة الأخيرة.","En":"Every four cards form one complete cycle; the remainder identifies the last tray."},"FormulaLatex":"26=4q+r","Steps":[{"Ar":"تملأ البطاقات الأربع والعشرون الأولى ست دورات، وتنتهي البطاقة 24 في الطبق الرابع.","En":"The first 24 cards fill six rounds, with card 24 landing in tray four."},{"Ar":"تذهب البطاقة 25 إلى الطبق الأول والتي تليها إلى الطبق الثاني.","En":"Card 25 goes to tray one and the next to tray two."}],"Substitution":{"Ar":"$26=4(6)+2$","En":"$26=4(6)+2$"},"Result":{"Ar":"$2$","En":"$2$"},"Unit":{"Ar":"رقم الطبق","En":"tray number"},"Verification":{"Ar":"أرقام البطاقات التي تصل إلى الطبق الثاني هي 2 و6 و10 و14 و18 و22 و26.","En":"Tray two receives cards 2, 6, 10, 14, 18, 22 and 26."},"CommonError":{"Ar":"بدأ دورة جديدة لكنه لم يتقدّم بعد البطاقة 25.","En":"Starts the new round but stops at card 25."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"بدأ دورة جديدة لكنه لم يتقدّم بعد البطاقة 25.","En":"Starts the new round but stops at card 25."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"تحرّك خطوتين بعد الطبق الأول بدلاً من عدّ البطاقة 25 فيه.","En":"Moves two steps past tray one instead of counting card 25 there."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"توقّف عند نهاية آخر دورة كاملة.","En":"Stops at the end of the last full round."},"Order":3},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":4}]}$mw$),
($mw$growth-v15-grade-4-wait-for-both-tasks-1$mw$,$mw$wait-for-both-tasks$mw$,$mw$time$mw$,$mw$grade-4$mw$,4,1,82,324,$mw${"StageId":1,"CategoryId":82,"PrimarySkillId":324,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"متى يبدأ التغليف؟","En":"When can packing start?"},"Question":{"Ar":"في المرسم يبدأ طلاء الصناديق وطباعة الملصقات معاً. يستغرق الطلاء 18 دقيقة والطباعة 25 دقيقة. يبدأ التغليف فور انتهاء العملين ويستغرق 7 دقائق. كم دقيقة تمرّ من البداية حتى نهاية التغليف؟","En":"At an art studio, painting boxes and printing labels start together. Painting takes 18 minutes and printing takes 25 minutes. Packing starts as soon as both jobs finish and takes 7 minutes. How many minutes elapse from the start until packing is complete?"},"Options":[{"LatexCode":"32","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"50","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع الأزمنة الثلاثة وكأن العملين الأولين متتابعان.","En":"Adds all three durations as if the first two jobs were consecutive."}},{"LatexCode":"25","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"توقف عند اكتمال الطباعة وأغفل التغليف.","En":"Stops when printing finishes and omits packing."}},{"LatexCode":"43","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"جمع زمني الطلاء والطباعة ولم يحسب التغليف.","En":"Adds the painting and printing times and leaves out packing."}}],"Hints":[{"Ar":"ارسم خطاً زمنياً لكل من الطلاء والطباعة من نقطة البداية نفسها.","En":"Draw a timeline for each of painting and printing from the same starting point."},{"Ar":"أي العملين يحدّد وقت بدء التغليف؟ أضف زمن التغليف إلى وقت انتهاء ذلك العمل.","En":"Which job determines when packing can start? Add the packing time to that job’s finishing time."}],"Solution":{"Idea":{"Ar":"ينتهي العملان المتوازيان عند انتهاء الأطول، ثم يبدأ التغليف.","En":"The parallel jobs finish when the longer job finishes, then packing begins."},"FormulaLatex":"T=\\max(t_1,t_2)+p","Steps":[{"Ar":"عند الدقيقة 18 ينتهي الطلاء، وتستمر الطباعة حتى الدقيقة 25.","En":"Painting ends at minute 18, while printing continues until minute 25."},{"Ar":"تبدأ الدقائق السبع المخصّصة للتغليف عند الدقيقة 25.","En":"The seven minutes of packing start at minute 25."}],"Substitution":{"Ar":"$25+7=32$","En":"$25+7=32$"},"Result":{"Ar":"$32$","En":"$32$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"إذا انتهى التغليف عند الدقيقة 32 فبدايته عند الدقيقة 25، وهي لحظة انتهاء آخر العملين.","En":"Finishing at minute 32 places the start of packing at minute 25, exactly when the last preparation job ends."},"CommonError":{"Ar":"جمع الأزمنة الثلاثة وكأن العملين الأولين متتابعان.","En":"Adds all three durations as if the first two jobs were consecutive."}}}$mw$::jsonb,$mw$ينتهي العملان المتوازيان عند انتهاء الأطول، ثم يبدأ التغليف.

$T=\max(t_1,t_2)+p$

1. عند الدقيقة 18 ينتهي الطلاء، وتستمر الطباعة حتى الدقيقة 25.

2. تبدأ الدقائق السبع المخصّصة للتغليف عند الدقيقة 25.

$25+7=32$

$32$ دقيقة

إذا انتهى التغليف عند الدقيقة 32 فبدايته عند الدقيقة 25، وهي لحظة انتهاء آخر العملين.

جمع الأزمنة الثلاثة وكأن العملين الأولين متتابعان.$mw$,$mw$The parallel jobs finish when the longer job finishes, then packing begins.

$T=\max(t_1,t_2)+p$

1. Painting ends at minute 18, while printing continues until minute 25.

2. The seven minutes of packing start at minute 25.

$25+7=32$

$32$ minutes

Finishing at minute 32 places the start of packing at minute 25, exactly when the last preparation job ends.

Adds all three durations as if the first two jobs were consecutive.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"ارسم خطاً زمنياً لكل من الطلاء والطباعة من نقطة البداية نفسها.","En":"Draw a timeline for each of painting and printing from the same starting point."},{"Ar":"أي العملين يحدّد وقت بدء التغليف؟ أضف زمن التغليف إلى وقت انتهاء ذلك العمل.","En":"Which job determines when packing can start? Add the packing time to that job’s finishing time."}],"Solution":{"Idea":{"Ar":"ينتهي العملان المتوازيان عند انتهاء الأطول، ثم يبدأ التغليف.","En":"The parallel jobs finish when the longer job finishes, then packing begins."},"FormulaLatex":"T=\\max(t_1,t_2)+p","Steps":[{"Ar":"عند الدقيقة 18 ينتهي الطلاء، وتستمر الطباعة حتى الدقيقة 25.","En":"Painting ends at minute 18, while printing continues until minute 25."},{"Ar":"تبدأ الدقائق السبع المخصّصة للتغليف عند الدقيقة 25.","En":"The seven minutes of packing start at minute 25."}],"Substitution":{"Ar":"$25+7=32$","En":"$25+7=32$"},"Result":{"Ar":"$32$","En":"$32$"},"Unit":{"Ar":"دقيقة","En":"minutes"},"Verification":{"Ar":"إذا انتهى التغليف عند الدقيقة 32 فبدايته عند الدقيقة 25، وهي لحظة انتهاء آخر العملين.","En":"Finishing at minute 32 places the start of packing at minute 25, exactly when the last preparation job ends."},"CommonError":{"Ar":"جمع الأزمنة الثلاثة وكأن العملين الأولين متتابعان.","En":"Adds all three durations as if the first two jobs were consecutive."}},"Distractors":[{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"جمع الأزمنة الثلاثة وكأن العملين الأولين متتابعان.","En":"Adds all three durations as if the first two jobs were consecutive."},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"توقف عند اكتمال الطباعة وأغفل التغليف.","En":"Stops when printing finishes and omits packing."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"جمع زمني الطلاء والطباعة ولم يحسب التغليف.","En":"Adds the painting and printing times and leaves out packing."},"Order":4}]}$mw$),
($mw$growth-v15-grade-4-pay-for-complete-promotional-groups-1$mw$,$mw$pay-for-complete-promotional-groups$mw$,$mw$primary-multiplicative-word-problems$mw$,$mw$grade-4$mw$,4,1,33,6,$mw${"StageId":1,"CategoryId":33,"PrimarySkillId":6,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":3,"Points":10,"Title":{"Ar":"عرض على الدفاتر","En":"A notebook offer"},"Question":{"Ar":"ثمن الدفتر 4 ريالات. من كل ثلاثة دفاتر يأخذها الزبون يدفع ثمن اثنين فقط، ويحاسَب على أي دفتر خارج المجموعات الثلاثية بسعره الكامل. أخذت نور 11 دفتراً. كم ريالاً تدفع؟","En":"A notebook costs 4 riyals. For every three notebooks taken, the customer pays for only two. Any notebooks left outside complete groups of three cost full price. Noor takes 11 notebooks. How many riyals does she pay?"},"Options":[{"LatexCode":"44","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حسب ثمن الدفاتر كلها بالسعر الكامل.","En":"Charges full price for all notebooks."}},{"LatexCode":"32","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"24","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"حاسب على المجموعات وأغفل الدفترين الباقيين.","En":"Charges for the groups and omits the two leftover notebooks."}},{"LatexCode":"28","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"منح دفتراً مجانياً للمجموعة الرابعة غير المكتملة.","En":"Awards a free notebook to an incomplete fourth group."}}],"Hints":[{"Ar":"قسّم الدفاتر إلى مجموعات كاملة من ثلاثة ثم عدّ الباقي.","En":"Make complete groups of three notebooks and count the remainder."},{"Ar":"احسب عدد الدفاتر المدفوعة في المجموعات، ثم أضف الدفاتر الباقية.","En":"Count paid notebooks in the complete groups, then add the remaining notebooks."}],"Solution":{"Idea":{"Ar":"نفصل المجموعات الثلاثية الكاملة عن الباقي، لأن الخصم لا يشمل المجموعات الناقصة.","En":"Separate complete groups of three from the remainder; incomplete groups receive no discount."},"FormulaLatex":"n=3g+r,\\quad C=(2g+r)p","Steps":[{"Ar":"تضمّ ثلاث مجموعات كاملة تسعة دفاتر ويبقى دفتران.","En":"Three complete groups use nine notebooks and leave two."},{"Ar":"تدفع نور ثمن ستة دفاتر من المجموعات وثمن الدفترين الباقيين.","En":"Noor pays for six notebooks in the groups and both remaining notebooks."}],"Substitution":{"Ar":"$(3\\times2+2)\\times4=32$","En":"$(3\\times2+2)\\times4=32$"},"Result":{"Ar":"$32$","En":"$32$"},"Unit":{"Ar":"ريالاً","En":"riyals"},"Verification":{"Ar":"السعر قبل العرض 44 ريالاً. تُعفى نور من ثمن ثلاثة دفاتر، أي 12 ريالاً، فيبقى 32 ريالاً.","En":"The full price is 44 riyals. Three free notebooks save 12 riyals, leaving 32 riyals."},"CommonError":{"Ar":"حسب ثمن الدفاتر كلها بالسعر الكامل.","En":"Charges full price for all notebooks."}}}$mw$::jsonb,$mw$نفصل المجموعات الثلاثية الكاملة عن الباقي، لأن الخصم لا يشمل المجموعات الناقصة.

$n=3g+r,\quad C=(2g+r)p$

1. تضمّ ثلاث مجموعات كاملة تسعة دفاتر ويبقى دفتران.

2. تدفع نور ثمن ستة دفاتر من المجموعات وثمن الدفترين الباقيين.

$(3\times2+2)\times4=32$

$32$ ريالاً

السعر قبل العرض 44 ريالاً. تُعفى نور من ثمن ثلاثة دفاتر، أي 12 ريالاً، فيبقى 32 ريالاً.

حسب ثمن الدفاتر كلها بالسعر الكامل.$mw$,$mw$Separate complete groups of three from the remainder; incomplete groups receive no discount.

$n=3g+r,\quad C=(2g+r)p$

1. Three complete groups use nine notebooks and leave two.

2. Noor pays for six notebooks in the groups and both remaining notebooks.

$(3\times2+2)\times4=32$

$32$ riyals

The full price is 44 riyals. Three free notebooks save 12 riyals, leaving 32 riyals.

Charges full price for all notebooks.$mw$,$mw${"DifficultyLevel":3,"Hints":[{"Ar":"قسّم الدفاتر إلى مجموعات كاملة من ثلاثة ثم عدّ الباقي.","En":"Make complete groups of three notebooks and count the remainder."},{"Ar":"احسب عدد الدفاتر المدفوعة في المجموعات، ثم أضف الدفاتر الباقية.","En":"Count paid notebooks in the complete groups, then add the remaining notebooks."}],"Solution":{"Idea":{"Ar":"نفصل المجموعات الثلاثية الكاملة عن الباقي، لأن الخصم لا يشمل المجموعات الناقصة.","En":"Separate complete groups of three from the remainder; incomplete groups receive no discount."},"FormulaLatex":"n=3g+r,\\quad C=(2g+r)p","Steps":[{"Ar":"تضمّ ثلاث مجموعات كاملة تسعة دفاتر ويبقى دفتران.","En":"Three complete groups use nine notebooks and leave two."},{"Ar":"تدفع نور ثمن ستة دفاتر من المجموعات وثمن الدفترين الباقيين.","En":"Noor pays for six notebooks in the groups and both remaining notebooks."}],"Substitution":{"Ar":"$(3\\times2+2)\\times4=32$","En":"$(3\\times2+2)\\times4=32$"},"Result":{"Ar":"$32$","En":"$32$"},"Unit":{"Ar":"ريالاً","En":"riyals"},"Verification":{"Ar":"السعر قبل العرض 44 ريالاً. تُعفى نور من ثمن ثلاثة دفاتر، أي 12 ريالاً، فيبقى 32 ريالاً.","En":"The full price is 44 riyals. Three free notebooks save 12 riyals, leaving 32 riyals."},"CommonError":{"Ar":"حسب ثمن الدفاتر كلها بالسعر الكامل.","En":"Charges full price for all notebooks."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"حسب ثمن الدفاتر كلها بالسعر الكامل.","En":"Charges full price for all notebooks."},"Order":1},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":2},{"ErrorType":"misconception","Reason":{"Ar":"حاسب على المجموعات وأغفل الدفترين الباقيين.","En":"Charges for the groups and omits the two leftover notebooks."},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"منح دفتراً مجانياً للمجموعة الرابعة غير المكتملة.","En":"Awards a free notebook to an incomplete fourth group."},"Order":4}]}$mw$),
($mw$growth-v15-grade-4-coincident-fraction-marks-1$mw$,$mw$coincident-fraction-marks$mw$,$mw$p-fractions-decimals-equivalence$mw$,$mw$grade-4$mw$,4,1,21,96,$mw${"StageId":1,"CategoryId":21,"PrimarySkillId":96,"SecondarySkillIds":[],"TrackIds":[4],"DifficultyLevel":4,"Points":10,"Title":{"Ar":"علامات فوق شريط واحد","En":"Marks on one strip"},"Question":{"Ar":"على شريط واحد عُلّمت حدود أرباعه بالأزرق وحدود أسداسه بالأحمر. استُبعد طرفا الشريط من العدّ. كم موضعاً داخلياً يحمل علامة حمراء أو زرقاء أو كلتيهما؟","En":"On one strip the quarter divisions are marked blue and the sixth divisions red. The two endpoints are excluded. How many distinct interior positions carry a red mark, a blue mark, or both?"},"Options":[{"LatexCode":"8","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ موضع النصف مرتين.","En":"Counts the midpoint twice."}},{"LatexCode":"9","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"ضمّ طرفي الشريط إلى المواضع السبعة.","En":"Includes both endpoints along with the seven interior positions."}},{"LatexCode":"7","IsCorrect":true,"ErrorType":"","Reason":{"Ar":"","En":""}},{"LatexCode":"1","IsCorrect":false,"ErrorType":"misconception","Reason":{"Ar":"عدّ الموضع المشترك فقط.","En":"Counts only the shared position."}}],"Hints":[{"Ar":"تخيّل الشريط مقسّماً إلى اثني عشر جزءاً متساوياً.","En":"Imagine the strip divided into twelfths."},{"Ar":"اكتب مواضع علامات كل لون بالأجزاء من اثني عشر وحدّد الموضع الذي ظهر مرتين.","En":"List each colour’s marks in twelfths and identify the position that appears twice."}],"Solution":{"Idea":{"Ar":"نوحد المقامات لتمييز مواضع العلامات، ونعد الموضع المشترك مرة واحدة.","En":"Use a common denominator to identify mark positions, counting coincident marks only once."},"FormulaLatex":"\\frac14=\\frac3{12},\\quad\\frac16=\\frac2{12}","Steps":[{"Ar":"علامات الأرباع عند الأجزاء 3 و6 و9 من اثني عشر، وعلامات الأسداس عند 2 و4 و6 و8 و10.","En":"Quarter marks lie at 3, 6 and 9 twelfths. Sixth marks lie at 2, 4, 6, 8 and 10 twelfths."},{"Ar":"علامة النصف مشتركة بين اللونين فتُحسب مرة واحدة.","En":"The halfway mark is shared by the two colours, so count it once."}],"Substitution":{"Ar":"$3+5-1=7$","En":"$3+5-1=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"مواضع","En":"positions"},"Verification":{"Ar":"المواضع الداخلية المعلّمة مرتّبة هي الأجزاء 2، 3، 4، 6، 8، 9، 10 من اثني عشر.","En":"In order, the marked interior positions are 2, 3, 4, 6, 8, 9 and 10 twelfths."},"CommonError":{"Ar":"لا تعدّ علامة النصف مرتين، ولا تضف الطرفين المستبعدين.","En":"Do not double-count the midpoint or add the excluded endpoints."}}}$mw$::jsonb,$mw$نوحد المقامات لتمييز مواضع العلامات، ونعد الموضع المشترك مرة واحدة.

$\frac14=\frac3{12},\quad\frac16=\frac2{12}$

1. علامات الأرباع عند الأجزاء 3 و6 و9 من اثني عشر، وعلامات الأسداس عند 2 و4 و6 و8 و10.

2. علامة النصف مشتركة بين اللونين فتُحسب مرة واحدة.

$3+5-1=7$

$7$ مواضع

المواضع الداخلية المعلّمة مرتّبة هي الأجزاء 2، 3، 4، 6، 8، 9، 10 من اثني عشر.

لا تعدّ علامة النصف مرتين، ولا تضف الطرفين المستبعدين.$mw$,$mw$Use a common denominator to identify mark positions, counting coincident marks only once.

$\frac14=\frac3{12},\quad\frac16=\frac2{12}$

1. Quarter marks lie at 3, 6 and 9 twelfths. Sixth marks lie at 2, 4, 6, 8 and 10 twelfths.

2. The halfway mark is shared by the two colours, so count it once.

$3+5-1=7$

$7$ positions

In order, the marked interior positions are 2, 3, 4, 6, 8, 9 and 10 twelfths.

Do not double-count the midpoint or add the excluded endpoints.$mw$,$mw${"DifficultyLevel":4,"Hints":[{"Ar":"تخيّل الشريط مقسّماً إلى اثني عشر جزءاً متساوياً.","En":"Imagine the strip divided into twelfths."},{"Ar":"اكتب مواضع علامات كل لون بالأجزاء من اثني عشر وحدّد الموضع الذي ظهر مرتين.","En":"List each colour’s marks in twelfths and identify the position that appears twice."}],"Solution":{"Idea":{"Ar":"نوحد المقامات لتمييز مواضع العلامات، ونعد الموضع المشترك مرة واحدة.","En":"Use a common denominator to identify mark positions, counting coincident marks only once."},"FormulaLatex":"\\frac14=\\frac3{12},\\quad\\frac16=\\frac2{12}","Steps":[{"Ar":"علامات الأرباع عند الأجزاء 3 و6 و9 من اثني عشر، وعلامات الأسداس عند 2 و4 و6 و8 و10.","En":"Quarter marks lie at 3, 6 and 9 twelfths. Sixth marks lie at 2, 4, 6, 8 and 10 twelfths."},{"Ar":"علامة النصف مشتركة بين اللونين فتُحسب مرة واحدة.","En":"The halfway mark is shared by the two colours, so count it once."}],"Substitution":{"Ar":"$3+5-1=7$","En":"$3+5-1=7$"},"Result":{"Ar":"$7$","En":"$7$"},"Unit":{"Ar":"مواضع","En":"positions"},"Verification":{"Ar":"المواضع الداخلية المعلّمة مرتّبة هي الأجزاء 2، 3، 4، 6، 8، 9، 10 من اثني عشر.","En":"In order, the marked interior positions are 2, 3, 4, 6, 8, 9 and 10 twelfths."},"CommonError":{"Ar":"لا تعدّ علامة النصف مرتين، ولا تضف الطرفين المستبعدين.","En":"Do not double-count the midpoint or add the excluded endpoints."}},"Distractors":[{"ErrorType":"misconception","Reason":{"Ar":"عدّ موضع النصف مرتين.","En":"Counts the midpoint twice."},"Order":1},{"ErrorType":"misconception","Reason":{"Ar":"ضمّ طرفي الشريط إلى المواضع السبعة.","En":"Includes both endpoints along with the seven interior positions."},"Order":2},{"ErrorType":"","Reason":{"Ar":"","En":""},"Order":3},{"ErrorType":"misconception","Reason":{"Ar":"عدّ الموضع المشترك فقط.","En":"Counts only the shared position."},"Order":4}]}$mw$);
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
