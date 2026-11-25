import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import test from 'node:test';
import {selectCandidates, validate} from './pipeline.mjs';
import {schoolHolds, schoolWave} from './school-wave.mjs';

const inventory = JSON.parse(readFileSync(new URL('./inventory-20261125.json', import.meta.url), 'utf8'));

test('school wave uses linked skills and independently checked answers', () => {
  const rows = schoolWave();
  const answers = {
    'reverse-queue-rank': Array.from({length: 14}, (_, i) => 14 - i).indexOf(6) + 1,
    'compare-after-both-change': (9 + 4) - (34 - 28),
    'division-ceiling-capacity': [3, 5, 6, 8].find(n => 8 * n >= 43),
    'remaining-fraction-same-whole': `\\frac{${12 - 12 / 4 - 12 / 3}}{12}`,
    'area-model-omitted-cell': 26 * 34 - (600 + 80 + 180),
    'successive-percents-new-base': 80 * (125 * 80 / 10000),
    'annulus-area-coefficient': (9 - 4) * (9 + 4),
    'recover-total-from-relative-frequency': Array.from({length: 101}, (_, i) => i).find(n => n * 3 === 180),
    'intersect-two-linear-integer-bounds': Array.from({length: 41}, (_, i) => i - 20)
      .filter(x => 3 * x - 2 > 7 && 2 * x + 1 <= 13).length,
    'line-intersection-ordinate': 13 - ((13 - 1) / 3),
    'affine-population-variance': [1, 7, 13, 19].reduce((sum, value) => sum + (value - 10) ** 2, 0) / 4,
    'secant-from-tangent-sign': `-\\frac{${Math.hypot(3, 4)}}{3}`,
  };
  assert.equal(rows.length, 12);
  assert.equal(new Set(rows.map(row => row.Family)).size, 12);
  assert.equal(new Set(rows.map(row => row.ProposedTrackCodes[0])).size, 12);
  assert.deepEqual(validate(rows), []);
  assert.equal(selectCandidates(rows, inventory).selected.length, rows.length);
  for (const row of rows) assert.equal(row.Check.expected, String(answers[row.Family]), row.ContentKey);
  assert.deepEqual(schoolHolds, ['division-ceiling-capacity', 'affine-population-variance']);
});
