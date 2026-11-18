# MathWorld: Vercel web → Render API (CORS checklist)

Status: documented on the **backend development branch only**. Do not
deploy this branch, modify live Render environment variables, or apply
database migrations without owner approval.

## Known deployment facts (November 2026)

- Vercel frontend origin: `https://math-world-frontend.vercel.app`
- Historical Netlify frontend: `https://mathwords.netlify.app`
- Default frontend API base URL on web: `https://mathwordbackend.onrender.com/api`
- Backend ASP.NET Core CORS policy: `Frontend`, configured by
  `Cors:Origins` with `.WithOrigins(...).AllowAnyHeader().AllowAnyMethod().AllowCredentials()`.
- When **any** `Cors:Origins` environment array values exist, those values
  **replace** the hardcoded development/fallback list. Adding the Vercel
  domain in source code does **not** override an existing Render environment
  allowlist and does **not** change the already deployed API.

## Operator action in Render after explicit approval

Open the actual ASP.NET Core service → **Environment**. Inspect existing
`Cors__Origins__<index>` values and preserve every required origin.
If none exist, configure both:

```text
Cors__Origins__0=https://mathwords.netlify.app
Cors__Origins__1=https://math-world-frontend.vercel.app
```

Add local development origins to the environment array if local browser testing
uses them. **Do not use** wildcard `*`: it is incompatible with credentialed
CORS and would permit arbitrary origins. Values are exact origins **without**
a trailing slash, path, or wildcards; do not add the API URL itself.

Render environment changes may restart/redeploy the backend. Plan this as an
explicitly authorized operational change; it does not consume Netlify build
minutes. Vercel's `Ignored Build Step` can remain set to `exit 0`.

## Verify without guesswork

1. Check `https://mathwordbackend.onrender.com/health/live`. A healthy
   result only proves the API process is running.
2. Check `https://mathwordbackend.onrender.com/health/ready`. HTTP 503
   suggests an unavailable database or pending migrations; changing CORS does
   not fix database readiness.
3. Check `https://mathwordbackend.onrender.com/api/stages` directly in
   a browser. A JSON response establishes API route availability only:
   direct navigation does **not** test CORS.
4. In the **Vercel page's browser developer tools**, inspect the actual
   `/api/stages` and `/api/stats` calls. If the browser says
   `Access-Control-Allow-Origin` is missing for the Vercel origin, update
   Render's allowlist. If responses are `5xx`, investigate Render logs and
   database readiness. If requests go to another host, fix Vercel's
   `NEXT_PUBLIC_API_BASE_URL` and schedule one authorized deployment.
5. Test public stages and counters, then authenticated login and data reads.
   The backend must retain both Netlify and Vercel domains until the owner
   confirms the migration.

## Other visible QA issues

- The current navbar language control labelled `عربي` on an English
  page indicates the **switch destination**; clicking it should navigate
  to Arabic. Verify `/ar` explicitly before calling the text a translation
  regression.
- Home impact cards show an em dash if the stats API returns no data; this
  is not a valid claim of zero users or problems. Do not substitute invented
  counts.
- Visual QA should still verify the header/sticky scroll and card spacing
  on narrow phones and dark mode.

All feature-branch source changes remain **unmerged**; no live deployment or
Render environment change is performed by this document.
