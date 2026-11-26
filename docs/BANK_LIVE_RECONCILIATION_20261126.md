# Live bank reconciliation — 2026-11-26
See the final production checkpoint below for the current state.
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
|70|296|271|حل المعادلة $x+7=12$.|
|85|310|330|حل المعادلة $x+8=15$.|
|100|324|389|حل المعادلة $x+9=18$.|
|115|338|452|حل المعادلة $x+10=21$.|
|130|352|511|حل المعادلة $x+11=24$.|

At the read snapshot, all seven existing HasWordingHistory conditions were false for each of these five (attempts, progress, achievements, session attempts, diagram, student activity and JSON session membership). Recheck inside the authorized server transaction. Standard SameQuestion rejects changed stems; the held-wording importer also rejects existing structured metadata. Therefore do not use standard publish or held-wording import to bypass this. Development handoff: support a reviewed notation-only amendment for structured existing questions with source fingerprint, exact option identity, history guard/versioning, transaction lock and audit. No controller changes made in this content branch. Readback of #70 option order confirmed IDs 269,270,271,272 and correct ID 271; recheck before use. This document is not an import manifest.

## Next and blockers
1. Reconcile live admin preview at wizard draft #400 and the nine exact IDs above; verify revision, source fingerprint and supported publishing, serial bounded writes only; stop on any mismatch/pressure. Record persisted state after each write.
2. Fix the two specific draft inconsistencies and run full reviewed contract; resolve wording-only path with platform conversation. Do not create duplicate amendments.
3. Refresh live and draft comparison and stable track crosswalk before authoring more; prioritize already-linked grade 1, 2, 6, 9 gaps and previously reviewed 230 bulk candidates, 111 launch candidates (overlapping sets; not additive). No new candidates this pass because existing pending material has not been reconciled through official preview. Do not publish to old university course scopes.
4. Publish or import only through supported authenticated editorial workflow. The connected read-only inspection does not supply an authenticated application Admin session. No production SQL mutation, no bypass of publication guards.

## Expansion path: fresh reconciliation of 52 unpublished additions
All 52 Draft revision 0 records were inspected for target tracks, direct category/primary-skill links and normalized AR/EN exact question matches against Problems and other open drafts. No exact matches returned (whitespace/case normalization only; this is not semantic clearance). 14 target old university course tracks: 972,983,1010–1021. Hold and crosswalk, not publish into those scopes. 38 target school grades, 29 lack at least one direct track/category or track/primary-skill link. Nine have both direct links: 965,971,992,993,995,997,1084,1086,1088. First six already have documented reasoning holds; last three require semantic and full contract review, not auto-approval. In particular 1084/1088 both produce difference 4 and 997 is already held for a related comparison family.
11 additional wizard drafts (1083–1093) coexist with 41 remaining original staged additions. Do not re-import or overwrite. Ten contain questions, one (1093) is empty and held. Recomputed the ten answers; reviewed bilingual questions, four options and reasons, two hints, solution steps, formula and verification. All ten keyed answers agree. Each has only one structured step; split genuinely distinct operations where appropriate. Exact link screening is a conservative preflight, not the application's official validation.
| Draft | Answer | Editorial/scope action |
|---|---|---|
|1083|15|Missing direct skill link; compare make-ten/join family with 984/996.|
|1084|4|Both links present; compare difference family with 997/1088 and published corpus.|
|1085|6|Missing skill link; compare missing-addend family with 986; formula should state unknown first.|
|1086|14|Both links present; review semantic overlap with subtraction context in existing bank.|
|1087|9+6|Missing skill link; second hint identifies sole matching option too directly; refine.|
|1088|4|Both links present; compare difference/equalization family with 1084; do not publish both automatically.|
|1089|60|Missing skill link; compare place-value family with 988.|
|1090|58<61|Missing skill link; two wrong propositions 58>61 and 61<58 are equivalent. Replace one with an independent plausible misconception before approval and compare 998.|
|1091|72|Missing skill link; second hint effectively supplies both digits in answer order; refine. Correct Arabic dual «عشرتان».|
|1092|41|Missing skill link; explicitly list intermediate numbers 40,41,42 in solution, not hint.|
|1093|none|Empty title/question/options/hints/solution as observed; category 3 and skill 16 not linked to grade 1. Do not publish, delete or duplicate. Coordinate with draft owner.|
No draft writes or publications. Reconcile the live WizardJson content digest, current revision and review disposition through the authorized Admin path. Recheck links at publication. Prioritize existing reviewed, linked school material and the 230 bulk/111 launch offline proposals rather than accumulating a duplicate queue. A future category/skill link needs documented curriculum and platform coordination; no arbitrary link or new grade created.

## Owner-authorized production checkpoint — 2026-11-26 (supersedes earlier pending statuses)
Owner explicitly authorized direct SQL to accelerate publishing, retaining content/history safeguards. Three one-time scripts saved on this independent branch; each rehearsed with ROLLBACK, verified original state, then committed and independently read back. Do not rerun. No application authentication/permission changes, no API login impersonation; audit Origin owner_sql and review note document maintenance and existing draft-owner attribution.
- Nine existing amendments: script commit dcf7cf431b096e91ba46d7a6385b14e8021b7989. Drafts 403/413/423/424/425/435/436/437/447 -> source problems 188/200/212/213/214/224/225/226/236, all Published revision 4. Source SHA-256, exact source snapshot, draft digest, scope, active owner, duplicate, options and lock checks passed. Corrected g(x) consistency in 425/437 and explicit x/y steps in 424/436. Exact post-commit comparison against pre-write snapshot and approved solution payload confirmed all nine questions, ordered option IDs/text/flags, stage/category/points unchanged and both flat solutions and structured metadata matched. Correct option IDs 743,790,838,841,848,885,892,895,936 respectively (supersedes mistaken IDs for 225/236 in older audit report). Four audit events per draft. No new problem rows.
- Five source-locked notation-only corrections: script commit ff07c8a0c86d369bc3d2a9870f6066ac861b3e83. IDs 70/85/100/115/130 now have Latin x and LaTeX delimiters in Arabic AND English title/question. All seven history guards passed inside transaction. No solution, option, historical draft or learner records modified. One explicit ReviewedNotationMaintenance audit per source. This is direct maintenance, not a newly published amendment; old published snapshot retained.
- Grade 1 new publication: script commit 18c83113e0a0b95ac0b2fa513b9864a52a4c4a4f. Existing draft 1086 -> problem 1804 (Published revision 4). Static part-whole complement distinct from the existing removal contexts 3/1785; four options 7205–7208, correct 7208=14, track 1, category 1, primary skill 2, two progressive hints, two worked steps, formula, substitution, verification and misconception-specific reasons. Four audit events. No taxonomy change. Sequence gaps due to rolled-back test are expected.
- Live after: 850 problems (216/195/217/222); 604 without editorial metadata (124/137/174/169); 112 heuristic notation flags (12/31/47/22). Draft 612 = 561 amendments + 51 new; Published 480 = 169 amendments + 311 additions; Withdrawn 1. 14 existing problems corrected, one new published this pass. Grade 1 category 1 now 3, total grade-1 assignments 8. Best-five capped 670/1400 including 157 unpublished university mappings; min gap 730 (687 school + 43 university), prior selected school gap 689. No change to eight missing category links. No full browser rendering verification or complete audit of all remaining problems. All three scripts are one-time data maintenance, not automatic migrations.
- Next: do not repeat those exact IDs; reconcile all remaining amendments starting at wizard #400, excluding recorded holds. Compare 1084/1088 with existing comparison family; only one if suitable. Prefer batch preparation/review of existing 230 bulk proposals and priority linked school skills; resolve taxonomy gaps with development before changing mappings, never target legacy university courses. User's direct SQL authorization does not waive source, revision, scope, duplicate, independent arithmetic, history and transaction checks. Separate scheduled bank branch remains unchanged.

## Owner-authorized production checkpoint — next 49 amendments (2026-11-26)
Live inventory before: 850 problems, 604 missing editorial metadata. Reviewed the current #179 head 1db6af02bf07a9bf6043ec55836750a229e799df and its exact reviewed-staged-holds.json (not just the editorial family holds file). Within wizard IDs 400–478, nine had already been published in the preceding checkpoint, 21 still-open held drafts were excluded, and 49 remaining open candidates were selected. Existing numeric variants are legacy corrections, not new reasoning families or new problems.

