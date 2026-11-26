import assert from 'node:assert/strict';
import test from 'node:test';
import {cWave} from './v16-secondary.mjs';

test('V16 upper grades solve the authored prompts independently', () => {
  const integers = Array.from({length: 101}, (_, i) => i - 50);
  const roots = integers.filter(x => x * x - 7 * x + 10 === 0);
  const options = {
    'shared-integer-calibration-window': integers.filter(n => 2*n+1 >= 11 && 20-3*n >= 2).length,
    'box-corner-two-pythagorean-steps': Math.hypot(3, 4, 12),
    'shift-roots-change-product': roots.reduce((p, r) => p * (r + 3), 1),
    'two-currents-same-destination': integers.find(e => -2 + e === 8),
    'log-domain-with-forbidden-endpoints': integers.filter(x => Number.isFinite(Math.log(-x*x + 7*x - 10))).length,
    'equal-slopes-at-two-points': integers.find(a => {
      const f = x => x*x*x + a*x*x;
      const slope = x => (f(x+0.001)-f(x-0.001))/0.002;
      return Math.abs(slope(1)-slope(3)) < 0.0001;
    }),
    'signed-work-against-horizontal-motion': Array(5).fill(-3).reduce((s, x) => s + x, 4),
    'external-point-tangent-segment': integers.find(t => t > 0 && Math.hypot(7,t) === 25),
  };
  const rows = cWave();
  assert.deepEqual(new Set(rows.map(r => r.Family)), new Set(Object.keys(options)));
  for (const row of rows) {
    assert.equal(Number(row.Content.Options.find(option => option.IsCorrect).LatexCode), options[row.Family], row.Family);
  }
});
