// Word and adjacent-token overlap retrieves comparison examples for an editor.
// Mathematical equivalence and curriculum fit still require editorial judgment.
function features(value) {
  const normalized = value.normalize('NFKC').toLowerCase()
    .replace(/[\u064b-\u065f\u0670\u0640]/gu, '')
    .replace(/[أإآ]/gu, 'ا').replace(/ى/gu, 'ي')
    .replace(/\p{Nd}+(?:[.٫]\p{Nd}+)?/gu, ' # ');
  const words = normalized.match(/[\p{L}]+|[#=+−*/<>≤≥^²³]/gu) ?? [];
  return new Set([...words, ...words.slice(1).map((word, i) => words[i] + ' ' + word)]);
}

function comparisonIndex(documents, language) {
  const postings = new Map();
  const vectors = documents.map((doc, id) => {
    const terms = features(doc.question[language]);
    for (const term of terms) {
      if (!postings.has(term)) postings.set(term, []);
      postings.get(term).push(id);
    }
    return terms;
  });
  const weights = new Map([...postings].map(([term, ids]) =>
    [term, (1 + Math.log((documents.length + 1) / (ids.length + 1))) ** 2]));
  const norms = vectors.map(terms => Math.sqrt([...terms].reduce((sum, t) => sum + weights.get(t), 0)));
  return function nearest(id, group) {
    const scores = new Map();
    for (const term of vectors[id]) {
      for (const other of postings.get(term)) {
        if (documents[other].group === group) continue;
        scores.set(other, (scores.get(other) ?? 0) + weights.get(term));
      }
    }
    const matches = [...scores].map(([other, score]) => ({
      other, score: score / (norms[id] * norms[other]),
    })).sort((a, b) => b.score - a.score || a.other - b.other);
    return matches.slice(0, 2).map(({other, score}) => ({
      source: documents[other].source,
      text: documents[other].question[language],
      score: Number(score.toFixed(4)),
    }));
  };
}

const familyKey = row => [row.ProposedTrackCodes[0], row.Content.CategoryId, row.Family].join('/');

export function reviewQueue(catalog, candidates, known) {
  if (!Array.isArray(known) || known.some(q => !q?.Ar?.trim() || !q?.En?.trim())) {
    throw Error('Expected bilingual known questions');
  }
  const documents = known.map(question => ({source: 'live-or-draft', question}));
  const ids = new Map();
  for (const row of catalog) {
    if (ids.has(row.ContentKey)) throw Error('Duplicate catalog key');
    ids.set(row.ContentKey, documents.length);
    documents.push({source: row.ContentKey, group: familyKey(row), question: row.Content.Question});
  }
  const nearest = Object.fromEntries(['Ar', 'En'].map(lang => [lang, comparisonIndex(documents, lang)]));
  const groups = new Map();
  for (const row of candidates) {
    const group = familyKey(row);
    if (!ids.has(row.ContentKey)) throw Error('Unknown candidate');
    if (!groups.has(group)) groups.set(group, []);
    groups.get(group).push(row);
  }
  const families = [...groups].map(([group, rows]) => {
    const first = rows[0];
    const id = ids.get(first.ContentKey);
    return {
      family: group, skill: first.PrimarySkillKey, key: first.ContentKey,
      question: first.Content.Question, relatedVariantKeys: rows.slice(1).map(r => r.ContentKey),
      comparisons: {Ar: nearest.Ar(id, group), En: nearest.En(id, group)},
    };
  });
  return {candidateCount: candidates.length, familyCount: families.length, families};
}