Independently computed answers from current English stems using arithmetic, median indexing, Euclidean algorithm, LCM, exponent evaluation, percentage and proportional reasoning, Pythagoras, slope and quadratic evaluation. Verified correct option and both solution result fields, four distinct numeric values (including evaluated powers), bilingual structural contract and source question/option identity. Replaced abbreviated solution steps with 2–4 worked steps, improved wrong-option feedback using concrete operation checks and explicit x/y notation for slope, aligned g(x) formula. Retained existing source questions and option IDs. The archived full editorial review and current structural checks do not replace browser rendering or full pedagogical review of all variants. No additional new questions were authored or published.

| Script commit | Drafts | Published |
|---|---|---:|
| 6d70d3af4b50ed761dcddab6d29983a66b6bd5e8 | 400,401,402,405,409,410,411,419,420,421,422,426,427,428,430 |15|
| 2aaa901ee3a9bdc0edf5a485ff3d2d7b12ca0fc9 | 432,433,434,438,439,440,442,444,445,446,448,449,450,451,452 |15|
| dc802a95479c7e2a99ac87fe58dcffc144cc8e26 | 454,456,457,458,460,461,462,463,464,466,468,469,470,472,473 |15|
| 55e5fb4681233f0455e47b8fb58db149cdbca1af | 474,475,476,478 |4|

Each one-time script ran as a trial with ROLLBACK, then current state was rechecked (all original Draft rev0), committed and read back. All 49 are Published revision 4 with original SourceProblemId=PublishedProblemId. SHA256 source fingerprints, exact source snapshot and ordered options, draft digest, owner/scope/duplicate checks and advisory locks passed in each transaction. Independent post-commit exact comparison of all 49 source questions, options (ID/order/text/flag), stage/category/points and proposed metadata and flat bilingual solutions matched 49/49. 196 owner_sql audit events across 49 drafts. Do not rerun the scripts. No changes to learner records, UI, taxonomy or university visibility.

Excluded draft IDs: 404,406,407,408,412,414,415,416,417,418,429,431,441,443,453,455,459,465,467,471,477. Preserve registry reasons (curriculum placement, count-form/wording, ambiguity or recovering-input skill). Discovered a flaw in the preceding nine-amendment release: five sources 188,200,212,224,236 already had unresolved placement/skill holds in reviewed-staged-holds.json. Their mathematically correct solution changes are live; do not roll back or reimport blindly. Reopen classification review for 188/200 (grade 6 two-step equation progression) and 212/224/236 (recovering input versus inverse-function skill). No classification changes made. Treat these five as awaiting taxonomy review, not fully approved content. Notify #179 explicitly.

Live after: 850 published rows, 555 without metadata (primary 116, middle 96, secondary 174, university 169), 106 heuristic notation flags (12/25/47/22). Draft 563 (512 amendments, 51 new), Published 529 (218 amendments, 311 additions), Withdrawn 1. This pass corrected 49 (8 primary, 41 middle), added 0. Cumulative since independent #193 first write: 63 corrected, 1 new. Best-five capped 670/1400 incl. 157 unpublished university mappings, min gap 730 unchanged. No new taxonomy links. Next: wizard 479 onward, use exact current hold registry before selection; prioritize expansion in parallel from existing reviewed school bulk proposals and resolve 52-draft reconciliation holds before publication. Preserve the university transition; no duplicate imports. CI on new head requires verification.


## Owner-authorized production checkpoint — secondary amendments and linked primary expansion (2026-11-26)
Live start 850 problems / 555 missing metadata. Verified #179 head 1db6af02bf07a9bf6043ec55836750a229e799df; screened all four registries (reviewed-staged-holds, school-launch-draft-holds, reviewed-overlap-holds, reviewed-editorial-holds). Reviewed secondary wizard 480–533; left 485/490/501/512/523 on registered holds (source 274/280/292/304/316). Wizard 479 is also held (source 268). Do not treat any held source as newly cleared.

49 existing amendments (source 269–326 except held/missing):
- 480–496: commit e8335d40e906cad8ac15a1aa9e710a6a69f3c324; 480,481,482,483,484,486,487,488,489,491,492,493,494,495,496.
- 497–513: commit 5f3b23871d12928f93cfb34afa63d99881c06f8b; 497,498,499,500,502,503,504,505,506,507,508,509,510,511,513.
- 514–529: commit faf91d1bc8f17c550ecefeffd4a6a8825d453a66; 514,515,516,517,518,519,520,521,522,524,525,526,527,528,529.
- 530–533: commit 763877e23393a1fe986dfa01b66b87597d449089; 530,531,532,533.

Independent calculations: Vieta with concrete factorization, discriminant, expanded factor options, trig ratios and exact unit-circle values (including boundary 90 degrees), power derivative, derivative checks of antiderivative choices, definite integral and triangular area, unordered pair counting. Checked mathematically distinct option values and both language result fields. Replaced abbreviated steps with explicit bilingual worked steps and distractor feedback; used common symbolic side labels with bilingual definitions and no Arabic variable letters. Four SQL transactions trialed with ROLLBACK, draft states rechecked, committed and read back. All 49 Published rev4 with original source ID, exact post-write comparison 49/49 across both stems, option ID/order/text/flag, classification, points, metadata and both flat solutions. 196 owner_sql audit events. No new questions counted from legacy variants; do not rerun.

New Grade 1 unknown-change equalization: existing draft 1088 -> problem 1806, revision 4, correct option 7216=4, track 1 category 1 skill 2. Commit 7c4d3b61f558619ac3fc8d5f8df3bc11099bfb1b. Distinct from static complement #1804 and direct comparison #1084/#997 (keep direct-comparison drafts pending semantic decision). Trial rollback, publication and readback passed, four audit events.

Three additional primary candidates from exact #179 launch-primary-v20.mjs source (commit 1db6af02bf07a9bf6043ec55836750a229e799df), independently recalculated and bilingual worked solution improved. Exact content-key and bilingual normalized duplicate checks against live and drafts; focused semantic comparisons: ruler question compares two shifted-origin lengths, distinct from #1000 single-length draft, #1728 covering equal length and #1739 overlap; fractional cancellation differs from #1759 two allocated fractions without cancellation. Counting taps checks two distinct tap weights, not mere count of pictures. Existing skill/category/track links, no taxonomy edits. Preserved canonical content keys, reviewed candidate content (including LaTeX fraction representation). Trial rollback and verify absent, commit, exact readback 3/3 (content key, wizard, options, flat/structured solutions, track/skill, four audit events). One-time script commit 3bd3ffe798e46e27da1020a56a88b5dd696c417a.

| Canonical content key | Draft | Published problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v20-grade-1-count-events-by-tapping-once-per-picture-1 |1097|1810|1/81/302|7229=10|
| growth-v20-grade-2-compare-lengths-after-shifted-ruler-origin-1 |1098|1811|2/82/321|7235=2|
| growth-v20-grade-6-remaining-fraction-after-split-of-two-original-reservations-1 |1099|1812|6/21/95|7237=19/40|

All three new imported drafts Published rev3. Sequence gaps expected from rolled-back trials. Update #179 published-expansion manifest by its own branch owner; do not reimport these keys. Four new questions total this checkpoint and 49 old problems corrected. Cumulative independent #193: 112 old corrected and five new published. Live after 854 problems (220/195/217/222), 506 without metadata (116/96/125/169), 81 heuristic notation flags (12/25/22/22); 513 drafts (463 amendments, 50 new), 582 Published (267 amendments, 315 additions), 1 Withdrawn. Best-five capped readiness 674/1400 including 157 mapped unpublished university levels; gap 726 (683 school + 43 university). Grade 1 now 10 assignments, grade 2 21, grade 6 18. No changes to eight missing category links or university visibility.

