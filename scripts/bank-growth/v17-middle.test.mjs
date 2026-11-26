import assert from 'node:assert/strict';
import test from 'node:test';
import {v17BWave} from './v17-middle.mjs';

test('V17 middle grades agree with independent counts and reconstruction', () => {
  const sizes = Array.from({length: 100}, (_, i) => i + 1);
  const bill = (start, end) => 10 + 3 * (end - start);
  const median = readings => readings.toSorted((a, b) => a - b)[2];
  const fills = [500 - 200, 500, 500, 500, 500];
  let water = 1800;
  const completed = fills.filter(fill => (water -= fill) >= 0).length;
  const expected = {
    'median-when-middle-reading-is-corrected': median([4, 8, 15, 12, 16]) - median([4, 8, 9, 12, 16]),
    'repeated-fill-from-smaller-dispenser': completed,
    'fixed-subgroup-divisibility-minimum': sizes.find(n => (35 * n) % 100 === 0 && (40 * n) % 100 === 0),
    'centroidless-shared-area-altitude': sizes.map(i => i / 2).find(h => (8 * h) / 2 === (12 * 5) / 2),
    'phase-offset-synchronization': sizes.find(t => t >= 4 && (t - 4) % 6 === 0 && (t - 2) % 4 === 0),
    'three-line-vertical-angle-sum': sizes.map(i => i * 2).find(y => (y + y / 2 + 45) * 2 === 360),
    'projection-overhang-from-shadow': sizes.find(d => 2 * (7 + d) === 3 * 6),
    'compare-input-revisions-linear-with-fee': bill(104, 129) - bill(100, 120),
  };
  const rows = v17BWave();
  assert.equal(rows.length, Object.keys(expected).length);
  for (const row of rows) {
    const answers = row.Content.Options.filter(option => option.IsCorrect);
    assert.equal(answers.length, 1);
    assert.equal(Number(answers[0].LatexCode), expected[row.Family], row.Family);
  }
});
