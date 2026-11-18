# MathWorld — 30-day in-app inbox pagination (development V1)

## Goal

The existing unread bell is a 30-item preview, **not** the complete inbox.
Web and mobile now offer a full-page history for the last 30 days without
returning another learner's notifications.

## API contract

`GET /api/notifications?take=30&skip=0`

- Requires an authenticated **active** user. Owner is resolved from JWT and database; no user-ID query parameter is accepted.
- `take`: integer 1–50 (default 30); `skip`: integer 0–10000 (default 0).
- Only records created within the rolling 30-day window are included.
- Records are ordered by `CreatedAtUtc DESC, Id DESC`.
- Response body is wrapped in the existing API success envelope. Its `Data` fields are:
  - `Items`: notice objects with ID, type, both-language title/body, target path, created time and optional read time
  - `UnreadCount`: unread items **in the whole 30-day inbox**, not only this page
  - `TotalCount`: total notices **in the 30-day inbox**, including read notices
  - `HasMore`: whether more records remain after the current slice
  - `Skip`, `Take`: resolved pagination inputs
- Out-of-range pagination parameters return HTTP 400 with an error key; missing, disabled or invalid accounts are rejected.
- Mark-one and mark-all routes remain unchanged. Mark-all affects only the current user's last-30-day notices.

## Clients

- Next.js notification bell continues to poll a 30-item preview and now links to a full `/notifications` page.
- Web full page uses 30-item pages and refreshes on mark-read; a logged-in-session navigation guard is added.
- Flutter app screen uses a separate page provider; the compact unread-count provider is invalidated after mark-read and mark-all.
- Mobile deserialization defaults missing `TotalCount/HasMore/Skip` for older server responses. Pagination is enabled only when the server explicitly reports `HasMore`.
- No SMS, email, device push or SignalR broadcast was introduced. Polling is **not** realtime delivery.

## Integration and release gates

- Disposable PostgreSQL checks: page order, three-item multi-page traversal, invalid page boundaries, per-user ownership, and read synchronization.
- Flutter regression tests: full page payload, read state, empty last page, and backwards-compatible legacy envelope.
- Verify Arabic/English list, dark mode, unread dot, pagination at 31+ messages and focus/keyboard behavior on staging.
- This offset-based V1 can shift pages when new notices arrive mid-browse; refresh from page one to reconcile. A keyset cursor could be introduced for high-volume usage.
- No production notification rows were accessed or modified for these changes.
