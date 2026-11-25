const pair = ([Ar, En]) => ({Ar, En});
const math = value => [value, value];

export function authoredCandidate(version, position, row) {
  const {
    scope: [track, StageId, CategoryId, PrimarySkillId, PrimarySkillKey],
    family, difficulty, title, question, hints, formula, steps, substitution,
    answer, verify, wrong, unit = ["دون وحدة", "unitless"],
  } = row;
  const Options = wrong.map(([LatexCode, Ar, En]) => ({
    LatexCode, IsCorrect: false, ErrorType: "misconception", Reason: {Ar, En},
  }));
  Options.splice(position % 4, 0, {LatexCode: answer, IsCorrect: true, ErrorType: "", Reason: {Ar: "", En: ""}});

  return {
    ContentKey: `growth-${version}-${track}-${family}-1`,
    Family: family,
    ReviewStatus: "Draft",
    PrimarySkillKey,
    ProposedTrackCodes: [track],
    Check: {expected: answer},
    Content: {
      StageId, CategoryId, PrimarySkillId, SecondarySkillIds: [], TrackIds: [],
      DifficultyLevel: difficulty, Points: 10,
      Title: pair(title), Question: pair(question), Options, Hints: hints.map(pair),
      Solution: {
        Idea: pair(hints[0]), FormulaLatex: formula, Steps: steps.map(pair),
        Substitution: pair(math(substitution)), Result: pair(math(answer)), Unit: pair(unit),
        Verification: pair(verify), CommonError: pair(wrong[0].slice(1)),
      },
    },
  };
}
