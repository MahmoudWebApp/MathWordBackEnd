using System.Text.Json;

namespace MathWorldAPI.Services;

/// <summary>Private, fixed candidate catalog. No database writes or automatic approval.</summary>
internal sealed class ReviewedBankCatalog
{
    internal sealed record Batch(string Kind,int Number,JsonElement[] Items);
    internal sealed record Package(int HeldCount,Batch[] Batches);
    private static readonly Lazy<Package> Catalog=new(Load);
    internal static Package Current=>Catalog.Value;

    private static JsonElement Read(string name)
    {
        using var stream=typeof(ReviewedBankCatalog).Assembly.GetManifestResourceStream("MathWorld.ReviewedBank."+name)
            ??throw new InvalidOperationException("Reviewed bank resource missing");
        using var doc=JsonDocument.Parse(stream);
        return doc.RootElement.Clone();
    }
    private static int Id(JsonElement row,string property)=>row.GetProperty(property).GetInt32();
    private static string Str(JsonElement row,string property)=>row.GetProperty(property).GetString()??"";
    private static JsonElement[] Rows(JsonElement root,string name)=>root.GetProperty(name).EnumerateArray().ToArray();
    private static bool Held(JsonElement row)=>row.TryGetProperty("taxonomyReviewPending",out var value)&&value.ValueKind==JsonValueKind.True;
    private static void Require(bool value)
    {
        if(!value)throw new InvalidOperationException("Reviewed bank package validation failed");
    }
    private static Package Load()
    {
        var canonical=Rows(Read("g1-existing-hint-candidates-20261124.json"),"items");
        var heldFile=Read("g1-hint-held-review-20261124.json");
        var separate=Rows(heldFile,"items");
        Require(canonical.Length==734&&separate.Length==39&&Str(heldFile,"status")=="HeldNotImportable"&&separate.All(Held));
        var all=canonical.Concat(separate).ToArray();
        Require(all.Length==773&&all.Select(r=>Id(r,"problemId")).Distinct().Count()==773);
        var held=all.Where(Held).Select(r=>Id(r,"problemId")).ToHashSet();
        Require(held.Count==41);
        var source=all.ToDictionary(r=>Id(r,"problemId"));
        var clearances=Read("g1-taxonomy-clearances-20261125.json");
        Require(Str(clearances,"Status")=="ReviewedTaxonomyOnlyNoSourceMutation");
        var cleared=Rows(clearances,"Items");
        Require(cleared.Length==6&&cleared.Select(r=>Id(r,"ProblemId")).ToHashSet().SetEquals(new[]{212,224,236,248,260,1633}));
        foreach(var row in cleared)
        {
            var id=Id(row,"ProblemId");var original=source[id];
            Require(held.Contains(id)&&!original.TryGetProperty("ProposedQuestion",out _)&&
                Str(row,"StableKey")==Str(original,"primarySkillKey")&&
                Str(row,"ExpectedQuestionAr")==Str(original.GetProperty("question"),"Ar")&&
                Str(row,"ExpectedQuestionEn")==Str(original.GetProperty("question"),"En"));
            held.Remove(id);
        }
        Require(held.Count==35);
        var full=new List<JsonElement>();
        for(int wave=1;wave<=15;wave++)
        {
            var file=Read($"g1-structured-amendments-wave{wave:00}-20261124.json");
            Require(Str(file,"Status")=="NotImportedNotPublished");
            full.AddRange(Rows(file,"Items"));
        }
        Require(full.Count==677&&full.Select(r=>Id(r,"ProblemId")).Distinct().Count()==677);
        var amendments=full.Where(r=>!held.Contains(Id(r,"ProblemId"))).OrderBy(r=>Id(r,"ProblemId")).ToArray();
        Require(amendments.Length==677);
        foreach(var row in amendments)
        {
            var hint=source[Id(row,"ProblemId")];
            var question=row.GetProperty("Content").GetProperty("Question");
            Require(Str(row,"Status")=="StructuredAmendmentCandidateNotImported"&&
                Str(row,"PrimarySkillKey")==Str(hint,"primarySkillKey")&&
                Str(question,"Ar")==Str(hint.GetProperty("question"),"Ar")&&
                Str(question,"En")==Str(hint.GetProperty("question"),"En"));
        }
        var reserved=amendments.Select(r=>Id(r,"ProblemId")).ToHashSet();
        var hints=all.Where(r=>!held.Contains(Id(r,"problemId"))&&!reserved.Contains(Id(r,"problemId")))
            .OrderBy(r=>Id(r,"problemId")).Select(r=>JsonSerializer.SerializeToElement(new{
                ProblemId=Id(r,"problemId"),PrimarySkillKey=Str(r,"primarySkillKey"),
                Question=r.GetProperty("question"),Hints=r.GetProperty("Hints"),TaxonomyReviewPending=false})).ToArray();
        Require(hints.Length==61);
        var existing=new List<JsonElement>();var missing=new List<JsonElement>();
        var keys=new HashSet<string>();
        foreach(var name in new[]{"g1-gap-wave-01-20261124.json","g1-gap-wave-02-20261124.json",
            "g1-gap-wave-03-20261124.json","g1-primary-early-and-final-grade-gap-20261124.json",
            "g1-grade-depth-wave04-20261125.json","g1-university-depth-wave05-20261125.json"})
        {
            var file=Read(name);
            Require(Str(file,"Status") is "DraftCandidatesNotPublished" or "ReviewedCandidateNotImported");
            foreach(var row in Rows(file,"Items"))
            {
                Require(Str(row,"ReviewStatus")=="Draft"&&keys.Add(Str(row,"ContentKey")));
                var codes=Rows(row,"ProposedTrackCodes");
                var payload=JsonSerializer.SerializeToElement(new{
                    ContentKey=Str(row,"ContentKey"),PrimarySkillKey=Str(row,"PrimarySkillKey"),
                    ProposedTrackCodes=codes,Content=row.GetProperty("Content")});
                (codes.Any(c=>c.GetString() is "numerical-analysis" or "mathematical-optimization")?missing:existing).Add(payload);
            }
        }
        Require(existing.Count==51&&missing.Count==8&&keys.Count==59);
        var batches=new List<Batch>();
        void Add(string kind,IEnumerable<JsonElement> rows)
        {
            int number=0;
            foreach(var chunk in rows.Chunk(50))batches.Add(new(kind,++number,chunk));
        }
        Add("amendments",amendments);Add("hints",hints);Add("new-existing",existing);Add("new-missing",missing);
        return new(held.Count,batches.ToArray());
    }
}
