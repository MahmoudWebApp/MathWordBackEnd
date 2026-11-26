import assert from 'node:assert/strict';
import test from 'node:test';
import {earlyWave} from './school-v15-early.mjs';

test('V15 early grades: independent counts and reconstructions', () => {
  const range = n => Array.from({length: n}, (_, i) => i + 1);
  const tilesAcrossCut = range(5).map(width => 2 * (width + 6) + 2 * (10 - width + 6) - 2 * (10 + 6));
  assert.equal(new Set(tilesAcrossCut).size, 1);
  const punches = range(18).filter(cm => Math.abs(cm - 9) === 3);
  const trays = range(26).map(card => ((card - 1) % 4) + 1);
  const realStart = range(59).find(t => t + 2 === 12);
  const realEnd = range(59).find(t => t - 3 === 35);
  const answers = {
    'correct-double-touch-count': new Set(['A', 'B', 'C', 'B', 'D', 'E', 'F', 'G']).size,
    'minimal-transfer-to-equal-piles': range(14).find(k => 14 - k === 6 + k),
    'count-printed-page-digits': range(13).join('').length,
    'unfold-paired-holes-distance': punches[1] - punches[0],
    'reconstruct-whole-from-three-fifths': range(60).find(n => n % 5 === 0 && 3 * (n / 5) === 12),
    'elapsed-time-opposite-clock-errors': realEnd - realStart,
    'extra-perimeter-after-straight-cut': tilesAcrossCut[0],
    'cyclic-distribution-last-tray': trays.at(-1),
  };
  const rows = earlyWave();
  assert.deepEqual(new Set(rows.map(r => r.Family)), new Set(Object.keys(answers)));
  for (const row of rows) {
    const correct = row.Content.Options.filter(o => o.IsCorrect);
    assert.equal(correct.length, 1);
    assert.equal(Number(correct[0].LatexCode), answers[row.Family], row.Family);
  }
});
