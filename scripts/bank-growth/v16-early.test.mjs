import assert from 'node:assert/strict';
import test from 'node:test';
import {aWave} from './v16-early.mjs';

test('V16 grades 1–4 answers by independent sums and enumeration', () => {
  const indices = n => Array.from({length: n}, (_, i) => i);
  const border = indices(6).flatMap(r => indices(8).filter(c =>
    r === 0 || r === 5 || c === 0 || c === 7));
  const round = (x, p) => Math.floor((x + p / 2) / p) * p;
  const answers = {
    'three-step-square-stair': indices(3).flatMap(r => indices(r + 1)).length,
    'two-stocks-with-same-total-movements': 19 - (7 + 3) + 5,
    'uncovered-border-count': border.length,
    'fraction-of-a-group-of-half-panels': 8 / 2 * (1 / 4),
    'recover-number-from-two-roundings': indices(500).find(
      x => round(x, 10) === 250 && round(x, 100) === 300),
    'detect-missing-ones-carry': 268 + 157 - (400 + 10 + 5),
    'equal-fraction-shares-different-wholes': indices(20)
      .filter((_, i) => i % 4 === 0).length - indices(12).filter((_, i) => i % 3 === 0).length,
    'stacks-with-aisle-in-each-layer': indices(4)
      .flatMap(() => indices(6).filter(i => i !== 2 && i !== 3)).length,
  };
  const rows = aWave();
  assert.equal(rows.length, Object.keys(answers).length);
  for (const row of rows) {
    assert.deepEqual(row.Content.Options.filter(o => o.IsCorrect).map(o => Number(o.LatexCode)), [answers[row.Family]], row.Family);
  }
});
