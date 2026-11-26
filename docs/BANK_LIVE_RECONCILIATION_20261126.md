# Live bank reconciliation — 2026-11-26
Scope: educational content only. Based on bank PR #179 head 1db6af02bf07a9bf6043ec55836750a229e799df and legacy audit PR #192 head 862d4ccc0d6f42d35ce2ed7c41bbc1e688bf8088. All four #179 workflows passed. This checkpoint is independent of the scheduled bank branch. Read-only Supabase checks; no database writes, new draft imports, publications or changes to track visibility.

## Current inventory
849 published problem rows: stage 1 215, stage 2 195, stage 3 217, stage 4 222. Without editorial metadata: 126/144/174/169 respectively (613 total). Editorial items: Draft 622 (570 amendments, 52 new); Published 470 (160 amendments, 310 additions); Withdrawn 1. These are states, not a count of fully audited unique live problems. Fresh notation heuristic: 126 flags, of which 109 have open amendments and 17 do not (stage flags/open/no-open: 19/11/8, 38/32/6, 47/45/2, 22/21/1). Three previously applied corrections 154/166/178 are excluded from replay.

## Fourteen-track launch coverage
The table lists category ID: existing assigned problem count. The last column is the optimistic minimum gap from the five best-filled linked categories (each capped at 20); missing links reserve 20 each. This is not a decision to alter prior selected curriculum categories. The selected school plan reports 690 instead of this mathematical minimum 688; use the existing approved/proposed selection when actually authoring. Level 20/21 are UNPUBLISHED, so their existing 215 problem mappings are not live level access. Old seven courses remain published and unchanged.
| Track | Category ID: count | All mapped | Capped best five | Minimum gap |
|---|---|---:|---:|---:|
| 1 | 1:2, 81:5 | 7 | 7 | 93 |
| 2 | 1:15, 81:2, 82:3 | 20 | 20 | 80 |
| 3 | 2:10, 3:14, 21:2, 33:12, 81:4, 82:1 | 43 | 42 | 58 |
| 4 | 1:2, 2:2, 3:5, 4:6, 21:11, 33:7, 81:19, 82:7 | 59 | 50 | 50 |
| 5 | 2:5, 3:9, 4:14, 21:18, 33:3, 81:2, 82:6 | 57 | 52 | 48 |
| 6 | 2:5, 3:3, 21:9 | 17 | 17 | 83 |
| 7 | 5:16, 6:3, 7:20, 8:12, 22:12, 83:11, 84:4, 85:5 | 83 | 71 | 29 |
| 8 | 5:12, 6:14, 7:10, 8:10, 22:6, 34:17, 84:6, 85:4 | 79 | 63 | 37 |
| 9 | 6:12, 22:2, 34:5, 84:3, 85:5 | 27 | 27 | 73 |
| 10 | 9:23, 10:23, 23:9, 35:6, 87:7, 88:6 | 74 | 62 | 38 |
| 11 | 9:9, 10:4, 11:13, 12:6, 23:12, 35:5, 86:17, 87:5, 88:7 | 78 | 58 | 42 |
| 12 | 10:2, 11:16, 23:15, 86:8, 87:2, 88:2 | 45 | 43 | 57 |
| 20 (unpublished) | 14:34, 16:18, 24:35, 36:23 | 110 | 78 | 22 |
| 21 (unpublished) | 13:31, 15:35, 89:5, 90:16, 91:18 | 105 | 79 | 21 |
| Total | 8 missing category links | 804 | 669 | 731 |

Stage coverage (target / capped / deficit): primary 600/188/412; middle 300/161/139; secondary 300/163/137; university 200/157/43 (unpublished). Eight category slots have >=20 (three school, five university staging). No track yet meets all five. Actual school coverage 512/1200; total readiness upper bound 669/1400. Category IDs: 1 arithmetic; 2 early algebra; 3 geometry/measurement; 4 data/probability; 5 number theory/powers; 6 algebra/functions; 7 ratios; 8 angles/geometry; 9 advanced algebra; 10 trigonometry; 11 calculus; 12 probability/combinatorics; 13 multivariable calculus; 14 linear algebra; 15 differential equations; 16 limits/continuity; 21 fractions/decimals; 22 statistics; 23 sequences/series; 24 logic/discrete math; 33 multiplication/division; 34 triangles/similarity/Pythagoras; 35 descriptive statistics; 36 sequences/convergence; 81 number/place value; 82 measurement/unit conversion; 83 integers/rationals; 84 linear inequalities; 85 compound probability; 86 exponential/log functions; 87 vectors; 88 analytic geometry; 89 mathematical statistics; 90 numerical analysis; 91 optimization. Follow BANK_SCHOOL_LAUNCH.md and UNIVERSITY_TWO_LEVEL_TRANSITION.md for actual scope decisions. Do not create any empty categories.