Prior classification follow-up: live skill 28 NameEn is "Finding inputs from function values" (StableKey middle-inverse-function-evaluation), which is evidence the three recovering-input questions 212/224/236 match the displayed skill despite historical naming concern; retain the recorded hold until coordinated disposition, do not change scope unilaterally. Grade 6 two-step equations 188/200 remain local progression review. Runtime browser rendering and comprehensive legacy educational audit remain incomplete. CI on latest head unverified. Next: wizard 535 onward, skip source 340 and other holds; use current live fingerprint and scope checks (legacy university courses may receive existing content corrections only, not expansion), prioritize linked school growth and approved two-level university transition; no changes to application, authentication or learner history.

## Owner-authorized production checkpoint — 27 new school problems (2026-11-26)
Live start 854 problems, 506 missing structured metadata, best-five capped 674/1400. Read current #179 head 1db6af02bf07a9bf6043ec55836750a229e799df, four hold registries, live published school skill/category links, content keys and current bilingual school inventory. Candidate screening covered v17 early/middle/secondary, v19 and linked v16. Reviewed top two English token-overlap comparisons across live and draft pool per eligible candidate; also used existing archived semantic holds. This is a focused overlap review, not proof of no semantic equivalence anywhere. Excluded held families (strict interval count, shared-area altitude, periodic interior-event counting, perpendicular triangle area from sum, quadrant trig reciprocal variant, equal-weight balance, linked work and hollow-layer count), and independently withheld v17 grade-9 quadratic-equal-height-symmetric-time because the assigned skill is evaluation, not solving a quadratic; no taxonomy remap. Other unselected candidates are not cleared for publication.

Independently recalculated 27 answers (arithmetic, exact rational values, enumeration, clock minutes, parity, number-line reflection, proportional geometry, weighted/variance and integral rules); verified all four options are mathematically distinct. Reviewed bilingual content, refined idea/steps/formula and selected Arabic notation and hints; retained original candidate keys. Three guarded SQL import/publication transactions of nine each, trialed with ROLLBACK, confirmed keys absent, committed, exact readback 27/27 (wizard, stem, title, metadata, flat bilingual solution, options/order/correctness, scope, track and primary skill links, status Published rev3 and four audit events per draft). 108 audit events. No taxonomy, learner history, web/mobile or auth changes. Sequence gaps caused by rollback. Do not rerun.

Scripts: batch1 f4a8c68ef4dbcb4ade8c691727c387ea90b26921; batch2 76ebe5396bc1008740c0ee7edbc2638acfe8d806; batch3 5ef123a733af46631078f451a27b58f527643af0. Canonical mapping for #179 published-expansion manifest:

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v17-grade-2-length-invariant-under-slide-1 | 1109 | 1822 | 2/82/321 | 7279=16 |
| growth-v17-grade-3-latest-departure-with-buffer-1 | 1110 | 1823 | 3/82/324 | 7281=9{:}25 |
| growth-v17-grade-3-reverse-area-after-width-change-1 | 1111 | 1824 | 3/3/13 | 7288=6 |
| growth-v17-grade-4-mixed-unit-mass-across-scales-1 | 1112 | 1825 | 4/82/322 | 7291=180 |
| growth-v17-grade-5-repeated-fill-from-smaller-dispenser-1 | 1113 | 1826 | 5/82/320 | 7294=4 |
| growth-v17-grade-6-fixed-subgroup-divisibility-minimum-1 | 1114 | 1827 | 6/21/93 | 7299=20 |
| growth-v17-grade-7-phase-offset-synchronization-1 | 1115 | 1828 | 7/5/24 | 7301=10 |
| growth-v17-grade-7-three-line-vertical-angle-sum-1 | 1116 | 1829 | 7/8/38 | 7306=90 |
| growth-v17-grade-8-projection-overhang-from-shadow-1 | 1117 | 1830 | 8/34/40 | 7311=2 |
| growth-v19-grade-1-count-visible-faces-on-turning-cards-1 | 1127 | 1840 | 1/81/302 | 7349=3 |
| growth-v17-grade-8-compare-input-revisions-linear-with-fee-1 | 1128 | 1841 | 8/6/26 | 7356=15 |
| growth-v17-grade-9-deduce-bounded-cumulative-count-1 | 1129 | 1842 | 9/22/98 | 7357=5 |
| growth-v17-grade-10-compare-towers-fixed-angle-different-baselines-1 | 1130 | 1843 | 10/10/48 | 7363=15 |
| growth-v17-grade-10-staggered-index-equal-arithmetic-rows-1 | 1131 | 1844 | 10/23/104 | 7368=9 |
| growth-v17-grade-11-selection-pairs-different-flavours-1 | 1132 | 1845 | 11/12/56 | 7369=26 |
| growth-v17-grade-11-variance-deletion-equal-opposite-deviations-1 | 1133 | 1846 | 11/35/54 | 7374=\frac{20}{3} |
| growth-v17-grade-12-alternating-affine-two-cycle-1 | 1134 | 1847 | 12/23/102 | 7379=8 |
| growth-v17-grade-12-recover-net-change-from-reversed-measurements-1 | 1135 | 1848 | 12/11/51 | 7384=10 |
| growth-v19-grade-2-strip-length-closest-without-going-over-1 | 1145 | 1858 | 2/82/321 | 7422=12 |
| growth-v19-grade-3-regroup-into-tens-without-using-hundreds-1 | 1146 | 1859 | 3/81/305 | 7426=32 |
| growth-v19-grade-4-feasible-sticker-total-with-quotient-and-remainder-limit-1 | 1147 | 1860 | 4/33/5 | 7429=27 |
| growth-v19-grade-7-equal-distance-opposite-side-coordinates-1 | 1148 | 1861 | 7/83/307 | 7436=3 |
| growth-v19-grade-8-map-scale-rectangular-area-converts-both-dimensions-1 | 1149 | 1862 | 8/7/33 | 7437=0.24 |
| growth-v19-grade-9-distinct-sums-from-nonuniform-two-spinners-1 | 1150 | 1863 | 9/85/336 | 7444=7 |
| growth-v19-grade-10-scalar-multiple-from-one-component-cancelled-1 | 1151 | 1864 | 10/87/340 | 7447=-\frac{1}{2} |
| growth-v19-grade-11-combinations-avoid-three-way-unanimity-1 | 1152 | 1865 | 11/12/56 | 7452=12 |
| growth-v19-grade-12-circle-radius-from-horizontal-line-tangency-1 | 1153 | 1866 | 12/88/328 | 7453=4 |

Live after 881 (230 primary,203 middle,226 secondary,222 university); 375 have structured metadata, 506 missing (116/96/125/169). 84 heuristic notation flags (14/26/22/22); the three new flagged IDs 1826/1842/1860 were manually checked and are false positives on ordinary Arabic wording, not actual Arabic variables. Draft 513 (463 amendments,50 new), Published 609 (267 amendments,342 additions), Withdrawn 1. Best-five capped 697/1400 (school 540/1200, university unpublished mappings 157/200), gap 703 (660 school +43 university). 27 added, 23 contribute to capped best-five count; no old amendments in this pass. Cumulative independent #193: 112 corrected,32 new. All 12 school grades received additions, no university changes. Eight missing category links remain. Next legacy wizard 535 onward (skip registry holds); continue large linked growth waves, prioritize best-five gaps and resolve taxonomy proposals separately. Browser rendering and full pedagogical audit incomplete, CI latest head unverified.

## Owner-authorized production checkpoint — 46 additional school problems (2026-11-26)
Start 881 live, 506 without metadata, 697 capped. Reconciled #179 head 1db6af02bf07a9bf6043ec55836750a229e799df; checked four hold registries, exact live/draft keys, published track/category/skill links, top two English token-overlap comparisons in live/draft inventory. Focused semantic review, not exhaustive proof of uniqueness. Selected v15 early/primary/middle/upper, v16 early/middle/secondary and linked v18; excluded explicit holds and other candidates requiring overlap/skill review. Independent calculation of all 46 answers (including enumeration, rational values, geometric sums, unit conversions, bounds, clock corrections and counting); four distinct numeric options per problem, checked bilingual source content and refined ideas, selected steps, formulas, notation and hints. All 46 existing linked school scopes, no university additions or taxonomy edits. Five guarded one-time SQL import/publication transactions (10+10+10+10+6), rehearsed rollback and verified keys absent before commit. Tool-call limit interrupted orchestration after batch4; confirmed batch5 keys absent, then executed successfully. Exact independent post-write comparison 46/46 including wizard, titles/stems, options/order/flags, metadata/flat solutions, classification/track/primary skill links, Published rev3 and four audit events each (184 events). No application/auth/learner-history changes. No old amendments this pass. Sequence gaps are expected from rollback; do not rerun any script.

