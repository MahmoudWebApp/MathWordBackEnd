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


## Owner-directed category breadth update — minimum 5, maximum 10 per grade/level (2026-11-26)
Owner requests 5–10 coherent, standards-informed categories per each of the 12 school grades and two university levels, with the previously agreed at least20 distinct problems per category. Five per track is the launch floor (1400 capped assignments), not the whole catalogue target; do not delete existing categories or fill unrelated slots to achieve quotas. Distinguish shared category definitions from category placements within a track. All 14 tracks currently have <=10 populated valid categories. Reviewed live inventory and the earlier proposed school/university gaps and taxonomy v2; verified current main Services/ProblemCategoryAccessService.cs and LearningTrackService.cs. Main access implementation selects the first two valid populated categories per track by Categories.Order then Id; legacy StageFreeCategorySelections rows are audit-only. Do not assume explicit rows pin access. Current grade1/2 free pairs[1,81], grade6[2,3], level20[14,16]. Adding school categories3/4 to grade1/2 would alter free pair (3 or4 would replace81); coordinate access-safe resolution before publishing those links, no app/entitlement changes here. Rechecked valid links using exact backend stage/category/skill/domain/published checks. References: Cambridge Primary 0096 https://www.cambridgeinternational.org/programmes-and-qualifications/cambridge-primary/curriculum/mathematics/ ; CCSS 1.MD https://www.thecorestandards.org/Math/Content/1/MD/ and 1.G https://www.thecorestandards.org/Math/Content/1/G/ ; 2.G https://www.thecorestandards.org/Math/Content/2/G/ and 2.MD.D.10 https://www.thecorestandards.org/Math/Content/2/MD/D/10/ ; 6.SP https://www.thecorestandards.org/Math/Content/6/SP/ and 6.NS.C https://www.thecorestandards.org/Math/Content/6/NS/C/6/ ; OECD PISA reasoning https://www.oecd.org/en/publications/pisa-2022-assessment-and-analytical-framework_dfe0bf9c-en/full-report/component-3.html ; MAA CUPM https://maa.org/resource/cupm-guide/ ; MSC2020 https://mathscinet.ams.org/msc/msc.html . These guide the independent MathWorld curriculum, not external accreditation. Full item-level Cambridge framework verification remains pending where objective text is not publicly accessible.

### First actual category-gap publication v27
Start974 live/613 structured/361 missing. Added two existing category definitions to previously unlinked grades with real content in same transaction: grade1/category82 Measurement & Units (skills321 length,324 time); grade6/category4 Data & Basic Probability (skills18 median,19 mean). No new global category rows or skill definitions; no reordering or historic remapping. Scope: CCSS 1.MD.A.2 and 1.MD.B.3 (informal length units and hour/half-hour), 6.SP.B.5.c (centre in context); Cambridge strands Geometry and Measure, Statistics and Probability. Authored six bilingual questions, screened four hold registries and top four bilingual token-overlap matches across1017 live/open-draft school pairs. Withheld indirect strip comparison (close to source1972 and shared English answer labels). Independently recalculated remaining five; appropriate difficulty and solution detail. Preparation JSON commit265b342c3c5eb685290fcbbf36c57f8e12f81ff1 is NOT an import payload. Final one-time SQL scripts/publish_reviewed_v27_category_gap_20261126.sql commit c5209b2a3007c8905f90d516ab1157360485733d ALREADY APPLIED, DO NOT replay. Track revisions pinned27/29 before trial; transaction records snapshots of all effective track and stage Free pairs, locks tracks, inserts exactly two category and four skill links, inserts five problems with normal editorial audit, checks valid categories are populated and before/after free pairs identical. ROLLBACK rehearsal passed, independently verified zero keys/new links before COMMIT; exact post-write readback5/5 (wizard, content, options, flat and structured solutions, primary skill and track) and20 owner_sql events. Independent valid-link query confirms grade1 3 categories (28 problems), grade6 4 categories (33 problems), unchanged Free pairs for all 14 tracked levels. University20/21 remain unpublished. No changes to learners, entitlement settings, existing problem IDs, app or authentication. Targeted overlap screen is not exhaustive; CI/browser rendering not verified.

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v27-grade-1-read-half-hour-from-clock-hands-1 |1347|2058|1/82/324|8222=2:30|
| growth-v27-grade-1-same-size-unit-length-iteration-1 |1348|2059|1/82/321|8226=4|
| growth-v27-grade-6-mean-combine-frequency-counts-1 |1349|2060|6/4/19|8229=4|
| growth-v27-grade-6-mean-compare-two-equal-total-different-count-1 |1350|2061|6/4/19|8234=2|
| growth-v27-grade-6-median-from-ordered-frequency-groups-1 |1351|2062|6/4/18|8238=3|

Live979 (291/227/239/222),618 structured (202/151/140/125),361 missing (89/76/99/97). Draft369 (320 amendments+49 additions), Published852 (412 amendments+440 additions), Withdrawn1 (assuming no independent editorial writes; recheck live counts). Valid populated category counts grade1–12:3,3,6,8,7,4,8,8,5,6,9,6; university20=4,21=5. Six missing placements to reach five (school5, university1) rather than prior eight. Best-five capped784/1400 (627 school+157 mapped university), gap616 (573 school+43 university); all five additions contribute. Cumulative #193:257 corrections+130 new. 21 new to1000.

