import {authoredCandidate} from './authored-candidate.mjs';

const rows = [
  {
    scope: ["grade-2", 1, 82, 321, "length"], family: "overlap-joined-strip-length", difficulty: 3,
    title: ["طول شريطين متداخلين", "Length of overlapping strips"],
    question: ["وُضع شريطان طولهما 24 سم و19 سم على خط مستقيم، بحيث تراكب طرفاهما مسافة 5 سم. ما الطول من أبعد طرف إلى أبعد طرف؟", "Two strips of lengths 24 cm and 19 cm lie along one straight line with 5 cm of overlap at their ends. What is the length from one outer end to the other?"],
    hints: [["حدد الجزء المشترك بين الشريطين.", "Identify the part shared by both strips."], ["عند جمع الطولين، يُحسب الجزء المشترك مرتين.", "Adding both lengths counts the overlap twice."]],
    formula: "L=a+b-o",
    steps: [["اجمع الطولين فتحصل على 43 سم قبل تصحيح التداخل.", "Add both lengths to get 43 cm before correcting the overlap."], ["اطرح 5 سم مرة واحدة ليبقى الجزء المشترك محسوباً مرة واحدة.", "Subtract 5 cm once so that the common part is counted once."]],
    substitution: "24+19-5=38", answer: "38", unit: ["سم", "cm"],
    verify: ["الشريط الثاني يمد الطرف بمقدار 14 سم فقط، و24 + 14 = 38.", "The second strip extends the first by only 14 cm, giving 24 + 14 = 38."],
    wrong: [["43", "ترك التداخل محسوباً مرتين.", "Counts the overlap twice."], ["33", "حذف الجزء المشترك من الشريطين كليهما.", "Removes the shared part from both strips."], ["14", "أجاب بالامتداد وحده.", "Reports only the extension."]],
  },
  {
    scope: ["grade-7", 2, 7, 31, "middle-unit-rates"], family: "equal-distance-average-speed", difficulty: 4,
    title: ["السرعة المتوسطة لمسافتين متساويتين", "Average speed over two equal distances"],
    question: ["قطع درّاج 12 كم بسرعة 12 كم/ساعة ثم 12 كم أخرى بسرعة 6 كم/ساعة دون توقف. ما سرعته المتوسطة للرحلة؟", "A cyclist rides 12 km at 12 km/h and then another 12 km at 6 km/h without stopping. What is the average speed for the trip?"],
    hints: [["احسب زمن كل جزء بقسمة المسافة على سرعته.", "Divide each leg's distance by its speed to find the elapsed time."], ["اقسم المسافة الكلية على الزمن الكلي.", "Divide the total distance by the total time."]],
    formula: "v_{\\mathrm{avg}}=\\frac{d_1+d_2}{d_1/v_1+d_2/v_2}",
    steps: [["يستغرق الجزء الأول ساعة والثاني ساعتين.", "The first leg takes one hour and the second takes two hours."], ["إجمالي المسافة 24 كم والزمن 3 ساعات.", "The trip covers 24 km in three hours."]],
    substitution: "(12+12)/(1+2)=8", answer: "8", unit: ["كم/ساعة", "km/h"],
    verify: ["خلال 3 ساعات بسرعة ثابتة 8 كم/ساعة يقطع المسافة الكلية نفسها.", "At a constant 8 km/h for three hours, the same total distance is covered."],
    wrong: [["9", "أخذ متوسط السرعتين رغم اختلاف الزمنين.", "Averages the speeds despite unequal times."], ["24", "أجاب بالمسافة الكلية.", "Reports total distance."], ["4", "قسّم مسافة جزء واحد على زمن الرحلة كلها.", "Uses only one leg's distance with the entire trip time."]],
  },
  {
    scope: ["grade-8", 2, 34, 37, "middle-pythagorean-theorem"], family: "rectangle-diagonal-compares-opening", difficulty: 4,
    title: ["تحديد إمكان مرور قضيب في مستوى فتحة", "Checking a rod against an opening in a plane"],
    question: ["فتحة مستطيلة أبعادها 9 سم و12 سم. يُوضَع قضيب مستقيم طوله 16 سم في مستوى الفتحة تماماً، دون إمالته خارج المستوى. بكم يزيد طول القضيب على أكبر مسافة مستقيمة داخل الفتحة أو على حافتها؟", "A rectangular opening measures 9 cm by 12 cm. A straight 16 cm rod stays entirely in the plane of the opening without tilting out of plane. By how much does its length exceed the greatest straight-line distance within or on the opening?"],
    hints: [["ابحث عن نقطتين متقابلتين تعطيان أطول قطعة داخل المستطيل.", "Find the two opposite points giving the longest segment within the rectangle."], ["احسب القطر بفيثاغورس قبل مقارنته بطول القضيب.", "Use Pythagoras to find the diagonal before comparing it with the rod."]],
    formula: "d=\\sqrt{a^2+b^2}",
    steps: [["أكبر فرقين أفقي ورأسي هما 12 و9، ويتحققان معاً عند زاويتين متقابلتين.", "The greatest horizontal and vertical separations are 12 and 9, attained together at opposite corners."], ["القطر 15 سم. اطرحه من طول القضيب.", "The diagonal is 15 cm. Subtract it from the rod's length."]],
    substitution: "16-\\sqrt{9^2+12^2}=1", answer: "1", unit: ["سم", "cm"],
    verify: ["225 = 81 + 144، ومن ثم 15 سم يساوي طول القطر.", "225 = 81 + 144, so 15 cm is the diagonal length."],
    wrong: [["4", "قارن القضيب بالضلع الأطول فقط.", "Compares the rod only with the longer side."], ["7", "قارن القضيب بالضلع الأقصر.", "Compares the rod with the shorter side."], ["15", "أجاب بطول القطر قبل المقارنة.", "Reports just the diagonal length."]],
  },
  {
    scope: ["grade-10", 3, 88, 329, "coordinate-lines"], family: "perpendicular-offset-intercept", difficulty: 4,
    title: ["مقطع مستقيم عمودي معلوم النقطة", "Intercept of a perpendicular line through a point"],
    question: ["يمر مستقيم بالنقطة (3، 5) وهو عمودي على y = 3x + 2. ما الإحداثي الرأسي لمقطعه مع محور y؟", "A line through (3, 5) is perpendicular to y = 3x + 2. What is the y-coordinate of its y-intercept?"],
    hints: [["حاصل ضرب ميلي مستقيمين متعامدين غير رأسيين يساوي −1.", "Two perpendicular nonvertical lines have slopes whose product is −1."], ["من x = 3 إلى x = 0 يتغيّر x بمقدار −3. احسب تغيّر y.","Moving from x = 3 to x = 0 changes x by −3. Find the change in y."]],
    formula: "m_1m_2=-1,\\quad b=y-mx",
    steps: [["ميل المستقيم المطلوب −1/3.", "The required slope is −1/3."], ["من النقطة إلى محور y نتحرك ثلاث وحدات يساراً ووحدة واحدة إلى أعلى.", "From the point to the y-axis, move three units left and one unit up."]],
    substitution: "b=5-(-1/3)(3)=6", answer: "6",
    verify: ["المعادلة y = −x/3 + 6 تمر بالنقطة (3، 5) وميلها حاصل ضربه مع 3 يساوي −1.", "The equation y = −x/3 + 6 passes through (3, 5), and its slope times 3 equals −1."],
    wrong: [["4", "استعمل المقلوب الموجب للميل.", "Uses the positive reciprocal slope."], ["-4", "استعمل الميل نفسه فحصل على مستقيم موازٍ.", "Keeps the same slope, yielding a parallel line."], ["5", "اختار إحداثي النقطة المعطاة قبل الانتقال إلى محور y.", "Keeps the given point's y-coordinate without moving to the y-axis."]],
  },
  {
    scope: ["linear-algebra", 4, 14, 61, "university-matrix-determinants"], family: "inverse-compose-determinant", difficulty: 4,
    title: ["محدد تركيب يتضمن معكوساً", "Determinant of a product with an inverse"],
    question: ["مصفوفتان مربعتان A وB من الرتبة نفسها، محدداهما −4 و12 على الترتيب. ما محدد A⁻¹B؟", "Square matrices A and B have the same size and determinants −4 and 12, respectively. What is the determinant of A⁻¹B?"],
    hints: [["استعمل قاعدة محدد حاصل ضرب مصفوفتين.", "Use the product rule for determinants."], ["استخرج محدد المعكوس من AA⁻¹ = I.", "Find the inverse determinant from AA⁻¹ = I."]],
    formula: "\\det(A^{-1}B)=\\frac{\\det B}{\\det A}",
    steps: [["بما أن محدد A غير صفري، فمحدد معكوسها −1/4.", "Since A has nonzero determinant, its inverse has determinant −1/4."], ["اضرب محدد المعكوس في محدد B.", "Multiply the inverse determinant by the determinant of B."]],
    substitution: "(-1/4)(12)=-3", answer: "-3",
    verify: ["من A(A⁻¹B) = B، نحصل على (−4)(−3) = 12.", "From A(A⁻¹B) = B, the determinant check is (−4)(−3) = 12."],
    wrong: [["-48", "ضرب المحددين دون أخذ المعكوس.", "Multiplies the determinants without taking the inverse."], ["3", "أهمل إشارة محدد A.", "Drops the sign of det A."], ["8", "جمع المحددين بدلاً من استخدام قاعدة الضرب.", "Adds the determinants instead of using the product rule."]],
  },
  {
    scope: ["numerical-analysis", 4, 90, 334, "root-finding"], family: "bisection-retained-endpoint-second-step", difficulty: 4,
    title: ["اختيار فترة التنصيف بعد خطوتين", "Retained bisection interval after two steps"],
    question: ["نطبّق التنصيف لإيجاد جذر f(x) = x² − 14 في [2، 4]. ما الحد الأدنى للفترة المحتفَظ بها بعد تقييم نقطتي المنتصف الأوليين واختيار فترة تغيّر الإشارة في كل مرة؟", "Apply bisection to find a root of f(x) = x² − 14 in [2, 4]. What is the lower endpoint of the retained interval after evaluating the first two midpoints and choosing the sign-changing subinterval each time?"],
    hints: [["قيّم الدالة عند 3 وحدد النصف الذي يبقى فيه تغيّر الإشارة.", "Evaluate at 3 and identify the half where a sign change remains."], ["احسب منتصف الفترة الباقية ثم قارن إشارته بإشارتي الطرفين.", "Bisect the remaining interval and compare the new midpoint sign with the endpoint signs."]],
    formula: "m=(a+b)/2",
    steps: [["f(3) = −5 وf(4) = 2، فتُحتفَظ الفترة [3، 4].", "Since f(3) = −5 and f(4) = 2, retain [3, 4]."], ["f(3.5) = −1.75، فتبقى الفترة [3.5، 4].", "Since f(3.5) = −1.75, retain [3.5, 4]."]],
    substitution: "[2,4]\\to[3,4]\\to[3.5,4]", answer: "3.5",
    verify: ["قيمة الجذر بين 3.5 و4 لأن 12.25 < 14 < 16.", "The root is between 3.5 and 4 because 12.25 < 14 < 16."],
    wrong: [["4", "اختار الحد الأعلى للفترة الثانية.", "Chooses the upper endpoint of the second interval."], ["3", "أبقى الحد الأدنى بعد التحديث الأول.", "Keeps the lower endpoint after the first update."], ["2.5", "نصّف [2، 3] رغم اتفاق إشارتي طرفيها.", "Bisects [2, 3] even though its endpoints have the same sign."]],
  },
];

export function reasoningExtensionWave() {
  return rows.map((row, position) => authoredCandidate("v11", position, row));
}
