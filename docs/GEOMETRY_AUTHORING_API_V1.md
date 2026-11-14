# Geometry authoring API — v1

The geometry feature uses declarative JSON, not SVG markup. It is backward compatible: an existing problem without a diagram remains unchanged.

## Admin: create or replace a diagram

`PUT /api/admin/problems/{problemId}/diagram`

Requires an authenticated, active **Admin**. Request:

```json
{
  "scene": {
    "schemaVersion": 1,
    "viewport": { "width": 360, "height": 260 },
    "altTextAr": "مثلث قائم الزاوية، ضلعاه القائمان 3 و4 وحدات",
    "altTextEn": "Right triangle with legs of 3 and 4 units",
    "objects": [
      {
        "id": "triangle",
        "type": "polygon",
        "points": [
          { "x": 65, "y": 205 },
          { "x": 305, "y": 205 },
          { "x": 65, "y": 45 }
        ]
      },
      { "id": "point-a", "type": "point", "x": 65, "y": 205, "label": "A" },
      { "id": "point-b", "type": "point", "x": 305, "y": 205, "label": "B" },
      { "id": "point-c", "type": "point", "x": 65, "y": 45, "label": "C" }
    ]
  }
}
```

Coordinates are illustration units; the mathematical values 3, 4 and 5 belong in the bilingual problem statement and worked solution. The diagram alone does not assert those lengths.

## Student/public read

`GET /api/problems/{problemId}/diagram` returns the same scene in the standard API response envelope. Missing or invalid scenes return 404. Web and Flutter treat diagrams as optional.

## Admin: remove diagram

`DELETE /api/admin/problems/{problemId}/diagram` removes only the diagram record. It never deletes the underlying problem, answer options, attempts or progress.

## Constraints and rollout

- Supported primitives: point, segment, ray, vector, line, circle, polygon, angle, axes.
- Version 1; at most 100 objects, 30 polygon vertices, bounded finite coordinates (absolute value <= 10,000), short unique IDs and labels.
- Both `altTextAr` and `altTextEn` are required, nonblank and at most 500 UTF-16 code units to support accessible bilingual rendering.
- An angle uses a signed sweep (`endDegrees - startDegrees`) whose magnitude must be greater than 0 and less than 360 degrees; empty/full-turn arcs are rejected consistently by the API, Next.js, and Flutter.
- No raw HTML/SVG/JavaScript or remote assets.
- Requires the additive `AddProblemDiagrams` migration before using the API.
- Do **not** seed or change production problems without a reviewed curriculum mapping.
- Interactive geometry is separately feature-flagged and remains OFF.