Scripts: batch1 cc73f281b8f0d03f74020896228e76cf2405349c; batch2 b14ec067bef8825e594730629c9e8b08d1703129; batch3 e9a5584eccd1a905897efc8813e6db2468e48f9c; batch4 9856d85d9395178be8c919e359051f8299d8127d; batch5 2be9b5e3d723c4eb4162997ba8b2415383085c42.

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v15-grade-1-correct-double-touch-count-1 | 1164 | 1877 | 1/81/302 | 7497=7 |
| growth-v15-grade-2-count-printed-page-digits-1 | 1165 | 1878 | 2/81/302 | 7503=17 |
| growth-v15-grade-2-unfold-paired-holes-distance-1 | 1166 | 1879 | 2/82/321 | 7508=6 |
| growth-v15-grade-3-cyclic-distribution-last-tray-1 | 1167 | 1880 | 3/33/5 | 7512=2 |
| growth-v15-grade-3-elapsed-time-opposite-clock-errors-1 | 1168 | 1881 | 3/82/324 | 7514=28 |
| growth-v15-grade-3-extra-perimeter-after-straight-cut-1 | 1169 | 1882 | 3/3/12 | 7519=12 |
| growth-v15-grade-3-reconstruct-whole-from-three-fifths-1 | 1170 | 1883 | 3/21/97 | 7521=20 |
| growth-v15-grade-4-coincident-fraction-marks-1 | 1171 | 1884 | 4/21/96 | 7527=7 |
| growth-v15-grade-4-pay-for-complete-promotional-groups-1 | 1172 | 1885 | 4/33/6 | 7530=32 |
| growth-v15-grade-4-wait-for-both-tasks-1 | 1173 | 1886 | 4/82/324 | 7533=32 |
| growth-v15-grade-5-capacity-displaced-by-submerged-blocks-1 | 1184 | 1897 | 5/82/320 | 7578=450 |
| growth-v15-grade-5-largest-median-hidden-scores-1 | 1185 | 1898 | 5/4/18 | 7581=15 |
| growth-v15-grade-6-minimum-overlap-of-percentage-groups-1 | 1186 | 1899 | 6/21/93 | 7588=10 |
| growth-v15-grade-6-oblique-triangle-rectangle-complement-1 | 1187 | 1900 | 6/3/14 | 7591=21 |
| growth-v15-grade-7-equivalent-area-single-pond-1 | 1188 | 1901 | 7/8/36 | 7594=10 |
| growth-v15-grade-7-strict-fare-crossover-1 | 1189 | 1902 | 7/84/325 | 7598=7 |
| growth-v15-grade-7-wheel-visit-cycle-1 | 1190 | 1903 | 7/5/22 | 7601=3 |
| growth-v15-grade-8-reprinted-map-scale-denominator-1 | 1191 | 1904 | 8/7/33 | 7608=40000 |
| growth-v15-grade-8-subtract-nested-running-counts-1 | 1192 | 1905 | 8/85/335 | 7611=18 |
| growth-v15-grade-9-minimum-median-grouped-integers-1 | 1193 | 1906 | 9/22/98 | 7615=15 |
| growth-v16-grade-1-three-step-square-stair-1 | 1204 | 1917 | 1/81/302 | 7657=6 |
| growth-v16-grade-2-two-stocks-with-same-total-movements-1 | 1205 | 1918 | 2/1/3 | 7662=14 |
| growth-v16-grade-3-fraction-of-a-group-of-half-panels-1 | 1206 | 1919 | 3/21/97 | 7668=1 |
| growth-v16-grade-3-uncovered-border-count-1 | 1207 | 1920 | 3/3/13 | 7671=24 |
| growth-v15-grade-11-choose-nonadjacent-display-spaces-1 | 1208 | 1921 | 11/12/56 | 7675=10 |
| growth-v15-grade-11-equal-point-and-line-distance-1 | 1209 | 1922 | 11/88/330 | 7678=2 |
| growth-v15-grade-11-pool-variance-with-separated-group-means-1 | 1210 | 1923 | 11/35/54 | 7684=9 |
| growth-v15-grade-12-integrate-periods-and-a-shifted-remainder-1 | 1211 | 1924 | 12/11/51 | 7686=18 |
| growth-v15-grade-12-least-terms-for-geometric-tail-tolerance-1 | 1212 | 1925 | 12/23/113 | 7692=5 |
| growth-v15-grade-12-squared-trig-difference-from-sum-1 | 1213 | 1926 | 12/10/47 | 7695=0.04 |
| growth-v16-grade-3-recover-number-from-two-roundings-1 | 1224 | 1937 | 3/81/306 | 7737=250 |
| growth-v16-grade-4-detect-missing-ones-carry-1 | 1225 | 1938 | 4/1/1 | 7742=10 |
| growth-v16-grade-4-equal-fraction-shares-different-wholes-1 | 1226 | 1939 | 4/21/112 | 7747=1 |
| growth-v16-grade-4-stacks-with-aisle-in-each-layer-1 | 1227 | 1940 | 4/33/6 | 7752=16 |
| growth-v16-grade-5-adjacent-hundredths-on-opposite-sides-1 | 1228 | 1941 | 5/21/94 | 7753=4.15 |
| growth-v16-grade-6-percentage-of-original-after-rejects-recovered-1 | 1229 | 1942 | 6/21/93 | 7759=90 |
| growth-v16-grade-7-recover-rate-from-equal-time-mixed-work-1 | 1230 | 1943 | 7/7/31 | 7761=9 |
| growth-v16-grade-8-missing-factor-in-difference-of-same-base-powers-1 | 1231 | 1944 | 8/5/21 | 7767=8 |
| growth-v16-grade-9-box-corner-two-pythagorean-steps-1 | 1232 | 1945 | 9/34/37 | 7770=13 |
| growth-v16-grade-11-equal-slopes-at-two-points-1 | 1233 | 1946 | 11/11/49 | 7774=-6 |
| growth-v18-grade-1-recount-after-rearrangement-1 | 1240 | 1953 | 1/81/302 | 7801=6 |
| growth-v18-grade-7-latest-whole-minute-before-strict-temperature-1 | 1241 | 1954 | 7/84/325 | 7807=3 |
| growth-v18-grade-8-recover-exponent-from-common-base-quotient-1 | 1242 | 1955 | 8/5/21 | 7811=2 |
| growth-v18-grade-10-unchanged-mean-replacing-different-sized-groups-1 | 1243 | 1956 | 10/35/53 | 7816=4 |
| growth-v16-grade-12-external-point-tangent-segment-1 | 1244 | 1957 | 12/88/328 | 7820=24 |
| growth-v16-grade-12-signed-work-against-horizontal-motion-1 | 1245 | 1958 | 12/87/338 | 7823=-11 |

Live after 927 (255 primary,214 middle,236 secondary,222 university); 421 structured, 506 missing (116/96/125/169). 90 heuristic notation flags (17/27/24/22), six additional flags (1877,1880,1884,1906,1926,1958); flags are candidates, not confirmed errors. Draft 513 (463 amendments +50 additions), Published 655 (267 amendments+388 additions), Withdrawn1. Best-five capped 734/1400, school 577/1200 plus unpublished university mappings 157/200; gap 666 (623 school +43 university). All twelve school grades received growth; 37 of 46 count toward capped target. Cumulative independent #193: 112 old corrected,78 new published. Eight missing category links remain. CI and browser rendering not confirmed. Next prioritize gaps in grade1,2,6,9; prepare linked growth, review missing categories and pending draft placement separately; legacy wizard535 onward with holds. Coordinate canonical publication mapping with #179 owner to prevent reimport.

