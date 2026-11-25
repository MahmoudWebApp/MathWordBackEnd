import assert from 'node:assert/strict';
import test from 'node:test';
import {bWave} from './v16-middle.mjs';

test('V16 grades 5–8 answers checked independently', () => {
  const range = n => Array.from({length: n}, (_, i) => i);
  const grid = range(400).map(i => i / 100);
  const lower = grid.filter(n => n < 2.078).at(-1);
  const upper = grid.find(n => n > 2.078);
  const candidates = range(30).filter(n => range(n).some(g => g > 0 && g * 30 === 12 * n));
  const results = range(100).map(i => i < 80 || i >= 90);
  const pi = Math.PI;
  const left = 1 - 2 * (pi * 2 ** 2) / (pi * 6 ** 2);
  assert.ok(Math.abs(left - 7 / 9) < 1e-12);
  const expected = {
    'adjacent-hundredths-on-opposite-sides': (lower + upper).toFixed(2),
    'simplest-equal-probability-bag-copy': String(candidates[0]),
    'percentage-of-original-after-rejects-recovered': String(results.filter(Boolean).length),
    'same-discount-per-ticket-from-total': String(15 - 44 / 4),
    'recover-rate-from-equal-time-mixed-work': String(range(20).find(r => 6 * 5 + 6 * r === 84)),
    'area-fraction-after-two-disk-cuts': '\\frac{7}{9}',
    'missing-factor-in-difference-of-same-base-powers': String((6561 - 729) / 729),
    'compare-diagonals-without-square-roots': String(range(20).filter(w => Math.hypot(9, w) < Math.hypot(8, 6)).at(-1)),
  };
  assert.equal(bWave().length, Object.keys(expected).length);
  for (const row of bWave()) {
    assert.equal(row.Content.Options.find(o => o.IsCorrect).LatexCode, expected[row.Family], row.Family);
  }
});
