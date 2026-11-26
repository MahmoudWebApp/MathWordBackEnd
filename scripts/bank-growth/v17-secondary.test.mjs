import assert from 'node:assert/strict';
import test from 'node:test';
import {v17CWave} from './v17-secondary.mjs';

test('V17 secondary answers reconstructed from the authored inputs', () => {
  const times = [10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 22, 24];
  const seconds = Array.from({length: 11}, (_, i) => i);
  const heights = seconds.map(i => 20 * i - 2 * i ** 2);
  const tower = Array.from({length: 25}, (_, i) => i).find(h => Math.atan(h / 20) === Math.atan((h - 6) / 12));
  const readings = Array.from({length: 20}, (_, i) => i + 1);
  const flavours = ['m','m','m','m','l','l','l','b','b'];
  const pairCount = flavours.flatMap((f, i) => flavours.slice(i + 1).filter(g => f !== g)).length;
  const retained = [6, 8, 10, 10, 12, 14];
  const removed = [6, 14];
  const variance = data => data.reduce((sum, x) => sum + x ** 2, 0) / data.length
    - (data.reduce((sum, x) => sum + x, 0) / data.length) ** 2;
  assert.equal(variance([...retained, ...removed]), 9);
  let term = 3;
  for (let i = 1; i < 2026; i++) term = 11 - term;
  const totals = new Map([[0,0],[2,4],[6,11],[5,14]]);
  const answers = {
    'deduce-bounded-cumulative-count': times.filter(t => t >= 18).length,
    'quadratic-equal-height-symmetric-time': heights.lastIndexOf(heights[2]),
    'compare-towers-fixed-angle-different-baselines': tower,
    'staggered-index-equal-arithmetic-rows': readings.find(n => n > 1 && 5 + 3 * (n-1) === 1 + 4 * (n-2)),
    'selection-pairs-different-flavours': pairCount,
    'variance-deletion-equal-opposite-deviations': variance(retained),
    'alternating-affine-two-cycle': term,
    'recover-net-change-from-reversed-measurements': totals.get(5) - totals.get(2),
  };
  for (const row of v17CWave()) {
    const code = row.Content.Options.find(o => o.IsCorrect).LatexCode;
    const frac = /^\\frac\{(-?\d+)\}\{(\d+)\}$/u.exec(code);
    const asNumber = frac ? Number(frac[1]) / Number(frac[2]) : Number(code);
    assert.ok(Math.abs(asNumber - answers[row.Family]) < 1e-10, row.Family);
  }
});
