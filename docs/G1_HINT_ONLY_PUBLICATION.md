# G1 hint-only publication route (not deployed)

The canonical inventory contains 732 eligible rows and 41 held rows across the two files. Use the 72 full structured amendments through the existing draft-only workflow first or reserve them; the remaining eligible rows may use the Admin-only hint-only route. Do not upload held records or change a held marker. The route accepts up to 50 exact source-bound records and requires a preview followed by an identical payload, the preview token, and a nonempty review note. A changed source, changed skill, open amendment, invalid options, or conflicting metadata blocks the whole batch. No schema migration. The legacy solution, correct answer, points, options, category, and learner history are not written. The metadata stores only the bilingual hints, without invented difficulty or structured solution. Existing full editorial amendment workflow remains available for later improvement. Deployment and authenticated Admin approval are required before any live application.

Endpoint: POST /api/editorial/problems/hints/import

Payload: Items (ProblemId, PrimarySkillKey, Question, Hints, TaxonomyReviewPending), Confirm=false. Re-submit the same Items with Confirm=true, PreviewToken from preview, and ReviewNote after review. For already applied rows, obtain a new preview; existing metadata is never overwritten by this route. The preview token binds the actor, current source fingerprint, primary skill and exact hints. The audit event records only actor and problem ID, not review note or content. The client must retain the review note in its editorial record.

No production database write was performed in preparing this change.