## Owner-authorized production checkpoint — 10 original linked gap problems (v21, 2026-11-26)
Start 927 live, 506 missing structured metadata, capped 734/1400. Confirmed #179 unchanged at 1db6af02bf07a9bf6043ec55836750a229e799df. Reviewed the school category placement proposal and current linked skills and full track inventories for grades 1, 2, 6 and 9 plus the live/draft school stems. Original candidate families authored in this pass, not imports from #179. Screened top three English token-overlap results against current school live/draft pool, independently checked arithmetic and numeric distinctness (including the four similarity side triples). Targeted overlap screen is not a guarantee of bank-wide semantic uniqueness. Fifteen initial families withheld before execution: pair-count-with-unpaired-object, even-pairing-after-one-joins, broken-ruler-missing-start, choose-missing-carry-correction, centimetres-and-metre-compare, choose-perpendicular-height-not-slant, area-preservation-base-double-height-half, linear-budget-max-whole-with-reserve, right-triangle-missing-leg-from-diagonal, ordered-outcomes-coin-die-combination, probability-mutually-exclusive-pair-event, percentage-point-vs-relative-change, fraction-quotient-full-bottles, exterior-perpendicular-height (near #615), inequality-negative-factor-membership (near #1601). Do not treat withheld items as approved. Refined bilingual ideas, hints and notation on the final ten. No curriculum placement changes. Existing published scope only; grade 1 has 2 linked categories, grades 2 and 6 have 3, grade 9 has 5; new approved category/skill placements still needed to reach 5 in early grades. Grade 6 two-step equation progression hold retained.

Final SQL script scripts/publish_reviewed_v21_gap_school_20261126.sql commit afdd078ab11c11e3dc929ba181dbcb9cf3240706 (supersedes unexecuted preparation commit 1e3fb13e3c9395ecb4ce9eebd9803d4fb60b28e9). Guarded transaction rehearsed ROLLBACK, confirmed all keys absent, committed; independent exact comparison 10/10 for draft/wizard, bilingual stems/titles, options/order/flags, structured metadata/flat solutions, track, primary skill, Published revision 3, four audit events each (40 total). Sequence gaps from trial rollback. No replay, no app/auth/taxonomy/student-history edits. Canonical mapping:

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v21-grade-1-ordinal-object-replacement-position-1 | 1256 | 1969 | 1/81/302 | 7867=4 |
| growth-v21-grade-1-remove-two-distinct-groups-1 | 1257 | 1970 | 1/1/2 | 7869=10 |
| growth-v21-grade-1-zero-removal-conservation-1 | 1258 | 1971 | 1/1/2 | 7874=9 |
| growth-v21-grade-2-compare-length-via-shared-reference-1 | 1259 | 1972 | 2/82/321 | 7880=7 |
| growth-v21-grade-6-fraction-comparison-sum-exceeds-whole-1 | 1260 | 1973 | 6/21/95 | 7882=\frac{1}{2} |
| growth-v21-grade-9-iqr-invariant-translation-1 | 1261 | 1974 | 9/22/98 | 7887=9 |
| growth-v21-grade-9-mad-scale-data-1 | 1262 | 1975 | 9/22/98 | 7892=6 |
| growth-v21-grade-9-outlier-effect-range-1 | 1263 | 1976 | 9/22/98 | 7893=17 |
| growth-v21-grade-9-quadratic-even-symmetry-evaluation-1 | 1264 | 1977 | 9/6/27 | 7900=0 |
| growth-v21-grade-9-triangle-similarity-inconsistent-correspondence-1 | 1265 | 1978 | 9/34/40 | 7903=(6,9,12) |

Live after 937 (260 primary,219 middle,236 secondary,222 university); structured 431, missing 506; capped 744/1400 (587 school/1200 and 157 unpublished university mappings/200), gap656 (613 school +43 university). All ten count toward capped target. New notation heuristic flags: 1, IDs 1976; not proof of errors. Draft 513, Published 665, Withdrawn1. Cumulative independent #193: 112 old corrected,88 new. No legacy amendments this pass, next legacy wizard535 onwards with holds. Continue larger growth batches after reviewing actual linked gaps; coordinate taxonomy proposals before publication. Browser rendering and CI not confirmed.

## Owner-authorized production checkpoint — 29 university legacy amendments (2026-11-26)
Start 937 live, 506 missing structured metadata, capped744. Reconciled old archived expansion families from v9/v11/v12/v14; many are already present under different keys, no replay or new expansion this pass. Audited pending university drafts 535–565, skipped 546/source340 and 558/source352 per hold registry (mixed-language LaTeX options, need rendering review). Independent mathematical recalculation of all 29 correct answers and distinct option values; concrete bilingual steps and substitution, derivative difference-quotient/gradient verification, triangular determinant cross-check, integration and initial-condition verification, rational and geometric sequence limits. Numeric distractors without an identifiable specific misconception receive concrete violated calculation/condition explanations rather than invented causes. Existing titles, stems, IDs, exact option IDs/order/flags, points and YouTube references retained. No new problems. Existing source has dual track links: old published course tracks13/14/15 and unpublished level tracks20/21. Updated amendment guard to require the exact existing sorted track list, category/skill links for each and preserve all mappings; revision counters incremented for both tracks, visibility unchanged. Source fingerprints, draft hashes, exact source snapshots, locks and existing owner attribution checked in transactions. Three rollback rehearsals, then committed all 29. Exact post-write comparison 29/29 including original protected fields, full wizard/metadata/solutions, option IDs and track/skill links, status Published rev4 and four events per item (116). No changes to taxonomy, learner history, app or auth.

Scripts already executed (DO NOT replay): batch1 a974a84870dee079610e2b85b3873d7382d45b57 drafts535–544; batch2 3bea5f605c7b5bd08971d18249070d8cdea49fa7 drafts545,547–555; batch3 de7b09f99eadcfce49907ea582d2d5b1685022a7 drafts556,557,559–565. Source329–359 except340,352. Correct option IDs respectively1307,1310,1313,1318,1321,1328,1329,1336,1339,1344,1347,1354,1357,1364,1365,1372,1375,1380,1383,1386,1391,1394,1401,1408,1411,1416,1419,1422,1427. Track visibility confirmed 13/14/15 true,20/21 false. Live937 (260/219/236/222), missing477 (116/96/125/140), structured460. Draft483 (434 amendments+49 additions; one fewer open addition than prior checkpoint, not changed by these amendment scripts; reconcile separately), Published694 (296 amendments+398 additions), Withdrawn1. Capped744/1400, gap656, unchanged. Independent #193 cumulative141 old corrections +88 new. Next legacy draft566 onward with holds and same dual-track safeguards; expansion: current link bottlenecks, original differentiated families and reviewed placement proposals. CI/browser rendering not verified. No new count inflation from corrections.

## Owner-authorized production checkpoint — 26 further university legacy amendments (2026-11-26)
Start 937 live, 477 missing structured metadata, 744 capped coverage. Reviewed pending drafts 566–594, independently checked all 26 correct answers from source stems and existing option IDs. Held 570/582/594 (sources364/376/388), mixed-language intermediate value theorem option rendering per hold registry. Rebuilt concrete bilingual steps, formulas, substitutions, verification and distractor explanations; retained existing hints/ideas and original titles, stems, points, YouTube URLs, option IDs/order/flags and exact existing old-course + new-level track mappings. No visibility changes, no new problems, no student history, app, auth or taxonomy changes. Three guarded transactions (9+9+8) rehearsed ROLLBACK then committed. Independent readback 26/26 exact including original protected fields, entire wizard, metadata, flat solutions, primary skill and both tracks, Published rev4, four audit events per item (104). Generic offset distractors receive concrete violated calculations rather than invented misconceptions. Browser rendering/CI not verified.

Already executed; DO NOT replay: scripts/apply_reviewed_university_566_594_batch1_20261126.sql (28e11abd10ef9a55cee2c4f62e31315945854ed9, drafts566–569,571–575); batch2 (aab1db7ee2d996e7a778545df193b60647be12e7, drafts576–581,583–585); batch3 (63803672ea3869bc7dc0198ead34e1de7ff2d96b, drafts586–593). Source360–387 excluding364,376. Correct option IDs in draft order: 1430,1433,1438,1441,1452,1455,1458,1463,1466,1469,1474,1477,1484,1485,1492,1499,1502,1505,1510,1513,1520,1521,1528,1531,1536,1539.