### Remaining category-placement work (proposal, not published)
- Grade1: category3 shape attributes/composition, category4 elementary count-based data; both need new age-appropriate skill definitions and Free-pair conflict resolved without reordering affecting other grades. No advanced probability/means or angle sums.
- Grade2: category3 shape attributes/equal shares, category4 single-unit pictographs/bar charts; use genuinely grade-appropriate skills and accessible diagrams or equivalent text; same Free-pair conflict. No empty categories.
- Grade6: rational number order, signed number-line position and absolute value (6.NS.C.5–7), assess whether existing primary category81 is coherent for this scope or a distinct primary category is necessary (middle-school83 cannot be linked across stages). New published skills and real reviewed items required; free pair[2,3] preserved. Deepen grade6 category4 distributions later.
- University level1: coherent single-variable calculus category covering differentiation/integration, excluding existing limits/continuity and series duplication; CUPM full course-area/prequisite review and stable-key/domain/skill/icon/description and placement plan, no automatic course-level splitting, preserve prior university mappings and visibility. Stage/track entitlement and category order must be checked before creation; no empty global category. Existing level2 five categories sufficient for floor, expand only if curriculum justifies it.
- Continue school breadth and depth across all 14 tracks, with first priority on missing slots and then individual category depth. Do not force every track to ten. Next legacy amendment701 onward. Reconcile #179 canonical records; do not replay SQL. Free conflict requires coordination with the application owner thread; this bank thread does not modify the access service.


