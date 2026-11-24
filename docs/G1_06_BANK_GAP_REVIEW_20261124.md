# G1-06 bank gap review, 2026-11-24

Read-only production inventory: 773 problems, 35 categories, 140 published skills. All 773 have four options, one correct option, one primary skill and nonempty Arabic/English solution text. No exact normalized duplicate question groups in either language. 234 legacy editorial rows are Published, not waiting to be released. These checks are structural, not a claim of mathematical review.

| Stage | Categories | Skills | Problems | Skills with fewer than 3 primary questions |
|---|---:|---:|---:|---:|
| Elementary | 8 | 37 | 191 | 4 |
| Middle | 9 | 33 | 180 | 1 |
| High | 9 | 35 | 202 | 3 |
| University | 9 | 35 | 200 | 1 |

Priority gaps: estimation 2, mass 2, metric conversion 2, time 2, absolute value 2, logarithm domain 1, logarithm modeling 2, model interpretation 2, hypothesis testing 2. Wave 01 proposes ten original bilingual questions, two for logarithm domain and one for each other gap. If accepted, each listed skill reaches at least three primary questions (not a final mastery target). Content remains in a reviewed-candidate file, not production or published.

Existing question review (read 17 questions in these skills): arithmetic and rules checked for those examples; further taxonomy review needed for #1566 (ordering signed integers vs absolute value) and #1578 (geometric sequence vs interpreting exponential models). No automatic relinking. Check raw LaTeX escape conventions on #1722/#1724/#1725/#1578/#1585/#1586/#1595 before any text correction; preserve source IDs/history. 

Free stage category IDs remain 1/2, 5/6, 9/10, 13/14. Existing university numerical analysis and mathematical optimization categories need explicit course proposals, not forced mappings to unrelated courses. Discrete math, differential equations and statistics need explicit Free coverage decisions under the existing two-per-stage rule; do not loosen access or publish empty/inaccessible tracks. Grade/course suggestions in the manifest are proposals, not certification or final grade mapping. 

Next: review candidates and resolve track codes in a disposable database; review all existing problem solutions and hints through the amendment workflow; add varied difficulty and reasoning, validate no duplicate templates, and publish only after human approval and compatible release. Never use auto-generated hints derived by copying answers.

## Published bank answer review, 24 November

The read-only export covered 773 distinct published IDs across four stages. The following groups are disjoint.

| Evidence | Problems | Result |
| --- | ---: | --- |
| Recompute from the complete English prompt and find the unique matching choice among all four | 315 | 63 recurring families across the four stages, five variants each. Every recomputed result matched the key. |
| Match the Arabic prompt, English prompt and all four (choice text, correctness flag) pairs against source-controlled prior content | 367 | Exact matches with the earlier curriculum files. This also reproduces historical wording defects if those exist. |
| Resolve the remaining items individually and compare with the frozen prompt/choice fingerprint | 91 | 90 keys agree with the item review. Item 512 has no exactly correct option. See the TSV for the mathematical reasoning and the conditional result for item 10. |

The two stored solution texts also match previously reviewed after-edit text on 552 items. This is a separate, overlapping count. Screen rendering and complete bilingual solution/hint approval are still pending. Previously suspected escaping on IDs 1578/1585/1586/1595/1722/1724/1725 was checked against decoded strings. The inspected mathematical commands use single backslashes. No stored escape correction was justified.

### Corrections and hints

Two items are held for answer acceptance. For 512, the block 1/3 + 1/4 equals 7/12, which illustrates why “at least one half” is required. For 818, the count is eleven eighths and the length in units of one bar is 11/8. The proposed stem asks for the latter. The wording file contains both corrections plus eleven items for fair-coin assumptions, answer disclosure, or bilingual options. It identifies original option IDs when a choice would change and records a content fingerprint. These are editorial proposals for reviewed versioning. Applying them to historical attempts in place would change what those attempts represent.

The initial hint file covers the 17 existing problems in the nine underrepresented skills, with two separately authored Arabic/English hints per problem. Source IDs, both prompts, and the primary skill key identify the intended exercise. IDs 1566 and 1578 also require a taxonomy decision. These hints have not been saved or published to the student API. No hint pair in this file asserts coverage of the other 756 problems.

### Repeating the checks

Run `python3 tests/check_numeric_family_answers.py` to recompute the recurring families directly against the five checked-in November 20 batches. For the published snapshot, export the result of this read-only query as one JSON object per line, ordered by ID. The query reads only curriculum content.

```sql
SELECT json_build_object(
    'id', p."Id", 'q', p."QuestionTextEn", 'a', p."QuestionTextAr",
    'sol', p."DetailedSolutionEn", 'sa', p."DetailedSolutionAr",
    'sk', s."StableKey",
    'opts', (SELECT json_agg(json_build_array(o."LatexCode", o."IsCorrect")
                             ORDER BY o."Order", o."Id")
             FROM "QuestionOptions" o WHERE o."ProblemId" = p."Id")
)
FROM "Problems" p
LEFT JOIN "CurriculumProblemSkills" ps ON ps."ProblemId" = p."Id" AND ps."IsPrimary"
LEFT JOIN "CurriculumSkills" s ON s."Id" = ps."SkillId"
ORDER BY p."Id";
```

Run `python3 tests/check_published_answer_snapshot.py bank.jsonl`. Exit 2 identifies known blocking wording defects, exit 1 identifies missing or changed evidence, and exit 0 requires both checks to clear. With the November 24 export the expected exit is 2. The archived numeric-family check exits 0. Keep the live question bank outside Git.

Review evidence is in `docs/review-data/g1-legacy-answer-review-20261124.tsv` and `docs/review-data/g1-published-wording-proposals-20261124.json`. Prospective hints are in `content/editorial/g1-existing-hint-candidates-20261124.json`.


## Production wording correction follow-up, 24 November

The original snapshot evidence above is retained. Eleven proposed problem corrections are now applied and read back: 23, 145, 340, 352, 364, 376, 388, 512, 800, 818 and 851. The last nine were guarded by absence of attempts and user progress, with original option-text matching; 512 and 818 were corrected in the preceding pass after checking attempts. Existing IDs and answer flags are unchanged. Problems 10 and 20 remain pending a history-preserving editorial revision (four attempts each; existing progress records also exist). Do not treat them as safe for in-place edits.

The snapshot checker recognizes only the exact verified after-edit fingerprints and unchanged key positions, while retaining its original pre-edit evidence. The IVT recomputation recognizes the reviewed bilingual wording of the same mathematical condition. This is not evidence of browser/Flutter rendering, full snapshot test execution, or completed review of all solutions and hints.

The nine underrepresented skills still need ten additional distinct problems in total to reach three primary questions each; candidate publication remains a separate reviewed operation.