Live after 937 (260 primary,219 middle,236 secondary,222 university); 486 structured,451 missing (116/96/125/114). Capped744/1400 (587/1200 school +157/200 unpublished university mappings); gap656 unchanged. Draft459 (410 amendments+49 additions), Published720 (322 amendments+398 additions), Withdrawn1. Cumulative independent #193:167 legacy corrections +88 new. Next: draft595/source420 onward (school fractions etc.; hold604/source429 chart stem), read fresh records and all four hold registries, preserve track/skill mappings (single-track school guard, dual-track university guard when applicable). Prioritize genuinely distinct expansion on underfilled categories; 63 additional live questions to 1000, but launch coverage requires 656 useful capped additions and approved missing category links. Reconcile #179, #192, #193, current live inventory and scheduled monitor before writes. No new expansion this pass; no claimed background work.


## Owner-authorized production checkpoint — 10 school legacy amendments (2026-11-26)
Reconciled PR #179 and #193 comments, current PR #193 starting head 42b948495fea09c6bb777a8833cee87b90d1a16b and live totals 937 / 486 structured / 451 missing. Read the #179 handoff and school/university launch proposals (these files are on #179, not #193), #192 legacy audit, all four hold registries, and the prior source-locked SQL model. Independently recalculated ten answers (fractions, equivalent fractions, decimal conversion and rounding, fractional and percentage parts, IQR with explicit quartile convention); kept chart hold 604/source429. Expanded actual bilingual calculations, defined symbols, checked existing hints, distractors, formulas and verification. All 10 sources retained exact titles, bilingual stems, IDs, points, options/order/flags, primary skill and track links. Exact source snapshots, draft hashes and stored fingerprints checked in guarded transaction; rehearsed ROLLBACK and independently confirmed 10 unchanged, then committed. Independent post-write comparison 10/10 exact on all fields above plus wizard, metadata, flat bilingual solution, status Published rev4 and four owner_sql events each (40). University level20/21 remain false; no new problems, taxonomy, entitlement, learner history, app or auth changes.
One-time SQL already executed, DO NOT replay: scripts/apply_reviewed_school_595_605_20261126.sql, commit e68faabcdd7f6828a879151dd9dd024909d7b89a. Drafts595–603,605 map to sources420–428,430; correct option IDs in order 1671,1676,1677,1682,1685,1689,1694,1699,1704,1710. Draft604 still held. Live937 (260/219/236/222), 496 structured (153/124/111/108), 441 missing (107/95/125/114). Draft449 (400 amendments +49 additions), Published730 (332 amendments+398 additions), Withdrawn1. Cumulative independent #193:177 corrections +88 new. Coverage unchanged 744/1400 (587 school+157 mapped unpublished university), gap656. Next draft606 onward, continue fresh hold/source/fingerprint checks; prioritize linked grade1/2/6/9 growth and resolve seven school category placement proposals separately, preserving existing entitlements. CI and browser rendering not verified. No new addition in this pass.


## Owner-authorized production checkpoint — eight original linked gap problems (v22, 2026-11-26)
Start937 live, 496 structured, 441 missing. Authored eight distinct bilingual tasks on existing underfilled categories for grades1/2/6/9 (two each). Reviewed actual linked skill inventory and all four #179 hold registries; screened nearest three bilingual token-overlap results against 700 live/open-draft school pairs from stages1/2 and full grade-specific inventories. Compared nearest measurement, discount, triangle and spread questions; retained distinct unlabelled-scale reading, fixed-vs-percentage discount comparison, nonoverlapping two-triangle total and equal-mean MAD comparison. This is a targeted semantic review, not exhaustive proof of bank-wide uniqueness. Recalculated all eight answers independently, checked four distinct options, distractors and two hints, refined age-appropriate notation. Preparation JSON commit f6fc058f0a523ee1c8e0d1d1a4d0cbaab8fbd206 is a pre-final review snapshot, NOT an import file; final content in one-time SQL script scripts/publish_reviewed_v22_gap_school_20261126.sql, commit ad133b4059132120a013c67995f6f6a0e2e045b9. Trial ROLLBACK passed, verified all keys absent, committed; independent readback 8/8 exact on wizard, revision3 Published, titles/stems, scope, skills/track, options/order/flags, metadata and flat bilingual solution; four owner_sql events each (32). Do not rerun either preparation or SQL. Sequence gaps from rollback. No category, subscription, learner history, application or auth changes; levels20/21 remain unpublished.

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v22-grade-1-counting-grid-left-to-right-1 |1276|1987|1/81/302|7939=6|
| growth-v22-grade-1-net-decrease-after-return-1 |1277|1988|1/1/2|7942=3|
| growth-v22-grade-2-alternating-skip-count-membership-1 |1278|1989|2/81/302|7947=12|
| growth-v22-grade-2-unlabelled-centimeter-scale-1 |1279|1990|2/82/321|7951=13|
| growth-v22-grade-6-compare-fixed-and-percent-discounts-1 |1280|1991|6/21/93|7953=2|
| growth-v22-grade-6-sum-nonoverlapping-triangular-banners-1 |1281|1992|6/3/14|7958=19|
| growth-v22-grade-9-compare-mad-equal-mean-1 |1282|1993|9/22/98|7962=1|
| growth-v22-grade-9-inequality-variable-both-sides-1 |1283|1994|9/84/327|7967=x\\le4|

Live945 (266/221/236/222), 504 structured (159/126/111/108), 441 missing (107/95/125/114). Draft449 (400 amendments+49 additions), Published738 (332 amendments+406 additions), Withdrawn1. Independently recomputed best-five capped coverage752/1400 (595 school +157 mapped unpublished university), deficit648 (605 school+43 university). Per-track capped counts grade1–12:19,29,50,57,56,25,76,69,38,65,61,50; level20=78,21=79. Eight missing category slots (seven school, one university). All eight new items add capped coverage. Cumulative #193:177 corrections+96 new. 55 new problems to 1000, 648 useful assignments to full goal. Next legacy draft606 onward, hold604 still excluded; continue original linked gap families and resolve missing category placements separately with entitlement review. CI/browser rendering not verified. No new university publication. Update #179 canonical manifest on own branch; do not import these eight keys again.


## Owner-authorized production checkpoint — 13 school legacy amendments (2026-11-26)
Start945 live / 504 structured / 441 missing. Reviewed all four hold registries; draft619/source444 remains held because the same unordered selection is already present at source314. Independently recalculated drafts606–618/sources431–443: shifts of mean, median, range, relative frequency, weighted mean, arithmetic/geometric term, difference, finite/infinite sums, recurrence. Improved detailed bilingual steps, explicit rule conditions, option-specific distractor feedback and verification, retaining original two hints, source title/stems, IDs, ordered option IDs/flags, scope and existing links. Source fingerprint and draft MD5 checked against exact snapshots in guarded transaction. ROLLBACK rehearsal succeeded, independently confirmed 13 unchanged, then committed. Independent post-write readback13/13 exact for full wizard, metadata, bilingual flat solutions, title/stems, points, scope/skills/tracks, original options, Published revision4 and four owner_sql events per draft (52). No new problems, taxonomy, entitlement, learner history, UI or auth changes; university20/21 still false.
One-time script ALREADY APPLIED, DO NOT replay: scripts/apply_reviewed_school_606_618_20261126.sql, commit a2f8be671697821f6364bc0f08f8133b4e1687ae. Correct option IDs in draft order:1713,1719,1724,1726,1732,1733,1739,1742,1748,1750,1753,1759,1764. Live945 (266/221/236/222), 517 structured (159/131/119/108), 428 missing (107/90/117/114). Draft436 (387 amendments+49 additions), Published751 (345 amendments+406 additions), Withdrawn1. Cumulative #193:190 corrections+96 new. Coverage752/1400 (595 school+157 university mapped to unpublished levels), gap648; 55 new to 1000. Next draft620/source445 onward (university discrete mathematics, use dual-track guard and recheck actual source track lists); hold604 and619 excluded. Maintain all existing guardrails; prioritize expansion towards 1000 and coverage gaps. CI/browser rendering not verified. No new addition in this pass.


