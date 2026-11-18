# MathWorld: zero-additional-cost notifications, SVG taxonomy and geometry roadmap

## Locked launch decisions
- **SMS disabled**. No SMS provider account, code path or recurring charges in v1.
- Notifications: in-app inbox (PostgreSQL), mobile push via FCM (subject to current free limits), transactional email via provider free allowance or existing verified SMTP. Do not promise unlimited free delivery.
- Email: use queue, per-template throttling, daily cap, suppression, SPF/DKIM/DMARC, retry and logs. Do not run self-hosted bulk SMTP on VPS as default. Verify Hostinger account's actual mail entitlement separately from KVM VPS.
- Payments: checkout OFF; payment provider selection after legal incorporation in UAE or Netherlands. No card details stored.
- Hosting budget: VPS, domain, Google Play registration only (plus taxes if applicable); any optional external service requires approval.

## Current data constraints (verified in repository)
- Category.Icon is a string with emoji default; existing seeded categories contain emoji.
- MathProblem has bilingual question and solution text, options, category/stage IDs; no geometry-specific diagram representation.
- Existing category seed IDs are used by historical problems; NEVER renumber/delete existing category IDs.

## Icon migration — staged, reversible
1. Define stable icon keys: algebra=variable, geometry=shapes, statistics=chart-no-axes-column, trigonometry=triangle, calculus=chart-no-axes-combined, vectors=move-up-right, equations=sigma, probability=dices, measurement=ruler, linear-algebra=grid-3x3, functions=chart-no-axes-line, number-theory=hash, differential-equations=waves, real-analysis=infinity, multivariable=orbit.
2. Keep API Icon as a string initially. Clients accept known keys and legacy emoji; render keys via approved SVG registry (Lucide outlined icons) and fallback to 'shapes' for unknown keys. Flutter uses bundled monochrome SVG assets with identical semantic keys and asset license preserved. Avoid loading SVG from untrusted remote URLs.
3. Once both clients support keys, update existing category Icon values via explicit, idempotent migration; preserve category IDs and history. New categories use keys only.
4. Ensure RTL consistency, icon alignment, stroke width, accessible labels, dark/light contrast and app icon separate from category icons.
5. Do not auto-generate categories or questions without approved bilingual curricula.

## Geometry, vectors, rays and diagram questions — future-proof design
- Start with static **SVG geometry diagrams** generated from a structured, validated scene specification (not arbitrary raw SVG/HTML from students). Types: point, line, segment, ray, angle, circle, polygon, arrow/vector, coordinate axes, grid, labels and measurements.
- GeometryQuestionSpec versioned JSON: { schemaVersion, viewport, objects[], givens[], constraints[], answerSpec }. Objects use stable IDs and finite numeric coordinates; validate max count, lengths, coordinate bounds, label lengths and supported types on server.
- Render via shared deterministic geometry specification: web SVG renderer and Flutter CustomPainter (or vetted vector renderer); matching coordinate systems, labels and hit targets. Export safe static SVG/PNG/PDF.
- For geometry authoring, admin editor previews the diagram and checks correctness; mathematical solution remains separate bilingual explanation. Support multiple-choice first; later numeric/vector answer with tolerance and exactness rules.
- Future dynamic geometry: drag points, rotate vectors, transform shapes, inspect rays/angles; backend validates submitted numeric answers and never trusts client-supplied correctness.
- Accessibility: textual diagram descriptions, high contrast, keyboard interaction where feasible.
- Security: reject SVG scripts, foreignObject, external hrefs, event handlers and arbitrary CSS. Prefer rendering generated shapes instead of accepting user-uploaded SVG.
- Database: prefer new optional ProblemDiagram (ProblemId unique FK, SchemaVersion, DiagramJson, AltTextAr, AltTextEn) with EF migration when renderer is ready; existing problems remain unchanged.

## Educational taxonomy and question bank
- Stage 1: arithmetic, fractions/decimals, ratios, introductory algebra, basic geometry, measurement, data/probability.
- Stage 2: number theory, equations/inequalities, functions, plane geometry, trigonometry introduction, statistics, coordinate geometry.
- Stage 3: advanced algebra, trigonometry, analytic geometry, calculus, vectors, statistics/probability.
- Stage 4: linear algebra, multivariable calculus, differential equations, real analysis, vector geometry, numerical methods.
- These are proposals, not a claim to match any specific country's official curriculum. Obtain curriculum mapping before publishing.
- Question bank: bilingual statements, solution and options, difficulty, answer proof, diagram alt text, reviewer, provenance/license, duplicates checks, staging preview and publish approval.
- Never publish unreviewed generated math questions. Unit/integration tests verify correct option count and diagram JSON schema.

## Acceptance gates
- Backend/Next.js/Flutter builds green, migration safe, existing IDs unchanged.
- SVG keys render correctly on web and mobile, including offline and RTL.
- No SMS requests; email and push cost caps enforced.
- Geometry static diagrams match across clients, invalid diagram JSON rejected, no script execution.
- Document feature-by-feature completion with commits and test evidence.
