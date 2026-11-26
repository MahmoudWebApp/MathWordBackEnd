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