## Owner-authorized production checkpoint — 18 school/university amendments (2026-11-26)
Start945 live / 517 structured / 428 missing. Rechecked current PR heads and four hold registries. Reviewed drafts620–640 excluding633,634,636 (mixed-language shared LaTeX options, runtime verification hold); prior619 and604 remain held. Independently checked logical truth tables, De Morgan, graph degree sum, equivalence relation proofs, tight pigeonhole bound, tree edges, fraction comparison/equivalence/subtraction/number line, decimal place value, percentages, median/mode and sequence calculations. Expanded bilingual solutions and option-specific distractors; preserved stems, titles, original option IDs/flags, points and mappings. For university sources445–450 the stored draft originally listed track17; final wizard reflects exact existing links17+20, neither link changed. Both source fingerprints and draft hashes checked; transaction ROLLBACK rehearsal followed by independent unchanged check18/18 and COMMIT. Independent readback18/18 exact on full wizard, metadata, flat solutions, protected fields, all ordered options, primary skill and track links; Published revision4; 72 owner_sql audit events. No new problems or taxonomy, subscription, learner history, UI or auth changes. Level20/21 remain unpublished.
One-time script ALREADY APPLIED, DO NOT replay: scripts/apply_reviewed_legacy_620_640_20261126.sql, commit 537f945955ecb65ee286d2f8dac08908ec4b9a77. Drafts620–632,635,637–640; sources445–450,472–478,481,483–486. Correct option IDs in order1772,1773,1779,1784,1785,1791,1878,1882,1886,1891,1894,1898,1902,1915,1921,1927,1931,1935. Live945 (266/221/236/222), 535 structured (165/133/123/114), 410 missing (101/88/113/108). Draft418 (369 amendments+49 additions), Published769 (363 amendments+406 additions), Withdrawn1. Cumulative #193:208 corrections+96 new. Coverage752/1400 unchanged, gap648, 55 new to 1000. Next draft641 onward (respect all registries); prioritize new linked content. CI/browser rendering not verified.


## Owner-authorized production checkpoint — six original linked gap problems (v23, 2026-11-26)
Start945 live/535 structured/410 missing. Authored eight new bilingual candidates, screened top three bilingual token-overlap matches against 695 live/open-draft school pairs in stages1/2. Withheld skipped-count-word and ordered binary code with unequal adjacent symbols because of proximity to held missing-position and binary-string constraint families. Preliminary JSON commit ebe5883fe63bed5964fe7cc52e2d4879234fd3c8 is NOT a publication payload; final six are in one-time scripts/publish_reviewed_v23_gap_school_20261126.sql, commit 3c711bb3186fc36e3cf7995f575302e16f2deaf2. Retained model-selection subtraction, repeated-digit pattern counting, length with gap (explicit no overlap in both languages), maximum area from base-height pairs, nonassociativity of fraction subtraction, strict/inclusive interval modeling. Compared closest matches and all four hold registries; independently recalculated answers, verified unique correct option, bilingual hints, calculations and distractors. Semantic review targeted, not exhaustive. Trial ROLLBACK passed, keys independently absent before COMMIT, exact readback6/6 on wizard, flat and structured solution, stem/title, options, scope, primary skill and track, Published revision3, four owner_sql events each (24). No taxonomy, learner data, entitlement, application or authentication changes; university20/21 remain unpublished. DO NOT replay.

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v23-grade-1-choose-subtraction-expression-1 |1290|2001|1/1/2|7994=9-4|
| growth-v23-grade-2-length-measurement-gap-1 |1291|2002|2/82/321|7999=13|
| growth-v23-grade-2-repeated-digits-skip-pattern-1 |1292|2003|2/81/302|8002=5|
| growth-v23-grade-6-choose-max-triangle-area-pair-1 |1293|2004|6/3/14|8007=(7,6)|
| growth-v23-grade-6-fraction-expression-order-1 |1294|2005|6/21/95|8011=1/2|
| growth-v23-grade-9-inequality-interval-endpoint-translation-1 |1295|2006|9/84/327|8015=2<x≤7|

Live951 (271/222/236/222), 541 structured (170/134/123/114), 410 missing (101/88/113/108). Draft418 (369 amendments+49 additions), Published775 (363 amendments+412 additions), Withdrawn1. Fresh best-five capped coverage758/1400 (601 school+157 mapped unpublished university), gap642 (599 school+43 university), 49 new to 1000. Cumulative #193:208 corrections+102 new. All six add capped coverage. Next legacy641 onward, skip all recorded holds; continue distinct linked expansion, coordinate missing category slots and access-policy review. CI/browser rendering not verified. #179 owner should reconcile canonical keys and held families, no replay.


## Owner-authorized production checkpoint — 19 school/university amendments (2026-11-26)
Start951 live/541 structured/410 missing. Reviewed drafts641–670 and all four hold registries. Held641,642,646,648,651,654–656 for shared bilingual LaTeX option runtime verification; 662,663 for Grade5 triangle area placement; 667 for unescaped percent options. Reviewed and published 19 amendments643–645,647,649,650,652,653,657–661,664–666,668–670. Independently checked combinatorial counts, equivalence classes, complete graphs, fraction order/distance/open interval, convergent geometric sums, carrying/missing addend/rounding/word problems, triangle height/halving rectangle, percent and equations. Improved bilingual steps, option-specific distractors, conditions and verification. Preserved original IDs, stems, titles, option strings/order/flags, points and mappings; university sources489–491 retain exact tracks17+20. Trial ROLLBACK and independent unchanged check19/19, COMMIT, exact independent readback19/19 of wizard, structured and flat solutions, protected content, options, primary skill, mappings and 76 owner_sql events. One-time SQL scripts/apply_reviewed_legacy_643_670_20261126.sql commit c7368ae21ed4f76d1d3ff5ea58e2ed56ab9c18e4 ALREADY APPLIED, DO NOT replay. Commit message says18 in error; actual count19 confirmed. Correct option IDs1946,1951,1955,2002,2012,2014,2022,2026,2426,2431,2434,2439,2443,2454,2459,2462,2470,2475,2480. Live951 (271/222/236/222),560 structured (182/136/125/117),391 missing (89/86/111/105). Draft399 (350 amendments+49 additions), Published794 (382 amendments+412 additions), Withdrawn1. Cumulative #193:227 corrections+102 new. Coverage758/1400 unchanged, gap642; 49 new to1000. Next671 onward. No taxonomy, subscription, learner data, UI or auth changes; levels20/21 unpublished. CI/browser not verified.


## Owner-authorized production checkpoint — eight original linked gap problems (v24, 2026-11-26)
Start951 live/560 structured/391 missing. Inspected remaining49 addition drafts and current category/skill links; most school drafts have missing links, others have existing overlap/placement holds. No bulk replay. Authored eight genuinely different bilingual school items across grades1,2,6,9. Screened all four hold registries, full current linked stems in those grades and top three bilingual token overlap matches against687 school live/open-draft pairs; targeted semantic screening, not exhaustive. Independently recalculated all answers: paired plus unpaired objects, subtraction-error magnitude, equal add/remove, remaining strip length, fractional full-cup remainder, compensating triangle dimensions, symmetric MAD inverse, route-length saving. Preparation JSON commit66e1931a77790050bfbe2ad86757957bad83c57c is not a publication payload. Final one-time SQL scripts/publish_reviewed_v24_gap_school_20261126.sql commit cd0da902c092c057f64b2f0a6faa85d237ad5833 ALREADY APPLIED, DO NOT replay. ROLLBACK rehearsal passed, verified keys absent, COMMIT, independent exact readback8/8 for wizard, title/stem, solutions, options, primary skill/track/scope, Published revision3 and32 owner_sql audit events. No taxonomy, entitlement, learner data, app or auth changes; levels20/21 remain unpublished.

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v24-grade-1-count-paired-objects-with-unpaired-1 |1304|2015|1/81/302|8051=7|
| growth-v24-grade-1-subtract-explain-incorrect-remaining-1 |1305|2016|1/1/2|8053=1|
| growth-v24-grade-2-length-cut-equal-pieces-unused-end-1 |1306|2017|2/82/321|8057=7|
| growth-v24-grade-2-undo-equal-add-remove-1 |1307|2018|2/1/3|8062=47|
| growth-v24-grade-6-fraction-division-unit-remainder-1 |1308|2019|6/21/95|8065=1/8|
| growth-v24-grade-6-triangle-area-base-height-change-1 |1309|2020|6/3/14|8070=24|
| growth-v24-grade-9-mad-unknown-symmetric-extreme-1 |1310|2021|9/22/98|8074=6|
| growth-v24-grade-9-pythagorean-alt-route-extra-distance-1 |1311|2022|9/34/37|8078=6|

