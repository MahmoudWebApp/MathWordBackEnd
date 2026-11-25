import assert from 'node:assert/strict';
import test from 'node:test';
import {v17AWave} from './v17-early.mjs';

test('V17 early-school answers from independent models', () => {
  const integers = n => Array.from({length: n}, (_, i) => i);
  const rectangleAreas = [4, 7].map(width => integers(12).map(length => width * length));
  const positions = integers(21);
  const maxDeparture = integers(600).filter(t => t + 25 + 10 <= 600).at(-1);
  const expected = {
    'keep-at-least-stock': integers(16).filter(taken => 15 - taken >= 9).at(-1),
    'count-missing-position-labels': 10 - integers(11).filter(n => 3 < n && n < 8).length,
    'length-invariant-under-slide': positions.find(end => end - 9 === 11 - 4),
    'reverse-area-after-width-change': rectangleAreas[1].findIndex((area, length) => area - rectangleAreas[0][length] === 18),
    'latest-departure-with-buffer': `${Math.floor(maxDeparture / 60)}{:}${maxDeparture % 60}`,
    'minimum-reassignment-to-switch-mode': integers(9).find(k => 5 + k > Math.max(4, 8 - k)),
    'mixed-unit-mass-across-scales': integers(300).find(bag => 1970 + bag === 2 / 0.001 + 150),
    'amount-added-to-match-fraction': integers(6).find(k => k * 2 + 6 === 10) / 6,
  };
  const rows = v17AWave();
  assert.deepEqual(new Set(rows.map(row => row.Family)), new Set(Object.keys(expected)));
  for (const row of rows) {
    const value = row.Content.Options.find(option => option.IsCorrect).LatexCode;
    const fraction = /^\\frac\{(\d+)\}\{(\d+)\}$/.exec(value);
    const actual = fraction ? Number(fraction[1]) / Number(fraction[2])
      : value.includes('{:}') ? value : Number(value);
    assert.equal(actual, expected[row.Family], row.Family);
  }
});