## Owner-authorized category breadth checkpoint v28 — Grade 6 reaches five categories (2026-11-26)
Start979 live/618 structured/361 missing. Reviewed existing primary category81 Number Sense & Place Value description (includes number sense, comparison), published numbers-operations domain1, existing middle-school signed-number skills307–309 and current published stems. Selected existing category81 for conceptual signed rational number sense rather than duplicate global category or cross-stage link to category83. Added one distinct primary-stage skill345 primary-signed-rational-number-sense for grade6 only: sign relative to reference zero, rational number position/order, opposites, absolute value vs order. CCSS 6.NS.C.5–7 (https://www.thecorestandards.org/Math/Content/6/NS/C/5/ ; https://www.thecorestandards.org/Math/Content/6/NS/C/6/ ; https://www.thecorestandards.org/Math/Content/6/NS/C/7/), Cambridge Primary Mathematics 0096 number strand (https://www.cambridgeinternational.org/programmes-and-qualifications/cambridge-primary/curriculum/mathematics/); not external certification. Full Cambridge objective-level verification still pending. No Grade7 signed-arithmetic scope introduced. All four hold registries checked; top four bilingual token overlaps reviewed against1348 live/open-draft pairs, and signed-number category stems reviewed. Independently reviewed five answers and bilingual worked solutions. Candidate JSON d4e760ad22930359d9039b58634bf8765b4b6551 is NOT importable (skill placeholder0). Final one-time SQL scripts/publish_reviewed_v28_grade6_number_sense_20261126.sql commit4c354cef46b11e1e883a894130482702a6c74f81 ALREADY APPLIED, DO NOT replay. Guard pinned grade6 revision32 and prior Free pair[2,3], inserted new skill via identity and linked grade6/category81/skill345, populated five new problems in the same transaction, checked every stage/track Free pair unchanged and new valid category count5. ROLLBACK rehearsal, independent zero keys/link/skill, COMMIT, exact independent readback5/5,20 owner_sql audit events; all 14 tracked free pairs unchanged. No existing category definitions/order, learner data, entitlement settings, auth or app changes. Levels20/21 remain unpublished.

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v28-grade-6-absolute-value-versus-order-1 |1357|2068|6/81/345|8264=a<b, abs(a)>abs(b)|
| growth-v28-grade-6-opposite-of-opposite-reference-1 |1358|2069|6/81/345|8265=-3/4|
| growth-v28-grade-6-signed-fraction-between-negative-integers-1 |1359|2070|6/81/345|8271=-3/2|
| growth-v28-grade-6-signed-number-context-reference-1 |1360|2071|6/81/345|8274=(-18,12)|
| growth-v28-grade-6-signed-rational-comparison-temperature-1 |1361|2072|6/81/345|8278=B|

Live984 (296/227/239/222),623 structured (207/151/140/125),361 missing (89/76/99/97). Valid populated category counts grades1–12:3,3,6,8,7,5,8,8,5,6,9,6; university20=4,21=5. Five missing placements (grade1 two, grade2 two, university level1 one). Best-five capped789/1400, gap611 (632 school+157 mapped university). Grade6 reaches five categories but only38/100 assignments, so depth still incomplete. Cumulative #193:257 corrections+135 new;16 new to1000. Priority remaining category placements; grade1/2 geometry/data still require access-order conflict resolution, university level1 single-variable differentiation/integration requires coherent curriculum review. Next legacy701 onward. CI/browser rendering not verified; targeted semantic screen not exhaustive.


## Owner-authorized category breadth checkpoint v29 — University Level 1 reaches five mapped categories (2026-11-26)
Start984 live/623 structured/361 missing. Reviewed live university categories/skills and old calculus track13, level20 mappings; reviewed secondary calculus category11 questions for overlap. Verified MAA CUPM actual Calculus Sequence course-area report (https://maa.org/wp-content/uploads/2024/06/CalculusCASGReportFinal.pdf, especially p2 on instantaneous change, accumulation, FTC; p4 non-template reasoning), MSC2020 26A06 (https://mathscinet.ams.org/mathscinet/msc/msc2020.html?s=26A33), MathWorld taxonomy v2 u-single-calculus. Added global category93 Single-Variable Calculus at stage4 order10, Arabic/English scope excludes existing limits, sequences, multivariable and optimization topics. Reused existing calculus icon URL from category11; runtime rendering not tested. New skills348 u-single-calculus-differentiation and349 u-single-calculus-integration in published calculus-analysis domain5. Both mapped to existing published course13 and unpublished level20; no changes to prior mappings, category order, free entitlements, users, authentication or level publication flags. Five original bilingual problems cover related rates, two moving integral bounds, linearization, definite substitution, distance vs displacement. All four hold registries checked; top four bilingual overlap matches against1353 live/open-draft pairs inspected; no identical stem or mathematical family among selected items. Candidate JSON77ced88aad01e12cb2b41b42a4b9fc7aeb714df5 is NOT an import payload (category/skill placeholders0). Corrected related-rates verification for instantaneous derivative before final SQL. One-time SQL scripts/publish_reviewed_v29_university_calculus_20261126.sql commit1c153243df7564c3881c4320a4e9660e1a5c81fb ALREADY APPLIED, DO NOT replay. Guard pinned revisions46/43 of tracks13/20, checked all stage and track effective Free pairs unchanged; level20 count5, both level flags remain false. Rollback rehearsal passed, independently verified zero keys/categories/skills, committed, exact independent readback5/5 for bilingual content, options, solutions, primary skill and dual mappings;20 owner_sql events. No external accreditation claimed. Targeted semantic screening not exhaustive; CI/browser not verified.

| Content key | Draft | Problem | Tracks/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v29-university-level-1-accumulated-distance-versus-net-displacement-1 |1367|2078|13+20/93/349|8303=13/2|
| growth-v29-university-level-1-ftc-two-moving-limits-1 |1368|2079|13+20/93/349|8307=8|
| growth-v29-university-level-1-linearization-square-root-near-point-1 |1369|2080|13+20/93/348|8310=5.1|
| growth-v29-university-level-1-related-rates-circle-expansion-1 |1370|2081|13+20/93/348|8314=3pi|
| growth-v29-university-level-1-substitution-definite-rational-1 |1371|2082|13+20/93/349|8319=1/2|

Live989 (296/227/239/227),628 structured (207/151/140/130),361 missing (89/76/99/97). Valid populated categories grades1–12:3,3,6,8,7,5,8,8,5,6,9,6; level20=5,21=5. Twelve of fourteen meet category count floor; remaining four placements are grade1/2 geometry and elementary data. Both university levels remain unpublished; mapped coverage not student visibility. Level20 capped83/100, level21=79/100. Best-five capped794/1400 (632 school+162 mapped university), gap606. Cumulative #193:257 corrections+140 new,11 to1000. Grade1/2 existing categories3/4 would displace Free81 under current order policy; resolve with application thread or choose a nonoverlapping taxonomy approach that does not change effective free pairs. Do not create duplicate categories or reorder to bypass access. Next legacy701 onward; continue depth while access conflict resolved; reconcile #179 canonical keys without replay.


## Milestone v30 — 1,000 live problems and 5–10 populated categories per grade/level (2026-11-26)
Start989 live/628 structured/361 missing. Rechecked main access service: first two valid populated categories by global category order; grade1/2 existing Free[1,81] unchanged. Read every primary category3/4 live question and skill: cat3 currently numerical perimeter, area, angle sums, unit conversions; cat4 mean, median, mode, simple probability. No primary shape-recognition/composition/partition or simple category-count/pictograph skill existed. Chose pedagogically distinct specialized categories consistent with taxonomy v2 shape strand and data representation goals, instead of linking broad existing categories and displacing Free81. New global primary category96 Shapes and Spatial Reasoning (order9) excludes numerical area/perimeter/angle calculations; category97 Data Representation and Reading (order10) excludes mean/median/mode/probability. Existing broad names/descriptions remain unchanged; no historic problem moves or global reordering. Reused category3/4 icons (runtime and visual distinction not yet tested). Primary now10 global categories. New skills354 grade1 shape attributes/composition;355 grade2 solid attributes/shape partition;356 grade1 simple category counts;357 grade2 single-unit pictographs. Four new track-category links, one skill per track/category. Standards checked CCSS 1.G.A.1–2,1.MD.C.4,2.G.A.1–3,2.MD.D.10: https://www.thecorestandards.org/Math/Content/1/G/ ; https://www.thecorestandards.org/Math/Content/1/MD/ ; https://www.thecorestandards.org/Math/Content/2/G/ ; https://www.thecorestandards.org/Math/Content/2/MD/ . Cambridge primary strands and public progression https://www.cambridgeinternational.org/programmes-and-qualifications/cambridge-primary/curriculum/mathematics/ and https://cambridge-community.org.uk/guide-to/cambridge-primary/mathematics/ ; full framework objective-by-objective verification remains pending. No accreditation claimed.

Authored12 candidates, held picture-graph-compare-two-rows for near overlap with source823/draft777, revised cube-count to true shape composition with two squares and clarified two other stems; screened all four hold registries and top3 bilingual token matches against1358 live/open-draft pairs, including re-screen of revised questions. Candidate JSON2d33ed9e81dcc1f02481ae6cf84a9f05004dcf75 NOT importable, final one-time SQL scripts/publish_reviewed_v30_early_geometry_data_20261126.sql commit22a7aa8dd58e0ec2bf2bb68910779c648b3d04c1 ALREADY APPLIED, DO NOT replay. Guard pinned grade1/2 revisions29/30, locked tracks, created two category and four skill definitions and links plus11 reviewed bilingual problems atomically, checked every effective stage and track Free pair unchanged and populated valid categories. ROLLBACK rehearsal passed, independently checked zero keys/categories/skills; COMMIT; independent exact readback11/11 and44 owner_sql events. No existing category order, learner data, permission settings, app, auth or university visibility changes. Targeted semantic screen not exhaustive; CI, browser/Flutter RTL pictograph rendering and reused icons not tested.

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v30-grade-1-data-count-missing-category-1 |1383|2094|1/97/356|8366=3|
| growth-v30-grade-1-data-most-least-gap-1 |1384|2095|1/97/356|8371=4|
| growth-v30-grade-1-data-total-three-exclusive-groups-1 |1385|2096|1/97/356|8375=12|
| growth-v30-grade-1-shape-closed-three-straight-sides-1 |1386|2097|1/96/354|8377=A|
| growth-v30-grade-1-shape-compose-square-tiles-1 |1387|2098|1/96/354|8382=B|
| growth-v30-grade-1-shape-turn-does-not-change-1 |1388|2099|1/96/354|8387=4|
| growth-v30-grade-2-picture-graph-find-inconsistent-statement-1 |1389|2100|2/97/357|8392=4|
| growth-v30-grade-2-picture-graph-update-one-row-1 |1390|2101|2/97/357|8394=B>A=C|
| growth-v30-grade-2-shape-array-cover-missing-square-1 |1391|2102|2/96/355|8399=11|
| growth-v30-grade-2-shape-cube-face-edge-distinction-1 |1392|2103|2/96/355|8402=6|
| growth-v30-grade-2-shape-equal-shares-partition-1 |1393|2104|2/96/355|8405=A|

Verified live1000 (307/227/239/227), structured639 (218/151/140/130), missing361 (89/76/99/97). Draft369 (320 amendments+49 additions), Published873 (412 amendments+461 additions), Withdrawn1. Valid populated category counts grades1–12:5,5,6,8,7,5,8,8,5,6,9,6; mapped university20=5,21=5. All14 meet 5–10 category-count constraint; zero missing category slots. University20/21 still unpublished. Best-five capped805/1400 (643 school+162 mapped university), gap595 (557 school+38 university). Per-track capped34,40,51,57,56,38,76,69,44,65,61,52,83,79. Only8 track/category placements currently contain >=20 valid linked problems; this is NOT complete curriculum depth and not verified distinct-family mastery. Cumulative #193:257 legacy corrections+151 new. Next priority: grow depth in each category toward20 distinct questions, not arbitrary category creation; grades1/2/6/9 first; new category scope review with product owner if existing broad labels need refinement. Continue legacy701 onward, reconcile canonical #179 keys; preserve all Free pairs and university flags. No further category breadth required for minimum; 20 per every existing category is a larger target than best-five 1400 and must be calculated separately. 


## Primary depth checkpoint v31 (2026-11-26)
Start1000 live/639 structured/361 missing; all14 tracks meet the5–10 populated category requirement. Initial ten-candidate construction failed on a missing bilingual field before any database write; rebuilt eight candidates with complete bilingual fields. Prioritized grade1 length, time, shape attributes and data classification; grade2 equal-area partitions and transfer within pictographs; grade6 median after insertion and mean invariance. Checked all four hold registries, current target linked stems and top3 bilingual overlap matches across1369 live/open-draft pairs. Candidate JSON5bd4d8bbc58c62e52cb90356507ba8ce3a5b9a8a is NOT an import payload. Reviewed answers and guard conditions. Final one-time SQL scripts/publish_reviewed_v31_primary_depth_20261126.sql commit7ac495a498093cc49b34a735a149c6350425cfa9 ALREADY APPLIED, DO NOT replay. Rollback rehearsal, independent zero keys, commit, exact independent readback8/8 for bilingual title/stem, ordered choices, full solutions, wizard and primary skill/track links;32 owner_sql audit events. Existing category/skill links only; no changes to global taxonomy, entitlement settings, learner data, app or auth. University20/21 flags remain false. Runtime display and exhaustive duplicate-family audit not verified.

| Content key | Draft | Problem | Track/category/skill | Correct option |
|---|---:|---:|---|---|
| growth-v31-grade-1-classify-observations-ordered-counts-1 |1402|2113|1/97/356|8442=(3,2)|
| growth-v31-grade-1-common-attribute-triangle-square-1 |1403|2114|1/96/354|8447=C|
| growth-v31-grade-1-compare-identical-informal-units-1 |1404|2115|1/82/321|8449=2|
| growth-v31-grade-1-order-hour-half-hour-1 |1405|2116|1/82/324|8455=8:30|
| growth-v31-grade-2-equal-halves-different-outlines-1 |1406|2117|2/96/355|8459=C|
| growth-v31-grade-2-picture-graph-transfer-between-categories-1 |1407|2118|2/97/357|8463=12|
| growth-v31-grade-6-mean-unchanged-add-mean-value-1 |1408|2119|6/4/19|8466=6|
| growth-v31-grade-6-median-even-after-extreme-insertion-1 |1409|2120|6/4/18|8470=8|

Live1008 (315/227/239/227),647 structured (226/151/140/130),361 missing (89/76/99/97). Best-five capped813/1400, gap587 (551 school+38 mapped university). Full current category depth separately calculated from valid linked problems: 88 placements across14 tracks, target1760, capped897, gap863. These are assignment counts capped at20 per category, not a claim of verified distinct mathematical families or fully complete curricula. Grade1/2/6 depth38/42/40 out of100. Cumulative #193:257 legacy corrections+159 new. Next prioritize depth in underfilled categories and legacy701 onward. Reconcile canonical #179 keys without replay.


## Legacy review checkpoint 701–724 (2026-11-26)
Reviewed 24 pending amendments; excluded 706/source691 and 713/source698 because existing hold registry flags them. Recomputed all 22 selected answers; reviewed stored hints and ideas; expanded individual bilingual derivations, conditions, substitution, verification and option-specific feedback. Used Latin/Greek mathematical notation. Retained original titles, question text, option IDs/order/flags, points and category/skill placements. Restored actual dual-track mappings to wizard for sources654–656 (13+20) and713 (13+21), not merely the older draft track arrays. All four hold registries checked; source SHA256 and draft MD5/revision pinned, exact live/open-draft duplicate guards, valid skill/domain/track checks. One-time SQL scripts/apply_reviewed_legacy_701_724_20261126.sql commit ad853da2946c0cd366803eb0b1cf0b54bb2430b6 ALREADY APPLIED, DO NOT replay. Rollback rehearsal passed; independent precommit unchanged22/22; committed once; independent exact readback22/22 (wizard revision4, solutions, protected fields, options and mapping) plus88 owner_sql audit events. No new problems, categories, permission or learner changes. Levels20/21 remain unpublished. CI/browser/Flutter rendering and full semantic duplicate audit not verified.

| Draft | Source | Correct option ID |
|---:|---:|---:|
|701|654|2605|
|702|655|2610|
|703|656|2615|
|704|689|2811|
|705|690|2815|
|707|692|2823|
|708|693|2826|
|709|694|2830|
|710|695|2835|
|711|696|2839|
|712|697|2843|
|714|699|2851|
|715|700|2747|
|716|701|2750|
|717|702|2756|
|718|703|2759|
|719|704|2762|
|720|709|2782|
|721|710|2787|
|722|711|2791|
|723|712|2795|
|724|713|2799|

Live1008 (315/227/239/227), structured669 (233/158/144/134), missing339 (82/69/95/93). Draft347 (298 amendments+49 additions), Published903 (434 amendments+469 additions), Withdrawn1. Cumulative #193:279 legacy corrections+159 new. Category coverage unchanged by amendment-only batch: best-five813/1400; all88 category placements capped897/1760, gap863. Next legacy725 onward, preserve holds and keep growing underfilled categories; reconcile #179 without replay.


## Legacy review checkpoint 725–751 (2026-11-26)
Reviewed28 pending amendments; held752/source782 excluded (existing editorial hold and mixed bilingual LaTeX options). Selected27 amendments across double integrals, limits, subtraction with regrouping, exponents, quadratics, recurrences, differential-equation order and geometric series. Reviewed existing bilingual ideas/hints, recalculated correct choices, expanded solution derivations, conditions, specific distractor feedback, substitutions, verification and common errors. Preserved titles, stems, option IDs/order/flags, points, video URLs, categories/skills and actual university mappings13+21,13+20,15+21. Checked four hold registries, source SHA256 and draft MD5/revision, owner, exact live/open-draft duplicates and valid placements. One-time SQL scripts/apply_reviewed_legacy_725_751_20261126.sql commit863f0241674d5b36b5205350196efd9ffa518a31 ALREADY APPLIED, DO NOT replay. Rollback rehearsal passed; independently confirmed27/27 unchanged before commit; exact independent postcommit readback27/27 on wizard revision4, solutions, options, protected fields and mapping;108 owner_sql events. No new problems or taxonomy, entitlement, student/auth/app changes. Levels20/21 remain unpublished. Runtime rendering and full semantic duplicate-family review not verified.

| Draft | Source | Correct option ID |
|---:|---:|---:|
|725|714|2802|
|726|715|2807|
|727|716|2854|
|728|717|2859|
|729|718|2862|
|730|719|2867|
|731|720|2871|
|732|761|3034|
|733|762|3038|
|734|763|3043|
|735|764|3046|
|736|765|3049|
|737|766|3054|
|738|767|3057|
|739|769|3067|
|740|770|3069|
|741|771|3074|
|742|772|3077|
|743|773|3082|
|744|774|3087|
|745|775|3092|
|746|776|3095|
|747|777|3099|
|748|778|3102|
|749|779|3105|
|750|780|3111|
|751|781|3114|

Live1008 (315/227/239/227), structured696 (237/161/152/146), missing312 (78/66/87/81). Draft320 (271 amendments+49 additions), Published930 (461 amendments+469 additions), Withdrawn1. Cumulative #193:306 legacy corrections+159 new. Category depth unchanged (best-five813/1400; all88 placements897/1760, gap863). Next legacy753 onward, retain hold752 and earlier holds; continue new content within underfilled categories, especially grades1/2/6/9; reconcile canonical #179 keys without replay.


## Blocked legacy checkpoint 753–778 (2026-11-26)
Read live questions/options/track mappings for 26 pending drafts. Checked all four holds; exclude 753,759,761,766,768,770,778. Recomputed the 19 remaining answers below. Full bilingual solution preparation attempted but fresh source snapshot request failed with connection timeout. A follow-up simple read returned PostgreSQL FATAL 57P03: database system is not accepting connections; Hot standby mode is disabled. No COMMIT was issued, no amendment SQL file was created, no database writes confirmed. Last confirmed totals remain1008 live/696 structured/312 missing; do not count this review as published. Do not restart or modify infrastructure from the content task. Resume by independently checking live DB health, draft status, current source fingerprints and actual dual mappings, then recreate guarded SQL with complete bilingual solutions/hints/distractors, rehearse rollback and independently verify before commit. 

| Draft | Source | Expected correct option ID | Recomputed result |
|---:|---:|---:|---|
|754|784|3126|telescoping sum 1|
|755|785|3131|5!/(2!2!)=30|
|756|786|3135|C(5,2)C(4,1)=40|
|757|787|3139|5*4*3=60|
|758|788|3143|4!=24|
|760|790|3151|2n+1|
|762|792|3158|2 is prime and even|
|763|793|3163|reflexive/transitive, not symmetric|
|764|794|3166|{1,2},{3}|
|765|795|3170|(1,3)|
|767|797|3179|2k+1=4|
|769|799|3187|a=2; continuity and both slopes|
|771|817|3257|9/12=3/4|
|772|818|3262|8/8+3/8=11/8|
|773|819|3267|(1/2)(3/4)=3/8|
|774|820|3272|(2/3)/4=1/6|
|775|821|3273|8+0.3+0.06=8.36|
|776|822|3278|0.47*10=4.7|
|777|823|3283|(6-3)*4=12|


## Recovered legacy checkpoint 754–777 (2026-11-26)
Supabase connection restored (initial read confirmed1008 live/696 structured). Independently refreshed all19 previously reviewed pending drafts, options, source fingerprints, draft hashes, actual track mappings, and all four hold registries. Expanded bilingual derivations and option-specific feedback; retained reviewed original hints and ideas. Seven prior held drafts753,759,761,766,768,770,778 excluded. One-time SQL scripts/apply_reviewed_legacy_754_777_20261126.sql commit80a00e44e06271c9c3e6726389780dbb600a3f59 ALREADY APPLIED DO NOT replay. Rollback rehearsal passed, independently confirmed19/19 unchanged, committed once, independent exact readback19/19 (revision4, wizard, solutions, options, protected fields and mappings),76 owner_sql events. No infrastructure changes or changes to students, access, categories, original stems/options/IDs. Preserved university dual mappings13+20 and17+20; both levels20/21 remain unpublished. Runtime and exhaustive semantic duplicate-family audit pending. Prior blocked-checkpoint table identifies exact19 source and correct-option IDs.

Live1008 (315/227/239/227), structured715 (243/162/152/158), missing293 (72/65/87/69). Draft302 (253 amendments+49 additions), Published949 (480 amendments+469 additions), Withdrawn1. Cumulative #193:325 corrections+159 new. Depth unchanged813/1400 and897/1760 (88 placements; gap863). Next legacy779 onward; preserve all holds; continue underfilled category growth and reconcile #179 without replay.


## Legacy review checkpoint 779–802 (2026-11-26)
Reviewed24 drafts, excluded held789 and796 (mixed bilingual option text). Recomputed22 answers across statistics, arithmetic/telescoping sums, graphs, Boolean algebra, multiplication/division, similarity, distance, differentiation, integration and initial-value ODEs. Reviewed stored hints and ideas and improved bilingual derivations, formula conditions, option feedback, substitutions, verification and common errors. Four hold registries, source fingerprint and draft hash/revision, active owner, exact live/open-draft duplicate and placement guards. One-time SQL scripts/apply_reviewed_legacy_779_802_20261126.sql commit f879aa40e9057746a890ccc5d700e1e624257be6 ALREADY APPLIED DO NOT replay. Rollback rehearsal passed; independent unchanged22/22; committed once; independent exact readback22/22 (wizard revision4, solutions, options, protected fields and actual track/skill mapping),88 owner_sql events. Kept actual university dual mappings17+20 and15+21. No new problems, category, entitlement, student/auth/app or infrastructure changes; levels20/21 remain unpublished. Runtime and exhaustive semantic duplicate-family audit pending.

| Draft | Source | Correct option ID |
|---:|---:|---:|
|779|825|3289|
|780|826|3294|
|781|827|3299|
|782|828|3304|
|783|829|3305|
|784|830|3310|
|785|831|3315|
|786|832|3320|
|787|833|3321|
|788|834|3326|
|790|852|3402|
|791|853|3406|
|792|854|3411|
|793|855|3415|
|794|856|3419|
|795|857|3422|
|797|859|3431|
|798|860|3433|
|799|861|3437|
|800|862|3443|
|801|863|3447|
|802|864|3449|

Live1008 (315/227/239/227), structured737 (246/167/160/164), missing271 (69/60/79/63). Draft280 (231 amendments+49 additions), Published971 (502 amendments+469 additions), Withdrawn1. Cumulative #193:347 corrections+159 new. Depth unchanged813/1400 and897/1760 (88 placements; gap863). Next legacy803 onward, continue underfilled category growth, retain holds, reconcile canonical #179 keys without replay. 


## Legacy review checkpoint 803–829 (2026-11-26)
Reviewed28 pending drafts803–830; excluded held826,827,828,830. Recomputed24 selected answers (initial-value ODEs, place value/rounding/estimation, signed rational arithmetic, exponential growth/decay, hypothesis testing). Original bilingual hints and ideas reviewed; expanded steps, conditions, substitution, verification and option-specific explanations; normalized solution result minus signs and grouping separators, preserving original option strings and IDs. First construction failed on JS syntax before database execution; saved revised bilingual review specifications scripts/reviewed_legacy_803_829_specs_20261126.json commit439801f68c2b47f2cd4bea68440c21afe8f7d1c0 (NOT an import payload). Checked four hold registries, source SHA256/draft MD5/revision, owner, exact live/open-draft duplicate and valid scope guards. One-time SQL scripts/apply_reviewed_legacy_803_829_20261126.sql commit149be2ca90508b08b2bd544f59247e099d1c525c ALREADY APPLIED DO NOT replay. Rollback rehearsal passed; independent precommit unchanged24/24; committed once; independent exact readback24/24 (revision4, wizard, solutions, protected fields, options, actual track/skill mapping);96 owner_sql events. Preserved university dual mappings15+21,16+21; levels20/21 unpublished. No taxonomy, access, app, learner or infrastructure changes. Runtime and exhaustive semantic duplicate-family audit pending.

| Draft | Source | Correct option ID |
|---:|---:|---:|
|803|865|3455|
|804|866|3394|
|805|1555|6211|
|806|1556|6214|
|807|1557|6219|
|808|1558|6222|
|809|1559|6227|
|810|1560|6232|
|811|1561|6234|
|812|1562|6239|
|813|1563|6243|
|814|1564|6246|
|815|1565|6251|
|816|1566|6254|
|817|1567|6258|
|818|1568|6263|
|819|1569|6266|
|820|1570|6272|
|821|1571|6274|
|822|1572|6279|
|823|1573|6282|
|824|1574|6287|
|825|1575|6291|
|829|1585|6330|

Live1008 (315/227/239/227), structured761 (254/175/165/167), missing247 (61/52/74/60). Draft256 (207 amendments+49 additions), Published995 (526 amendments+469 additions), Withdrawn1. Cumulative #193:371 corrections+159 new. Depth unchanged813/1400 and897/1760 (88 placements, gap863). Next legacy831 onward, preserve holds and continue category depth; reconcile canonical #179 keys without replay.


## Legacy review checkpoint 832–860 (2026-11-26)
Reviewed30 drafts831–860; excluded held831,852,857. Recomputed27 selected answers (measurement and conversion, elapsed time, inequalities, integer constraints, coordinate geometry, circles). Retained reviewed bilingual ideas/hints, improved derivations, substitutions, verification and choice-specific feedback. Specs scripts/reviewed_legacy_832_860_specs_20261126.json commit33e68f3019a656c164eea528beff05e9a8340962 NOT importable. Four hold registries checked; source SHA256, draft MD5/revision, owner, exact live/open-draft duplicate and valid placement guards. Full batch script e56feb06fc6e8a4f646cef78aa981d2764a34112 passed rollback rehearsal, but commit attempt failed with PostgreSQL57014 statement timeout; independent readback confirmed all27 unchanged. Nine-item rehearsal also failed with connection timeout; independent read again confirmed27 unchanged. Repartitioned into four smaller transactions, each rollback rehearsed, independent precommit unchanged check, single commit and independent exact readback. Applied partitions: 832–837 (6) 444bea9e789ae45cf07b129cb8231b820d13edf7; 838–844 (7) 37021214be642dcc423c5b27eeb3b2b2fa74ec37; 845–851 (7) 8a80b80c96993c3822de095021f582776c0e96f2; 853–860 excluding857 (7) c090a5c30cee6511631a26b2d45542bc049fe045. ALL APPLIED, DO NOT replay partitions OR original failed full batch. Independent exact readback27/27,108 owner_sql events. No changes to infrastructure, original stems, option IDs/flags, taxonomies, permissions, learners or app; levels20/21 unpublished. Runtime and exhaustive semantic duplicate-family audit pending.

| Draft | Source | Correct option ID |
|---:|---:|---:|
|832|1588|6341|
|833|1589|6347|
|834|1590|6350|
|835|1591|6356|
|836|1592|6358|
|837|1593|6363|
|838|1594|6365|
|839|1595|6371|
|840|1596|6376|
|841|1597|6378|
|842|1598|6383|
|843|1599|6386|
|844|1600|6389|
|845|1601|6395|
|846|1602|6400|
|847|1603|6401|
|848|1604|6406|
|849|1605|6411|
|850|1606|6416|
|851|1607|6418|
|853|1609|6427|
|854|1610|6432|
|855|1611|6435|
|856|1612|6440|
|858|1614|6446|
|859|1615|6451|
|860|1616|6456|

Live1008 (315/227/239/227), structured788 (265/186/170/167), missing220 (50/41/69/60). Draft229 (180 amendments+49 additions), Published1022 (553 amendments+469 additions), Withdrawn1. Cumulative #193:398 corrections+159 new. Depth unchanged813/1400 and897/1760 (88 placements, gap863). Next legacy861 onward; use small guarded transactions when DB latency demands; preserve holds, expand underfilled categories and reconcile canonical #179 keys without replay.


## Legacy review checkpoint 861–884 (2026-11-26)
Reviewed24 drafts861–884, none matched the four hold registries. Recomputed all24 answers (circle geometry and loci, bisection/Newton, numerical quadrature, absolute/relative/rounding error, Jacobi/elimination/residual, fractions and summary statistics). Reviewed stored bilingual hints and ideas, expanded derivations, conditions, substitutions, verification and option-specific feedback. Saved review specs scripts/reviewed_legacy_861_884_specs_20261126.json commit8280597e06e3ba2822f953c089581a0185c8b186 NOT importable. Preserved original option IDs/text/flags, actual track mappings incl18+21, titles, stems, points and videos. Source SHA256 and draft MD5/revision, owner, exact live/open-draft duplicate and scope guards. Used four six-item partitions to avoid prior timeout. Applied scripts 861–866 commit3e6cfc1657196d2c914be348ba911c9397d60908; 867–872 commit5357d865ca65c42b9980a810db83a54213a5f81d; 873–878 commit102d4bf9a75de911f4b4ef64a0fecd565e86654e; 879–884 commita2f9078ea88cbb1c80ce9d68944bf7140b2d9577. ALL APPLIED DO NOT replay. Each passed rollback rehearsal, independent precommit unchanged check6/6, one commit, independent exact readback6/6; overall24/24,96 owner_sql audit events. Removed redundant percent unit from solution874 since its answer already includes percent. No changes to taxonomy, permissions, learner records or app. University visibility [{"Id":20,"IsPublished":false},{"Id":21,"IsPublished":false}]. Runtime and exhaustive semantic duplicate-family audit pending.

| Draft | Source | Correct option ID |
|---:|---:|---:|
|861|1617|6458|
|862|1618|6463|
|863|1619|6467|
|864|1620|6469|
|865|1621|6476|
|866|1622|6478|
|867|1623|6483|
|868|1624|6485|
|869|1625|6492|
|870|1626|6493|
|871|1627|6498|
|872|1628|6504|
|873|1629|6507|
|874|1630|6510|
|875|1631|6516|
|876|1632|6517|
|877|1633|6524|
|878|1634|6527|
|879|1635|6529|
|880|1636|6534|
|881|1637|6539|
|882|1638|6544|
|883|1639|6546|
|884|1640|6551|

Live1008, structured812, missing196. Stage counts [{"StageId":1,"total":315,"structured":269},{"StageId":2,"total":227,"structured":188},{"StageId":3,"total":239,"structured":176},{"StageId":4,"total":227,"structured":179}]. Draft status [{"EditorialStatus":"Draft","amendments":156,"additions":49},{"EditorialStatus":"Published","amendments":577,"additions":469},{"EditorialStatus":"Withdrawn","amendments":0,"additions":1}]. Cumulative #193:422 corrections+159 new. Depth unchanged813/1400 and897/1760 (88 placements, gap863). Next legacy885 onward and underfilled category growth. Reconcile #179 without replay.


## Legacy review checkpoint 885–908 (2026-11-26)
Reviewed24 drafts, excluded held887,889,893,894,899. Recomputed19 answers (summary statistics, geometric series convergence, classical logic, place value, estimation, counting/probability, vectors). Reviewed bilingual ideas/hints, expanded derivations, substitution, verification and distractor-specific feedback. Saved specs scripts/reviewed_legacy_885_908_specs_20261126.json commit5c2b74485e61c4ce1aacde8fe3d477780264b816 NOT importable. Removed redundant percent unit from solution903. Four hold registries, source SHA256/draft MD5/revision, owner, exact live/open-draft duplicate and placement guards checked. Four small partitions applied: 885–891 (5) a0aa0773fdcd9b34fab900f286b6b17ac2c4a6c1; 892–898 (5) f3313c8475ec7a42b92038cefe9a816e89a4a3e0; 900–904 (5) b45ff442d36e63dbe0eee8b93330a5edcaec2ac5; 905–908 (4) b69fecbfb2ef13f51173fc1ae5412ae6c5da922c. ALL APPLIED DO NOT replay. Each passed rollback rehearsal, independent unchanged precommit read, one commit and independent exact readback. Overall19/19,76 owner_sql events. Preserved original stems/options/IDs, points, video, category/skill links and university dual mapping17+20. No student, entitlement, infrastructure or app changes; levels20/21 unpublished. Runtime and exhaustive semantic duplicate-family audit pending.

| Draft | Source | Correct option ID |
|---:|---:|---:|
|885|1641|6553|
|886|1642|6559|
|888|1644|6568|
|890|1646|6574|
|891|1647|6578|
|892|1648|6583|
|895|1651|6594|
|896|1652|6599|
|897|1653|6603|
|898|1654|6607|
|900|1656|6616|
|901|1657|6618|
|902|1660|6630|
|903|1661|6634|
|904|1662|6638|
|905|1663|6643|
|906|1664|6645|
|907|1665|6650|
|908|1666|6654|

Live1008, structured831, missing177. Stage counts [{"StageId":1,"total":315,"structured":274},{"StageId":2,"total":227,"structured":194},{"StageId":3,"total":239,"structured":182},{"StageId":4,"total":227,"structured":181}]. Draft status [{"EditorialStatus":"Draft","amendments":137,"additions":49},{"EditorialStatus":"Published","amendments":596,"additions":469},{"EditorialStatus":"Withdrawn","amendments":0,"additions":1}]. Cumulative #193:441 corrections+159 new. Depth unchanged813/1400 and897/1760 (88 placements, gap863). Next legacy909 onward, retain held items and continue underfilled category growth. Reconcile #179 without replay.


## Legacy review checkpoint 909–932 (2026-11-26)
Reviewed24 pending drafts, excluded held910,915,920,921,928. Recomputed19 answers (dot products, constrained and unconstrained optimization, Hessian eigenvalues, place value, number line, grouping, ordered sample spaces, independent trials, percentage-point comparison, unions, vector operations, unit vectors and angles). Reviewed original bilingual ideas and hints, expanded derivations, conditions, substitutions, verification and option-specific feedback. Saved specs scripts/reviewed_legacy_909_932_specs_20261126.json commitcc2e5a77b06d2372193a9ff9aa8c9b84aad38718 NOT importable. All four hold registries, source SHA256 and draft MD5/revision, active owner, exact live/open-draft duplicate and placement guards checked. Applied four small guarded partitions:909–914 (5) ddd4bd53ae8674434744509daf151658a35cead5;916–922 (5) 406c075578d55f9ab2726b6b9b768848dfad560c;923–927 (5) 010f7615638d4c6e70c557b80446f75bccb1fd42;929–932 (4) 9b416ef438be8dd40637d7307cd968400909a728. ALL APPLIED DO NOT replay. Each passed rollback rehearsal, independent precommit unchanged check, one commit and independent exact readback. Overall19/19,76 owner_sql events. Preserved original titles, stems, option IDs/text/flags, points, video, track/skill mappings including19+21, student and access records. Levels20/21 unpublished. No app or infrastructure changes. Runtime rendering and exhaustive semantic duplicate-family audit pending.

| Draft | Source | Correct option ID |
|---:|---:|---:|
|909|1667|6657|
|911|1669|6667|
|912|1670|6671|
|913|1671|6675|
|914|1672|6679|
|916|1674|6686|
|917|1675|6690|
|918|1676|6693|
|919|1677|6698|
|922|1680|6710|
|923|1681|6714|
|924|1682|6718|
|925|1683|6723|
|926|1685|6732|
|927|1686|6733|
|929|1690|6750|
|930|1691|6754|
|931|1692|6757|
|932|1693|6762|

Live1008, structured850, missing158. Stage counts [{"StageId":1,"total":315,"structured":280},{"StageId":2,"total":227,"structured":198},{"StageId":3,"total":239,"structured":186},{"StageId":4,"total":227,"structured":186}]. Draft status [{"EditorialStatus":"Draft","amendments":118,"additions":49},{"EditorialStatus":"Published","amendments":615,"additions":469},{"EditorialStatus":"Withdrawn","amendments":0,"additions":1}]. Cumulative #193:460 corrections+159 new. Depth unchanged813/1400 and897/1760 (88 placements, gap863). Next legacy933 onward, retain held items and continue underfilled category growth. Reconcile #179 without replay.
