import {authoredCandidate} from './authored-candidate.mjs';
// Drafts only: fresh semantic duplicate review and editorial approval required.
const rows = [
  {
    "scope": [
      "grade-1",
      1,
      81,
      302,
      "counting"
    ],
    "family": "count-events-by-tapping-once-per-picture",
    "difficulty": 1,
    "title": [
      "عدّ النقرات",
      "Counting taps"
    ],
    "question": [
      "أمام نور أربعة رسوم لطيور وثلاثة رسوم لأشجار. نقرت مرة واحدة على كل طائر، ومرتين على كل شجرة. كم نقرة نفّذت؟",
      "Nour sees four bird pictures and three tree pictures. She taps each bird once and each tree twice. How many taps does she make?"
    ],
    "hints": [
      [
        "عدّ نقرات الطيور أولاً.",
        "Count the bird taps first."
      ],
      [
        "لكل شجرة نقرتان: عدّ ٢، ٤، ٦.",
        "Each tree gets two taps: count 2, 4, 6."
      ]
    ],
    "formula": "4+2+2+2",
    "steps": [
      [
        "للطيور أربع نقرات.",
        "The birds get four taps."
      ],
      [
        "للأشجار ست نقرات؛ نجمعها مع الأربع.",
        "The trees get six taps; add these to the four."
      ]
    ],
    "substitution": "4+6=10",
    "answer": "10",
    "unit": [
      "نقرات",
      "taps"
    ],
    "verify": [
      "عدّ النقرات بالترتيب: أربع للطيور ثم ست للأشجار.",
      "Count the taps in order: four for birds, then six for trees."
    ],
    "wrong": [
      [
        "7",
        "عدّ الرسوم فقط.",
        "Counts pictures only."
      ],
      [
        "6",
        "عدّ نقرات الأشجار فقط.",
        "Counts only tree taps."
      ],
      [
        "11",
        "حسب نقرة زائدة.",
        "Counts one extra tap."
      ]
    ]
  },
  {
    "scope": [
      "grade-1",
      1,
      1,
      2,
      "primary-subtraction"
    ],
    "family": "remove-pairs-from-marked-seats",
    "difficulty": 1,
    "title": [
      "المقاعد غير المحجوزة",
      "Unreserved seats"
    ],
    "question": [
      "في صف تسعة مقاعد. وُضعت بطاقة حجز على ثلاثة مقاعد، ثم أزيلت بطاقة واحدة منها. كم مقعداً لا يحمل بطاقة حجز الآن؟",
      "There are nine seats in a row. Three seats get a reservation card, then one of those cards is removed. How many seats now have no reservation card?"
    ],
    "hints": [
      [
        "كم بطاقة بقيت على المقاعد؟",
        "How many cards remain on the seats?"
      ],
      [
        "اطرح عدد المقاعد التي ما زالت تحمل بطاقة من تسعة.",
        "Subtract the seats still carrying a card from nine."
      ]
    ],
    "formula": "9-(3-1)",
    "steps": [
      [
        "بقيت بطاقتان بعد إزالة واحدة.",
        "Two cards remain after removing one."
      ],
      [
        "نطرح مقعدين من تسعة.",
        "Subtract two seats from nine."
      ]
    ],
    "substitution": "9-2=7",
    "answer": "7",
    "unit": [
      "مقاعد",
      "seats"
    ],
    "verify": [
      "سبعة مقاعد بلا بطاقة ومقعدان ببطاقة: المجموع تسعة.",
      "Seven seats without a card and two with a card make nine."
    ],
    "wrong": [
      [
        "6",
        "لم يحسب إزالة البطاقة.",
        "Ignores the removed card."
      ],
      [
        "8",
        "طرح البطاقة المزالة وحدها.",
        "Subtracts only the removed card."
      ],
      [
        "2",
        "عدّ المقاعد المحجوزة.",
        "Counts reserved seats."
      ]
    ]
  },
  {
    "scope": [
      "grade-2",
      1,
      82,
      321,
      "length"
    ],
    "family": "compare-lengths-after-shifted-ruler-origin",
    "difficulty": 2,
    "title": [
      "القياس من بداية غير الصفر",
      "Measuring from a shifted ruler origin"
    ],
    "question": [
      "وُضع طرف قلم عند علامة ٣ سم على مسطرة، وطرفه الآخر عند علامة ١١ سم. ووُضع طرف قلم آخر عند علامة ١ سم وطرفه الآخر عند علامة ٧ سم. بكم يزيد طول القلم الأول على الثاني؟",
      "One pencil starts at the 3 cm mark of a ruler and ends at 11 cm. Another starts at 1 cm and ends at 7 cm. By how much is the first pencil longer?"
    ],
    "hints": [
      [
        "لا تبدأ القراءة من الصفر هنا.",
        "Neither measurement starts at zero."
      ],
      [
        "احسب طول كل قلم بطرح علامتي نهايته وبدايته، ثم قارن.",
        "Find each length by subtracting its start mark from its end mark, then compare."
      ]
    ],
    "formula": "(11-3)-(7-1)",
    "steps": [
      [
        "طول الأول ٨ سم.",
        "The first is 8 cm long."
      ],
      [
        "طول الثاني ٦ سم؛ الفرق ٢ سم.",
        "The second is 6 cm long; the difference is 2 cm."
      ]
    ],
    "substitution": "8-6=2",
    "answer": "2",
    "unit": [
      "سم",
      "cm"
    ],
    "verify": [
      "٦ + ٢ = ٨، و٣ + ٨ = ١١.",
      "6 + 2 = 8, and 3 + 8 = 11."
    ],
    "wrong": [
      [
        "4",
        "قارن علامتي النهاية فقط.",
        "Compares only the end marks."
      ],
      [
        "8",
        "أعطى طول الأول وحده.",
        "Reports only the first length."
      ],
      [
        "14",
        "جمع الطولين.",
        "Adds the two lengths."
      ]
    ]
  },
  {
    "scope": [
      "grade-2",
      1,
      1,
      3,
      "primary-multistep-arithmetic"
    ],
    "family": "compare-two-repair-batches-with-returned-items",
    "difficulty": 2,
    "title": [
      "مقارنة الصناديق بعد الإصلاح",
      "Comparing boxes after repairs"
    ],
    "question": [
      "في الصندوق أ ١٧ لعبة سليمة، وفي الصندوق ب ١٤ لعبة سليمة. أضيفت ٤ ألعاب سليمة إلى ب، ثم اكتُشف أن لعبتين من أ معطلتان فأُخرجتا. بكم يزيد عدد الألعاب السليمة في ب الآن على أ؟",
      "Box A has 17 working toys and box B has 14. Four working toys are added to B, then two toys in A are found broken and removed. How many more working toys does B now have than A?"
    ],
    "hints": [
      [
        "حدّث عدد الألعاب في كل صندوق على حدة.",
        "Update each box separately."
      ],
      [
        "اطرح العدد الجديد في أ من العدد الجديد في ب.",
        "Subtract the new A count from the new B count."
      ]
    ],
    "formula": "(14+4)-(17-2)",
    "steps": [
      [
        "أ فيه ١٥ لعبة سليمة.",
        "A has 15 working toys."
      ],
      [
        "ب فيه ١٨ لعبة سليمة؛ الفرق ثلاثة.",
        "B has 18 working toys; the difference is three."
      ]
    ],
    "substitution": "18-15=3",
    "answer": "3",
    "unit": [
      "ألعاب",
      "toys"
    ],
    "verify": [
      "إضافة ثلاث ألعاب إلى أ تجعله مساوياً لب.",
      "Adding three toys to A makes it equal to B."
    ],
    "wrong": [
      [
        "1",
        "أضاف إلى ب لكنه لم يُخرج اللعبتين من أ.",
        "Adds to B but ignores the removals from A."
      ],
      [
        "5",
        "حسب أثر الإخراج وحده دون مقارنة العددين الجديدين بدقة.",
        "Miscomputes the updated comparison."
      ],
      [
        "33",
        "جمع العددين الجديدين.",
        "Adds the two updated counts."
      ]
    ]
  },
  {
    "scope": [
      "grade-6",
      1,
      21,
      95,
      "p-fractions-decimals-fraction-operations"
    ],
    "family": "remaining-fraction-after-split-of-two-original-reservations",
    "difficulty": 3,
    "title": [
      "جزء الوقت غير المخصص",
      "Unallocated time"
    ],
    "question": [
      "خُصص ٢/٥ من مدة لقاء للشرح و١/٤ من المدة الأصلية للتدريب. أُلغي نصف مدة التدريب المخصصة، وبقي الشرح كما هو. ما كسر المدة الكلية الذي لم يعد مخصصاً للشرح أو التدريب؟",
      "Two fifths of a session is allocated to explanation and one quarter of the original duration to practice. Half of the allocated practice time is cancelled, while explanation stays unchanged. What fraction of the whole session is now allocated to neither?"
    ],
    "hints": [
      [
        "بعد الإلغاء يبقى نصف الربع للتدريب.",
        "After cancellation, half of one quarter remains for practice."
      ],
      [
        "اطرح مجموع وقتي الشرح والتدريب الباقي من واحد.",
        "Subtract explanation and remaining practice from one."
      ]
    ],
    "formula": "1-(2/5+1/8)",
    "steps": [
      [
        "وقت التدريب المتبقي ١/٨ من الكل.",
        "Remaining practice is 1/8 of the whole."
      ],
      [
        "المجموع المخصص ١٦/٤٠ + ٥/٤٠ = ٢١/٤٠.",
        "Allocated time is 16/40 + 5/40 = 21/40."
      ],
      [
        "الجزء غير المخصص ٤٠/٤٠ − ٢١/٤٠.",
        "The unallocated part is 40/40 minus 21/40."
      ]
    ],
    "substitution": "1-21/40=19/40",
    "answer": "19/40",
    "verify": [
      "مجموع ١٩/٤٠ و٢١/٤٠ يساوي واحداً.",
      "19/40 plus 21/40 equals one."
    ],
    "wrong": [
      [
        "7/20",
        "طرح مدة التدريب الأصلية كاملة.",
        "Subtracts the full original practice allocation."
      ],
      [
        "21/40",
        "أعطى الجزء المخصص.",
        "Reports the allocated portion."
      ],
      [
        "3/5",
        "أهمل وقت التدريب المتبقي.",
        "Ignores the remaining practice time."
      ]
    ]
  },
  {
    "scope": [
      "grade-6",
      1,
      2,
      10,
      "primary-two-step-equations"
    ],
    "family": "equal-storage-boxes-after-fixed-damaged-count",
    "difficulty": 3,
    "title": [
      "سعة الصناديق المتساوية",
      "Capacity of equal boxes"
    ],
    "question": [
      "تحتوي ثلاثة صناديق على العدد نفسه من القطع. عند فحص كل صندوق وُجدت قطعتان معطلتان فيه. مجموع القطع السليمة في الصناديق الثلاثة ٢٤. كم قطعة كانت في كل صندوق قبل الفحص؟",
      "Three boxes contain the same number of pieces. Inspection finds two defective pieces in each box. Across the three boxes, 24 pieces are working. How many pieces were in each box before inspection?"
    ],
    "hints": [
      [
        "إذا كان العدد الأصلي في الصندوق x، فالسليم فيه x−2.",
        "If a box originally contains x pieces, it has x−2 working pieces."
      ],
      [
        "اقسم عدد القطع السليمة على ثلاثة ثم أعد القطعتين المعطلتين.",
        "Divide the working total by three, then add back the two defective pieces."
      ]
    ],
    "formula": "3(x-2)=24",
    "steps": [
      [
        "بكل صندوق ٢٤ ÷ ٣ = ٨ قطع سليمة.",
        "Each box has 24 ÷ 3 = 8 working pieces."
      ],
      [
        "نضيف القطعتين المعطلتين للحصول على العدد الأصلي.",
        "Add the two defective pieces to recover the original count."
      ]
    ],
    "substitution": "x=8+2=10",
    "answer": "10",
    "unit": [
      "قطع",
      "pieces"
    ],
    "verify": [
      "٣ × (١٠ − ٢) = ٢٤.",
      "3 × (10 − 2) = 24."
    ],
    "wrong": [
      [
        "8",
        "أعطى عدد القطع السليمة فقط.",
        "Reports working pieces only."
      ],
      [
        "6",
        "طرح القطعتين بدلاً من إعادتهما.",
        "Subtracts defective pieces instead of adding them back."
      ],
      [
        "26",
        "أضاف القطعتين إلى المجموع دون قسمة.",
        "Adds two to the total without dividing."
      ]
    ]
  }
];
export const launchPrimaryV20=()=>rows.map((row,i)=>authoredCandidate('v20',i,row));
