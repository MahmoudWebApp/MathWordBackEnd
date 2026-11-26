using System.Text.Json;
using System.Text.RegularExpressions;
namespace MathWorldAPI.Services;

public sealed record BilingualText(string Ar="",string En="");
public sealed record WizardOption(string LatexCode="",bool IsCorrect=false,string ErrorType="",BilingualText? Reason=null);
public sealed record WizardSolution(BilingualText? Idea=null,string FormulaLatex="",BilingualText[]? Steps=null,
    BilingualText? Substitution=null,BilingualText? Result=null,BilingualText? Unit=null,
    BilingualText? Verification=null,BilingualText? CommonError=null);
public sealed record WizardProblem(int StageId=0,int CategoryId=0,int PrimarySkillId=0,int[]? SecondarySkillIds=null,
    int[]? TrackIds=null,int DifficultyLevel=1,int Points=10,BilingualText? Title=null,BilingualText? Question=null,
    WizardOption[]? Options=null,BilingualText[]? Hints=null,WizardSolution? Solution=null);

public static class WizardProblemContract
{
    public static bool Text(string? s,int max)=>!string.IsNullOrWhiteSpace(s)&&s.Trim().Length<=max;
    public static bool Pair(BilingualText? p,int max)=>p is not null&&Text(p.Ar,max)&&Text(p.En,max);
    // Optional fields must either be empty in both languages or complete and bounded.
    private static bool OptionalText(string? s,int max)=>string.IsNullOrWhiteSpace(s)||Text(s,max);
    private static bool OptionalPair(BilingualText? p,int max)=>p is null||
        (string.IsNullOrWhiteSpace(p.Ar)&&string.IsNullOrWhiteSpace(p.En))||Pair(p,max);
    public static string Serialize(WizardProblem p)=>JsonSerializer.Serialize(p);
    public static WizardProblem Read(string json)=>JsonSerializer.Deserialize<WizardProblem>(json)!;
    public static string Normalize(string? s)=>Regex.Replace((s??"").Trim(),@"\s+"," ").ToUpperInvariant();

    public static List<string> Validate(WizardProblem p)
    {
        var errors=new List<string>();
        if(p.StageId<=0||p.CategoryId<=0||p.PrimarySkillId<=0||p.TrackIds is null||p.TrackIds.Length is <1 or >50 ||
            p.TrackIds.Any(x=>x<=0)||p.TrackIds.Distinct().Count()!=p.TrackIds.Length)errors.Add("ClassificationRequired");
        var secondary=p.SecondarySkillIds??Array.Empty<int>();
        if(secondary.Length>30||secondary.Any(x=>x<=0||x==p.PrimarySkillId)||secondary.Distinct().Count()!=secondary.Length)
            errors.Add("InvalidSecondarySkills");
        if(p.Points is <1 or >100000||p.DifficultyLevel is <1 or >5)errors.Add("InvalidDifficultyOrPoints");
        if(!Pair(p.Title,250)||!Pair(p.Question,5000))errors.Add("BilingualQuestionRequired");
        if(p.Options is null||p.Options.Length!=4||p.Options.Any(o=>o is null||!Text(o.LatexCode,3000))||
            p.Options.Count(o=>o?.IsCorrect==true)!=1||p.Options.Select(o=>Normalize(o?.LatexCode)).Distinct().Count()!=4)
            errors.Add("FourDistinctOptionsOneCorrect");
        else if(p.Options.Any(o=>!o.IsCorrect&&(!Text(o.ErrorType,80)||!Pair(o.Reason,1000))))errors.Add("DistractorReasonsRequired");
        if(p.Hints is null||p.Hints.Length!=2||p.Hints.Any(h=>!Pair(h,1000))||
            Normalize(p.Hints[0]?.Ar)==Normalize(p.Hints[1]?.Ar)||Normalize(p.Hints[0]?.En)==Normalize(p.Hints[1]?.En))
            errors.Add("TwoDistinctBilingualHintsRequired");
        var solution=p.Solution;
        if(solution is null||!Pair(solution.Idea,2000)||!OptionalText(solution.FormulaLatex,2000)||
            solution.Steps is null||solution.Steps.Length is <1 or >20||solution.Steps.Any(x=>!Pair(x,2000))||
            !OptionalPair(solution.Substitution,2000)||!Pair(solution.Result,1000)||!OptionalPair(solution.Unit,200)||
            !OptionalPair(solution.Verification,2000)||!OptionalPair(solution.CommonError,2000))errors.Add("StructuredSolutionRequired");
        if(!errors.Contains("StructuredSolutionRequired") &&
            (FlatSolution(solution!,true).Length>12000||FlatSolution(solution!,false).Length>12000))errors.Add("SolutionTooLong");
        return errors;
    }
    public static bool IsHintsOnly(string? json)
    {
        if(string.IsNullOrWhiteSpace(json))return false;
        try
        {
            using var doc=JsonDocument.Parse(json);
            var root=doc.RootElement;
            return root.ValueKind==JsonValueKind.Object&&root.TryGetProperty("Kind",out var kind)&&
                kind.ValueKind==JsonValueKind.String&&kind.GetString()=="ReviewedHintsOnly"&&
                root.EnumerateObject().Count()==2&&root.TryGetProperty("Hints",out var hints)&&
                hints.ValueKind==JsonValueKind.Array&&hints.GetArrayLength()==2;
        }
        catch(JsonException){return false;}
    }
    public static bool HasStructuredSolution(string? json)
    {
        if(string.IsNullOrWhiteSpace(json))return false;
        try
        {
            using var doc=JsonDocument.Parse(json);
            return doc.RootElement.ValueKind==JsonValueKind.Object&&doc.RootElement.TryGetProperty("Solution",out var solution)&&
                solution.ValueKind==JsonValueKind.Object;
        }
        catch(JsonException){return false;}
    }
    // Serialize only the localized solution; never hints or distractor metadata.
    public static object? LocalizedSolution(string? json,string language)
    {
        if(string.IsNullOrEmpty(json))return null;
        using var doc=JsonDocument.Parse(json);
        if(!doc.RootElement.TryGetProperty("Solution",out var node))return null;
        var s=node.Deserialize<WizardSolution>();
        if(s is null)return null;
        string L(BilingualText? p)=>language=="en"?p?.En??"":p?.Ar??"";
        return new{Idea=L(s.Idea),s.FormulaLatex,Steps=s.Steps?.Select(L).ToArray()??Array.Empty<string>(),
            Substitution=L(s.Substitution),Result=L(s.Result),Unit=L(s.Unit),Verification=L(s.Verification),CommonError=L(s.CommonError)};
    }
    public static string FlatSolution(WizardSolution s,bool ar)
    {
        string L(BilingualText? p)=>ar?p?.Ar??"":p?.En??"";
        return string.Join("\n\n",new[]{L(s.Idea),string.IsNullOrWhiteSpace(s.FormulaLatex)?"":"$"+s.FormulaLatex+"$"}
            .Concat((s.Steps??Array.Empty<BilingualText>()).Select((x,i)=>(i+1)+". "+L(x)))
            .Concat(new[]{L(s.Substitution),(L(s.Result)+" "+L(s.Unit)).Trim(),L(s.Verification),L(s.CommonError)})
            .Where(x=>!string.IsNullOrWhiteSpace(x)));
    }
}