## Nine existing amendments: source-fingerprint gate
Read the actual Fingerprint implementation from Controllers/EditorialProblemsController.cs on main. Retrieved precisely the immutable source fields in its declared order and the options ordered by Order, Id. Reconstructed the default .NET JSON representation (upper-case Unicode escapes, ASCII special-character escapes, JSON whitespace rules), then computed SHA-256 via read-only PostgreSQL sha256. All nine matched the saved fingerprint, and all nine still Draft revision 0. This is a point-in-time read, not a server publication preview; the server must independently validate the live source under lock.
| Draft | Source | Answer | Fingerprint |
|---|---:|---:|---|
|403|188|6|match|
|413|200|7|match|
|423|212|3|match|
|424|213|2|match|
|425|214|11|match|
|435|224|4|match|
|436|225|3|match|
|437|226|31|match|
|447|236|5|match|

Keep previous content review in #192. In 425 replace formula f(t)=at^2+c with g(x)=ax^2+c consistently and improve independent verification (11-3=8=2*2^2). In 436 use explicit x/y in the Arabic coordinate explanation, not Arabic variables. Expand one-step solutions into distinct substitution/operation steps and inspect every distractor for specific misconception before approval. Do not mutate DetailedSolutionAr/En source snapshot, option IDs or revision blindly. All nine remain unpublished; no authenticated Admin endpoint/session available through this run's connectors.

## No-open-draft notation queue — 17 current flagged records
Independently recomputed every answer, checked live bilingual stems, two hints, structured formula/steps, distractor feedback, option keys and primary-skill existence. None has an open amendment. The regex treats Arabic combining marks as non-alphanumeric and flags natural prose; never bulk replace. This is a focused review, not full mathematical/LaTeX render or semantic duplicate certification.
| Source | Independent computation | Disposition |
|---|---|---|
|19|49*22/7=154 cm²|False positive (doubled consonant); improve generic distractors.|
|23|1/2+1/2=1|False positive; explain option 2 as squaring sum and 1/2 as retaining one term.|
|48|mean 3; (1+1+1+1)/4=1|False positive; distinguish sum 4 from variance and generic distractors.|
|53|60-6=54|False positive; strengthen distractors, separate distribution into two steps.|
|70|12-7=5|Actual Arabic variable in title and question, proposed correction below.|
|85|15-8=7|Same.|
|100|18-9=9|Same.|
|115|21-10=11|Same.|
|130|24-11=13|Same.|
|1728|8*3/4=6 cm|False positive in prose; solution/distractors coherent.|
|1741|16-sqrt(81+144)=1 cm|False positive in prose; solution/distractors coherent.|
|1749|1418-562+526=1382|False positive in prose; solution/distractors coherent.|
|1754|2*3*2/(5*4)=3/5|False positive in prose; uniform draw implied; distractors coherent.|
|1762|81-16=65|False positive; wrap k, pi expressions in valid LaTeX.|
|1763|18/(3/10)=60|False positive; 180 distractor explanation says treats 18 as one tenth, correct; review semantic overlap with held draft 992 and track classification before any new proposal.|
|1782|(4*15-18)/3=14|False positive; wrap inline model and variable in LaTeX.|
|1790|abs(3-(-6))=9|False positive; coherent.|
All 17 have one primary skill and four option keys in the observed records. Existing old arithmetic family #70/85/100/115/130 differs mainly by constants: keep all IDs and history; count as one reasoning family in diversity planning, do not generate more number-only variants.

### Exact proposed notation amendments (not imported)
All five are existing structured problems with historical Published amendments, no open amendment. Existing source title and question are identical Arabic strings; preserve English title/question and all option IDs, flags, order, mappings and solution unless a reviewed editorial amendment explicitly changes content. Replace both Arabic title and question with the following exact text only after a supported wording amendment path is available:
| Problem | Historical draft | Correct option ID | Proposed Arabic title and question |
|---|---:|---:|---|
|70|296|recheck|حل المعادلة $x+7=12$.|
|85|310|330|حل المعادلة $x+8=15$.|
|100|324|389|حل المعادلة $x+9=18$.|
|115|338|452|حل المعادلة $x+10=21$.|
|130|352|511|حل المعادلة $x+11=24$.|

At the read snapshot, all seven existing HasWordingHistory conditions were false for each of these five (attempts, progress, achievements, session attempts, diagram, student activity and JSON session membership). Recheck inside the authorized server transaction. Standard SameQuestion rejects changed stems; the held-wording importer also rejects existing structured metadata. Therefore do not use standard publish or held-wording import to bypass this. Development handoff: support a reviewed notation-only amendment for structured existing questions with source fingerprint, exact option identity, history guard/versioning, transaction lock and audit. No controller changes made in this content branch. Correct option ID for #70 must be rechecked against current options before use; this document is not an import manifest.

## Next and blockers
1. Reconcile live admin preview at wizard draft #400 and the nine exact IDs above; verify revision, source fingerprint and supported publishing, serial bounded writes only; stop on any mismatch/pressure. Record persisted state after each write.
2. Fix the two specific draft inconsistencies and run full reviewed contract; resolve wording-only path with platform conversation. Do not create duplicate amendments.
3. Refresh live and draft comparison and stable track crosswalk before authoring more; prioritize already-linked grade 1, 2, 6, 9 gaps and previously reviewed 230 bulk candidates, 111 launch candidates (overlapping sets; not additive). No new candidates this pass because existing pending material has not been reconciled through official preview. Do not publish to old university course scopes.
4. Publish or import only through supported authenticated editorial workflow. The connected read-only inspection does not supply an authenticated application Admin session. No production SQL mutation, no bypass of publication guards.