Live959 (277/224/236/222),568 structured (188/138/125/117),391 missing (89/86/111/105). Draft399 (350 amendments+49 additions), Published802 (382 amendments+420 additions), Withdrawn1. Capped766/1400 (609 school+157 mapped university), gap634 (591 school+43 university), all8 contribute; grade1–12 capped22,33,50,57,56,29,76,69,41,65,61,50; levels20=78,21=79. Cumulative #193:227 corrections+110 new. 41 new to1000. Seven school missing category slots and one university remain; do not bypass curriculum/access policy review. Next legacy671 onward. CI/browser rendering not verified. Reconcile canonical keys in #179 without replay.


## Owner-authorized production checkpoint — 30 school/university amendments (2026-11-26)
Start959 live/568 structured/391 missing. Reviewed drafts671–700, all four hold registries (no matching held keys). Recomputed equations and modeling, circle/semicircle area and inverse radius, proportional quantities, trigonometric identities and signs, logarithms with domain conditions, population variance and scaling, dot products and orthogonality, span/rank/independence and sequence limit. Added bilingual worked steps and concrete distractor explanations; preserved existing source stems, titles, IDs, options/order/flags, points and mappings; university sources645–648,650–653 retain their exact old course and level20 links. Trial ROLLBACK, independent unchanged check30/30, COMMIT, independent exact readback30/30 for wizard, structured/flat solutions, protected content, options, primary skill, mappings and120 owner_sql events. One-time script scripts/apply_reviewed_legacy_671_700_20261126.sql commit9e472163444822f57725e36186ea334a1bc84ab5 ALREADY APPLIED, DO NOT replay. Correct option IDs2483,2486,2490,2495,2499,2502,2506,2510,2515,2519,2522,2526,2530,2534,2538,2541,2547,2552,2553,2558,2561,2567,2570,2574,2579,2581,2591,2594,2599,2602. Live959 (277/224/236/222),598 structured (188/148/137/125),361 missing (89/76/99/97). Draft369 (320 amendments+49 additions), Published832 (412 amendments+420 additions), Withdrawn1. Cumulative #193:257 corrections+110 new. Coverage766/1400 unchanged; gap634; 41 new to1000. Next701 onward. No taxonomy, subscription, learner data, app or auth changes; levels20/21 unpublished. CI/browser rendering not verified.


## Owner-authorized production checkpoint — six original linked gap problems (v25, 2026-11-26)
Start959 live/598 structured/361 missing. Authored eight bilingual candidates, checked all four hold registries and current grade1/2/6/9 linked stems, reviewed top three bilingual overlap matches against685 live/open-draft school pairs. Withheld two candidates (measurement with equivalent units close to source1728, obtuse triangle direct area close to source615/held663 and exterior foot not explicit); no import of those. Independent recalculation of remaining six: missing removed count, count shared marked objects once, count steps from offset, weighted attendance percentage, inequality counterexample, disjoint event probability. Preliminary JSON commit569b6d23838a601724ff8ee3927ecc701b0fcd9f NOT a publication payload. Final one-time SQL scripts/publish_reviewed_v25_gap_school_20261126.sql commit088207edf5ac81c1bedacb81fd1f245bee1d01c3 ALREADY APPLIED, DO NOT replay. ROLLBACK rehearsal passed; independently verified keys absent; COMMIT; exact independent readback6/6 across wizard, protected content, solutions, options, primary skill and track scope, Published rev3 and24 owner_sql audit events. No taxonomy, entitlement, learner data, app or auth changes; university20/21 unpublished. Targeted semantic screen is not exhaustive; CI/browser not verified.

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v25-grade-1-count-distinct-labels-shared-boxes-1 |1318|2029|1/81/302|8107=5|
| growth-v25-grade-1-missing-removed-count-from-before-after-1 |1319|2030|1/1/2|8110=4|
| growth-v25-grade-2-count-multiples-five-from-offset-1 |1320|2031|2/81/302|8114=5|
| growth-v25-grade-6-percent-weighted-two-group-attendance-1 |1321|2032|6/21/93|8118=72%|
| growth-v25-grade-9-inequality-check-counterexample-wrong-sign-1 |1322|2033|9/84/327|8121=-4|
| growth-v25-grade-9-probability-disjoint-events-from-union-1 |1323|2034|9/85/337|8127=0.45|

Live965 (281/226/236/222),604 structured (192/150/137/125),361 missing (89/76/99/97). Draft369 (320 amendments+49 additions), Published838 (412 amendments+426 additions), Withdrawn1. Capped772/1400 (615 school+157 mapped university), gap628 (585 school+43 university), all6 contribute. Grade1–12 capped24,34,50,57,56,30,76,69,43,65,61,50; level20=78,21=79. Cumulative #193:257 corrections+116 new. 35 new to1000. Seven school missing category slots and one university remain. Next legacy701 onward; reconcile canonical keys in #179 without replay; continue differentiated growth.


## Owner-authorized production checkpoint — nine original linked gap problems (v26, 2026-11-26)
Start965 live/604 structured/361 missing. Reviewed current published track-category-skill links across grades1,2,3,6,9,12 and current target-category stems. Initial candidate construction failed on translation separator before any database write; rebuilt with a non-mathematical delimiter and validated bilingual fields. Authored ten final candidates, reviewed top three bilingual token overlap matches against1008 live/open-draft school pairs and all four hold registries. Withheld shifted-centre circle point membership due to overlap with live1618/draft862. Independent recalculation of nine: equal-difference compensation, one-to-one counting, even-card count with repeated labels, unequal-length fraction model, finish-time comparison, no-solution inequality, dot-product bilinearity, comparison of half-lives, trigonometric fourth-power difference. Candidate JSON commit7252f416ee1e6a12e9cb7950bdbb4e3c0470a4fd is NOT an import payload; final SQL scripts/publish_reviewed_v26_gap_school_20261126.sql commit04f9b0f1f7aa30e9795ccb74ef972a178b836bb1 ALREADY APPLIED, DO NOT replay. ROLLBACK rehearsal succeeded; independently verified keys absent; COMMIT; exact independent readback9/9 for wizard, bilingual title/stem, flat/structured solution, options, primary skill and scope, Published revision3 and36 owner_sql events. No taxonomy, subscriptions, learner data, app, auth or university visibility changes; levels20/21 remain unpublished. Targeted overlap screening not exhaustive; CI/browser not verified.

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v26-grade-1-equal-difference-compensation-1 |1333|2044|1/1/2|8167=14-5|
| growth-v26-grade-1-match-one-to-one-1 |1334|2045|1/81/302|8170=2|
| growth-v26-grade-2-count-even-repeated-cards-1 |1335|2046|2/81/302|8174=3|
| growth-v26-grade-3-compare-finish-times-1 |1336|2047|3/82/324|8178=(B,5)|
| growth-v26-grade-3-fraction-unequal-length-parts-1 |1337|2048|3/21/97|8182=3/8|
| growth-v26-grade-9-cancel-variable-contradiction-1 |1338|2049|9/84/327|8188=empty set|
| growth-v26-grade-12-bilinear-sum-difference-1 |1339|2050|12/87/338|8191=16|
| growth-v26-grade-12-compare-two-half-lives-1 |1340|2051|12/86/310|8195=30|
| growth-v26-grade-12-fourth-power-difference-1 |1341|2052|12/10/47|8198=0.4|

Live974 (286/227/239/222),613 structured (197/151/140/125),361 missing (89/76/99/97). Draft369 (320 amendments+49 additions), Published847 (412 amendments+435 additions), Withdrawn1. Best-five capped779/1400 (622 school+157 mapped university), gap621 (578 school+43 university); seven of nine additions increase capped count, two in tied/underrepresented categories diversify coverage without increasing capped count immediately. Grade1–12 capped26,35,51,57,56,30,76,69,44,65,61,52; level20=78,21=79. Cumulative #193:257 corrections+125 new. 26 new to1000. Next legacy701 onward; seven school missing category slots and one university remain. Reconcile canonical keys in #179 without replay.
