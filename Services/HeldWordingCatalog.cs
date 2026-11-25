using System.Text.Json;

namespace MathWorldAPI.Services;

// Fixed reviewed wording only: excludes all classification and option-localization
// proposals. A question with learner history must use a future versioned route.
internal static class HeldWordingCatalog
{
    internal sealed record Candidate(int ProblemId,int[] ExpectedOptionIds,BilingualText ExpectedLegacySolution,
        string PrimarySkillKey,string ProposedTrackCode,WizardProblem Content,BilingualText ProposedQuestion);
    private static readonly Lazy<IReadOnlyDictionary<int,Candidate>> Data=new(Load);
    internal static IReadOnlyDictionary<int,Candidate> Current=>Data.Value;
    private static IReadOnlyDictionary<int,Candidate> Load()
    {
        var result=new Dictionary<int,Candidate>();
        foreach(var name in new[]{"g1-model-assumption-holds-20261125.json","g1-original-holds-structured-review-20261125.json"})
        {
            using var stream=typeof(HeldWordingCatalog).Assembly.GetManifestResourceStream("MathWorld.ReviewedBank."+name)
                ??throw new InvalidOperationException("Missing held wording inventory");
            using var doc=JsonDocument.Parse(stream);
            if(doc.RootElement.GetProperty("Status").GetString()!="HeldNotImportable")throw new InvalidOperationException("Invalid held inventory");
            foreach(var row in doc.RootElement.GetProperty("Items").EnumerateArray())
            {
                if(!row.TryGetProperty("ProposedQuestion",out _)||row.TryGetProperty("ClassificationProposal",out _)||
                    row.TryGetProperty("OptionLocalization",out _))continue;
                if(row.GetProperty("Status").GetString()!="HeldStructuredCandidateNotImportable")throw new InvalidOperationException("Invalid held row");
                var candidate=row.Deserialize<Candidate>()??throw new InvalidOperationException("Invalid held candidate");
                if(!WizardProblemContract.Pair(candidate.ProposedQuestion,5000)||candidate.ProposedQuestion==candidate.Content.Question||
                    candidate.ExpectedOptionIds.Length!=4||candidate.ExpectedOptionIds.Distinct().Count()!=4)
                    throw new InvalidOperationException("Invalid wording candidate");
                result.Add(candidate.ProblemId,candidate);
            }
        }
        if(result.Count!=37)throw new InvalidOperationException("Unexpected wording inventory");
        return result;
    }
}
