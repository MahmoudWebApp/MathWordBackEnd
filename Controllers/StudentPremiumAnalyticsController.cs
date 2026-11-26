using System.Globalization;
using System.Security.Claims;
using System.Text;
using MathWorldAPI.Data;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Private student analytics for an active Premium subscription.
/// Reports aggregate real attempt records, not browser-supplied statistics.
/// </summary>
[ApiController]
[Authorize(Roles = "Student")]
[Route("api/users/premium-analytics")]
public sealed class StudentPremiumAnalyticsController : ControllerBase
{
    private readonly AppDbContext _db;
    public StudentPremiumAnalyticsController(AppDbContext db) => _db = db;

    public sealed record CategoryStatistics(
        int StageId, int CategoryId, string StageNameAr, string StageNameEn,
        string CategoryNameAr, string CategoryNameEn,
        int AttemptedProblems, int SolvedProblems, int ErrorNotebookProblems,
        int Attempts, int CorrectAttempts, int IncorrectAttempts,
        int FirstTryCorrect, int AwardedPoints, long TimeSpentSeconds)
    {
        public int TotalProblems { get; init; }
        public int MasteredProblems { get; init; }
    }
    public sealed record RecentAttempt(int ProblemId,string TitleAr,string TitleEn,bool IsCorrect,DateTime SubmittedAtUtc);

    public sealed record StudentAnalyticsReport(
        DateTime GeneratedAtUtc, int AttemptedProblems, int SolvedProblems,
        int Attempts, int CorrectAttempts, int IncorrectAttempts,
        int FirstTryCorrect, int AwardedPoints, long TimeSpentSeconds,
        IReadOnlyList<CategoryStatistics> Categories)
    {
        public int TotalProblems { get; init; }
        public IReadOnlyList<RecentAttempt> RecentAttempts { get; init; } = Array.Empty<RecentAttempt>();
        public string ScoreBasis { get; init; } = "ActiveProgress";
        public bool GuidedTimeMeasured { get; init; }
        public int GuidedAttempts { get; init; }
        public int? FilterStageId { get; init; }
        public int? FilterCategoryId { get; init; }
        public int? FilterTrackId { get; init; }
        public int? WindowDays { get; init; }
        public DateTime? WindowStartUtc { get; init; }
        public string? FilterStageNameAr { get; init; }
        public string? FilterStageNameEn { get; init; }
        public string? FilterCategoryNameAr { get; init; }
        public string? FilterCategoryNameEn { get; init; }
        public string? FilterTrackNameAr { get; init; }
        public string? FilterTrackNameEn { get; init; }
    }

    public sealed record ReportFilter(int? StageId=null,int? CategoryId=null,int? TrackId=null,int? Days=null);

    [HttpGet]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> Get([FromQuery] ReportFilter filter,CancellationToken ct)
    {
        var userId = await PremiumStudentId(ct);
        if (userId.Status is not null) return userId.Status;
        var scoped=await CurrentFilter(userId.Id!.Value,filter,ct);
        if(scoped.Error is not null)return scoped.Error;
        filter=scoped.Filter!;
        var invalid=await ValidateFilter(filter,ct);
        if(invalid!=null)return invalid;
        return Ok(await BuildReport(userId.Id!.Value, filter, ct));
    }

    [HttpGet("export.csv")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> ExportCsv([FromQuery] ReportFilter filter,[FromQuery] string lang = "ar",
        CancellationToken ct = default)
    {
        if (lang != "ar" && lang != "en")
            return BadRequest(new { Message = "InvalidReportLanguage" });
        var userId = await PremiumStudentId(ct);
        if (userId.Status is not null) return userId.Status;

        var ar = lang == "ar";
        var scoped=await CurrentFilter(userId.Id!.Value,filter,ct);
        if(scoped.Error is not null)return scoped.Error;
        filter=scoped.Filter!;
        var invalid=await ValidateFilter(filter,ct);
        if(invalid!=null)return invalid;
        var report = await BuildReport(userId.Id!.Value, filter, ct);
        var csv = new StringBuilder();
        var lifetime=report.ScoreBasis=="PermanentAchievements";
        csv.AppendLine((ar
            ? "المرحلة,الفئة,المسائل المجربة,المسائل المحلولة,دفتر الأخطاء,عدد المحاولات,الإجابات الصحيحة,الإجابات الخاطئة,صحيحة من أول مرة,النقاط,"+(lifetime?"وقت التدريب العادي (ثانية)":"الوقت بالثواني")
            : "Stage,Category,Attempted problems,Solved problems,Error notebook,Attempts,Correct attempts,Incorrect attempts,Correct on first try,Points,"+(lifetime?"Ordinary practice time (seconds)":"Time (seconds)")) +
            (ar ? ",إجمالي المسائل,نسبة الإنجاز" : ",Total problems,Completion percent"));

        foreach (var row in report.Categories)
        {
            csv.Append(Csv(ar ? row.StageNameAr : row.StageNameEn)).Append(',')
                .Append(Csv(ar ? row.CategoryNameAr : row.CategoryNameEn)).Append(',')
                .Append(row.AttemptedProblems).Append(',').Append(row.SolvedProblems).Append(',')
                .Append(row.ErrorNotebookProblems).Append(',').Append(row.Attempts).Append(',')
                .Append(row.CorrectAttempts).Append(',').Append(row.IncorrectAttempts).Append(',')
                .Append(row.FirstTryCorrect).Append(',').Append(row.AwardedPoints).Append(',')
                .Append(row.TimeSpentSeconds).Append(',').Append(row.TotalProblems).Append(',')
                .Append(Completion(row.SolvedProblems,row.TotalProblems)).AppendLine();
        }
        csv.Append(Csv(ar ? "الإجمالي" : "TOTAL")).Append(",,")
            .Append(report.AttemptedProblems).Append(',').Append(report.SolvedProblems).Append(',')
            .Append(report.Categories.Sum(x => x.ErrorNotebookProblems)).Append(',')
            .Append(report.Attempts).Append(',').Append(report.CorrectAttempts).Append(',')
            .Append(report.IncorrectAttempts).Append(',').Append(report.FirstTryCorrect).Append(',')
            .Append(report.AwardedPoints).Append(',').Append(report.TimeSpentSeconds).Append(',')
            .Append(report.TotalProblems).Append(',').Append(Completion(report.SolvedProblems,report.TotalProblems)).AppendLine();

        // UTF-8 BOM preserves Arabic in Excel, WPS, and other spreadsheet apps.
        var bytes = Encoding.UTF8.GetPreamble().Concat(
            Encoding.UTF8.GetBytes(csv.ToString())).ToArray();
        Response.Headers.CacheControl = "no-store";
        return File(bytes, "text/csv; charset=utf-8",
            "mathworld-premium-analytics-" + lang + ".csv");
    }

    /// <summary>
    /// Real Excel workbook, not a renamed CSV. Each cell is a number or
    /// inline string (never a formula), and only the verified owner can export.
    /// </summary>
    [HttpGet("export.xlsx")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> ExportXlsx([FromQuery] ReportFilter filter,[FromQuery] string lang = "ar",
        CancellationToken ct = default)
    {
        if (lang != "ar" && lang != "en")
            return BadRequest(new { Message = "InvalidReportLanguage" });
        var userId = await PremiumStudentId(ct);
        if (userId.Status is not null) return userId.Status;

        var scoped=await CurrentFilter(userId.Id!.Value,filter,ct);
        if(scoped.Error is not null)return scoped.Error;
        filter=scoped.Filter!;
        var invalid=await ValidateFilter(filter,ct);
        if(invalid!=null)return invalid;
        var report = await BuildReport(userId.Id!.Value, filter, ct);
        var bytes = PremiumAnalyticsXlsxExporter.Create(report, lang == "ar");
        Response.Headers.CacheControl = "no-store";
        Response.Headers["X-Content-Type-Options"] = "nosniff";
        return File(bytes,
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            "mathworld-premium-analytics.xlsx");
    }

    /// <summary>
    /// Real binary PDF download (not the browser print dialog), generated from
    /// the same authorized private report and in the selected output language.
    /// </summary>
    [HttpGet("export.pdf")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> ExportPdf([FromQuery] ReportFilter filter,[FromQuery] string lang = "ar",
        CancellationToken ct = default)
    {
        if (lang != "ar" && lang != "en")
            return BadRequest(new { Message = "InvalidReportLanguage" });
        var userId = await PremiumStudentId(ct);
        if (userId.Status is not null) return userId.Status;

        var scoped=await CurrentFilter(userId.Id!.Value,filter,ct);
        if(scoped.Error is not null)return scoped.Error;
        filter=scoped.Filter!;
        var invalid=await ValidateFilter(filter,ct);
        if(invalid!=null)return invalid;
        var report = await BuildReport(userId.Id!.Value, filter, ct);
        var bytes = PremiumAnalyticsPdfExporter.Create(report, lang == "ar");
        Response.Headers.CacheControl = "no-store";
        Response.Headers["X-Content-Type-Options"] = "nosniff";
        return File(bytes, "application/pdf", "mathworld-premium-analytics-" + lang + ".pdf");
    }

    private static string Completion(int solved,int total) => (total <= 0 ? 0 : Math.Clamp(100.0 * solved / total,0,100)).ToString("0.0",CultureInfo.InvariantCulture);

    private async Task<(int? Id, IActionResult? Status)> PremiumStudentId(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id) || id <= 0)
            return (null, Unauthorized());
        var user = await _db.Users.AsNoTracking().FirstOrDefaultAsync(
            u => u.Id == id && u.Role == "Student" && u.IsActive, ct);
        if (user is null) return (null, Unauthorized());
        if (!PremiumEntitlement.IsActive(user))
            return (null, StatusCode(StatusCodes.Status403Forbidden,
                new { Message = "PremiumRequired" }));
        return (id, null);
    }

    // The selected grade is the source of truth for JSON and all exports.
    // Caller-supplied filters may only narrow the student's current scope.
    private async Task<(ReportFilter? Filter,IActionResult? Error)> CurrentFilter(int userId,ReportFilter requested,CancellationToken ct)
    {
        var selected=await _db.Users.AsNoTracking().Where(u=>u.Id==userId)
            .Select(u=>new{u.CurrentStageId,u.CurrentTrackId}).SingleAsync(ct);
        if(!selected.CurrentStageId.HasValue)return (null,Conflict(new{Message="CurrentGradeRequired"}));
        var tracks=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
        var track=await tracks.ActiveAsync(selected.CurrentStageId,selected.CurrentTrackId,ct);
        // Legacy stages with no published grade still have a valid stage-only scope.
        // Once grades exist, do not expose a stage-wide report to an unplaced student.
        if(tracks.Enabled&&track is null&&await tracks.VisibleTracks().AnyAsync(t=>t.StageId==selected.CurrentStageId,ct))
            return (null,Conflict(new{Message="CurrentGradeRequired"}));
        if((requested.StageId.HasValue&&requested.StageId!=selected.CurrentStageId)||
            (requested.TrackId.HasValue&&requested.TrackId!=track?.Id))
            return (null,BadRequest(new{Message="CurrentGradeReportOnly"}));
        return (requested with{StageId=selected.CurrentStageId,TrackId=track?.Id},null);
    }

    private bool LifetimeEnabled=>HttpContext.RequestServices.GetRequiredService<IConfiguration>().GetValue<bool>("LearningSessions:Enabled");
    private async Task<IActionResult?> ValidateFilter(ReportFilter f,CancellationToken ct)
    {
        if(f.StageId is <=0||f.CategoryId is <=0||f.TrackId is <=0||f.Days is <1 or >365)
            return BadRequest(new{Message="InvalidReportFilter"});
        if(f.StageId==null&&f.CategoryId==null&&f.TrackId==null&&f.Days==null)return null;
        if(!LifetimeEnabled&&f.Days.HasValue)return Conflict(new{Message="ReportFiltersUnavailable"});
        if(f.StageId.HasValue&&!await _db.EducationalStages.AnyAsync(s=>s.Id==f.StageId,ct))return NotFound();
        if(f.CategoryId.HasValue&&!await _db.Categories.AnyAsync(c=>c.Id==f.CategoryId&&(!f.StageId.HasValue||c.StageId==f.StageId),ct))return NotFound();
        if(f.TrackId.HasValue)
        {
            var tracks=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
            if(!tracks.Enabled||!await tracks.VisibleTracks().AnyAsync(t=>t.Id==f.TrackId&&(!f.StageId.HasValue||t.StageId==f.StageId),ct))return NotFound();
            if(f.CategoryId.HasValue&&!await tracks.ValidProblems(f.TrackId.Value).AnyAsync(p=>p.CategoryId==f.CategoryId,ct))return NotFound();
        }
        return null;
    }

    private async Task<StudentAnalyticsReport> BuildReport(int userId, ReportFilter filter,CancellationToken ct)
    {
        if(HttpContext.RequestServices.GetRequiredService<IConfiguration>().GetValue<bool>("LearningSessions:Enabled"))
            return await BuildLifetimeReport(userId,filter,ct);
        var scope=_db.Problems.AsNoTracking().Where(p=>p.StageId==filter.StageId&&
            (!filter.CategoryId.HasValue||p.CategoryId==filter.CategoryId));
        if(filter.TrackId.HasValue)
        {
            var valid=HttpContext.RequestServices.GetRequiredService<LearningTrackService>().ValidProblems(filter.TrackId.Value);
            scope=scope.Where(p=>valid.Any(v=>v.Id==p.Id));
        }
        var totals=await scope.GroupBy(p=>p.CategoryId).Select(g=>new{CategoryId=g.Key,Count=g.Count()}).ToListAsync(ct);
        // Group on PostgreSQL to avoid returning a student's entire attempt log.
        var attempts = await _db.ProblemAttempts.AsNoTracking()
            .Where(x => x.UserId == userId && scope.Any(p=>p.Id==x.ProblemId) &&
                (!filter.TrackId.HasValue||x.PracticeScopeId==filter.TrackId.Value))
            .GroupBy(x => new { x.Problem.StageId, x.Problem.CategoryId })
            .Select(g => new
            {
                g.Key.StageId, g.Key.CategoryId,
                Attempts = g.Count(),
                Correct = g.Count(x => x.IsCorrect),
                Incorrect = g.Count(x => !x.IsCorrect),
                FirstCorrect = g.Count(x => x.IsOfficial && x.IsCorrect),
                Points = g.Sum(x => x.PointsEarned),
                Seconds = g.Sum(x => (long)x.TimeSpentSeconds)
            }).ToListAsync(ct);

        var progress = await _db.UserProgresses.AsNoTracking()
            .Where(x => x.UserId == userId && x.Attempts > 0 && scope.Any(p=>p.Id==x.ProblemId) &&
                (!filter.TrackId.HasValue||x.PracticeScopeId==filter.TrackId.Value))
            .GroupBy(x => new { x.Problem.StageId, x.Problem.CategoryId })
            .Select(g => new
            {
                g.Key.StageId, g.Key.CategoryId,
                Attempted = g.Count(),
                Solved = g.Count(x => x.IsSolved),
                Mastered = g.Count(x => x.MasteryStatus == "Mastered"),
                ErrorNotebook = g.Count(x => x.IsInErrorNotebook && !x.IsErrorNotebookArchived)
            }).ToListAsync(ct);

        var categories = await _db.Categories.AsNoTracking().Select(c => new
        {
            c.Id, c.StageId, c.NameAr, c.NameEn,
            StageAr = c.Stage.NameAr, StageEn = c.Stage.NameEn
        }).ToListAsync(ct);
        var rows = new List<CategoryStatistics>();
        foreach (var category in categories)
        {
            var p = progress.FirstOrDefault(x => x.CategoryId == category.Id &&
                x.StageId == category.StageId);
            var a = attempts.FirstOrDefault(x => x.CategoryId == category.Id &&
                x.StageId == category.StageId);
            var total=totals.FirstOrDefault(t=>t.CategoryId==category.Id)?.Count??0;
            if(total==0)continue;
            rows.Add(new CategoryStatistics(
                category.StageId, category.Id, category.StageAr, category.StageEn,
                category.NameAr, category.NameEn, p?.Attempted ?? 0,
                p?.Solved ?? 0, p?.ErrorNotebook ?? 0, a?.Attempts ?? 0,
                a?.Correct ?? 0, a?.Incorrect ?? 0, a?.FirstCorrect ?? 0,
                a?.Points ?? 0, a?.Seconds ?? 0){TotalProblems=total,MasteredProblems=p?.Mastered??0});
        }

        rows = rows.OrderBy(x => x.StageId).ThenBy(x => x.CategoryId).ToList();
        return new StudentAnalyticsReport(
            DateTime.UtcNow,
            rows.Sum(x => x.AttemptedProblems),
            rows.Sum(x => x.SolvedProblems),
            rows.Sum(x => x.Attempts),
            rows.Sum(x => x.CorrectAttempts),
            rows.Sum(x => x.IncorrectAttempts),
            rows.Sum(x => x.FirstTryCorrect),
            rows.Sum(x => x.AwardedPoints),
            rows.Sum(x => x.TimeSpentSeconds),
            rows){TotalProblems=rows.Sum(x=>x.TotalProblems),FilterStageId=filter.StageId,FilterCategoryId=filter.CategoryId,
                FilterTrackId=filter.TrackId,RecentAttempts=await Recent(userId,filter,scope,null,false,ct)};
    }

    // Single report builder for the JSON, CSV, XLSX and PDF endpoints.
    // Distinguish lifetime unique credits from current error-notebook state.
    // Guided attempts have no measured duration; do not invent one.
    private async Task<StudentAnalyticsReport> BuildLifetimeReport(int userId,ReportFilter filter,CancellationToken ct)
    {
        var generated=DateTime.UtcNow;
        var cutoff=filter.Days.HasValue?generated.Date.AddDays(1-filter.Days.Value):(DateTime?)null;
        var scope=_db.Problems.AsNoTracking().Where(p=>(!filter.StageId.HasValue||p.StageId==filter.StageId)&&
            (!filter.CategoryId.HasValue||p.CategoryId==filter.CategoryId));
        if(filter.TrackId.HasValue)
        {
            var valid=HttpContext.RequestServices.GetRequiredService<LearningTrackService>().ValidProblems(filter.TrackId.Value);
            scope=scope.Where(p=>valid.Any(v=>v.Id==p.Id));
        }
        var totals=await scope.GroupBy(p=>p.CategoryId).Select(g=>new{CategoryId=g.Key,Count=g.Count()}).ToListAsync(ct);
        // Actual track activity must be attributed to the stored scope,
        // not inferred from shared membership of a question in several tracks.
        var ordinary=_db.ProblemAttempts.AsNoTracking().Where(a=>a.UserId==userId&&
            (!filter.TrackId.HasValue||a.PracticeScopeId==filter.TrackId.Value)&&
            (!cutoff.HasValue||a.SubmittedAt>=cutoff)&&scope.Any(p=>p.Id==a.ProblemId))
            .Select(a=>new{a.ProblemId,a.Problem.StageId,a.Problem.CategoryId,a.IsCorrect,Seconds=(long)a.TimeSpentSeconds});
        var guided=from a in _db.LearningSessionAttempts.AsNoTracking()
                   join s in _db.LearningSessions.AsNoTracking() on a.SessionId equals s.Id
                   join p in _db.Problems.AsNoTracking() on a.ProblemId equals p.Id
                   where s.UserId==userId&&s.StageId==p.StageId&&p.Category.StageId==s.StageId&&
                       (!filter.TrackId.HasValue||s.TrackId==filter.TrackId)&&
                       (!cutoff.HasValue||a.SubmittedAtUtc>=cutoff)&&scope.Any(q=>q.Id==a.ProblemId)
                   select new{a.ProblemId,s.StageId,p.CategoryId,a.IsCorrect,Seconds=0L};
        var answers=ordinary.Concat(guided);
        var attempts=await answers.GroupBy(a=>new{a.StageId,a.CategoryId})
            .Select(g=>new{g.Key.StageId,g.Key.CategoryId,Attempts=g.Count(),Correct=g.Count(a=>a.IsCorrect),
                Incorrect=g.Count(a=>!a.IsCorrect),Seconds=g.Sum(a=>a.Seconds)}).ToListAsync(ct);
        var credits=_db.PermanentProblemAchievements.AsNoTracking().Where(a=>a.UserId==userId&&
            (!cutoff.HasValue||a.EarnedAtUtc>=cutoff)&&scope.Any(p=>p.Id==a.ProblemId)&&(!filter.StageId.HasValue||a.StageId==filter.StageId)&&
            (!filter.CategoryId.HasValue||a.CategoryId==filter.CategoryId)&&(!filter.TrackId.HasValue||
                (scope.Any(p=>p.Id==a.ProblemId)&&
                 (_db.ProblemAttempts.Any(p=>p.UserId==a.UserId&&p.ProblemId==a.ProblemId&&p.PracticeScopeId==filter.TrackId.Value&&
                     p.IsCorrect&&p.SubmittedAt==a.EarnedAtUtc)||
                  (from sa in _db.LearningSessionAttempts
                   join session in _db.LearningSessions on sa.SessionId equals session.Id
                   where session.UserId==a.UserId&&session.TrackId==filter.TrackId&&sa.ProblemId==a.ProblemId&&
                         sa.IsCorrect&&sa.SubmittedAtUtc==a.EarnedAtUtc select sa).Any()))));
        var earned=await credits.GroupBy(a=>new{a.StageId,a.CategoryId}).Select(g=>new{
            g.Key.StageId,g.Key.CategoryId,Solved=g.Count(),Points=g.Sum(a=>a.Points),
            First=g.Count(a=>_db.ProblemAttempts.Any(p=>p.UserId==userId&&p.ProblemId==a.ProblemId&&p.IsCorrect&&
                p.IsOfficial&&p.AttemptNumber==1&&!p.UsedHint&&p.SubmittedAt==a.EarnedAtUtc)||
                (from sa in _db.LearningSessionAttempts
                 join session in _db.LearningSessions on sa.SessionId equals session.Id
                 where session.UserId==userId&&sa.ProblemId==a.ProblemId&&sa.IsCorrect&&sa.AttemptNumber==1&&
                     !sa.UsedHint&&sa.SubmittedAtUtc==a.EarnedAtUtc select sa).Any())
        }).ToListAsync(ct);
        var legacy=_db.UserProgresses.IgnoreQueryFilters().AsNoTracking().Where(p=>p.UserId==userId&&p.Attempts>0&&!cutoff.HasValue&&
            (!filter.TrackId.HasValue||p.PracticeScopeId==filter.TrackId.Value)&&scope.Any(q=>q.Id==p.ProblemId))
            .Select(p=>new{p.ProblemId,p.Problem.StageId,p.Problem.CategoryId});
        var attempted=await answers.Select(a=>new{a.ProblemId,a.StageId,a.CategoryId})
            .Union(credits.Select(a=>new{a.ProblemId,a.StageId,a.CategoryId})).Union(legacy)
            .GroupBy(a=>new{a.StageId,a.CategoryId}).Select(g=>new{g.Key.StageId,g.Key.CategoryId,Count=g.Count()})
            .ToListAsync(ct);
        // Notebook state is current rather than historical. In a specific
        // track use only its cycle; all-scope reports count distinct questions
        // with an outstanding error in any cycle, never duplicate a question.
        var errors=await _db.UserProgresses.IgnoreQueryFilters().AsNoTracking()
            .Where(p=>p.UserId==userId&&p.IsInErrorNotebook&&!p.IsErrorNotebookArchived&&
                (!filter.TrackId.HasValue||p.PracticeScopeId==filter.TrackId)&&scope.Any(q=>q.Id==p.ProblemId))
            .Select(p=>new{p.ProblemId,p.Problem.StageId,p.Problem.CategoryId}).Distinct()
            .GroupBy(p=>new{p.StageId,p.CategoryId})
            .Select(g=>new{g.Key.StageId,g.Key.CategoryId,Count=g.Count()}).ToListAsync(ct);
        var mastery=await TrackPractice.For(_db,TrackPractice.Scope(HttpContext.RequestServices.GetRequiredService<IConfiguration>(),filter.TrackId))
            .AsNoTracking().Where(p=>p.UserId==userId&&p.MasteryStatus=="Mastered"&&scope.Any(q=>q.Id==p.ProblemId))
            .GroupBy(p=>p.Problem.CategoryId).Select(g=>new{CategoryId=g.Key,Count=g.Count()}).ToListAsync(ct);
        var categories=await _db.Categories.AsNoTracking().Select(c=>new{c.Id,c.StageId,c.NameAr,c.NameEn,
            StageAr=c.Stage.NameAr,StageEn=c.Stage.NameEn}).ToListAsync(ct);
        var rows=new List<CategoryStatistics>();
        foreach(var c in categories)
        {
            var a=attempts.FirstOrDefault(x=>x.StageId==c.StageId&&x.CategoryId==c.Id);
            var e=earned.FirstOrDefault(x=>x.StageId==c.StageId&&x.CategoryId==c.Id);
            var n=attempted.FirstOrDefault(x=>x.StageId==c.StageId&&x.CategoryId==c.Id);
            var review=errors.FirstOrDefault(x=>x.StageId==c.StageId&&x.CategoryId==c.Id);
            var total=totals.FirstOrDefault(t=>t.CategoryId==c.Id)?.Count??0;
            if(total==0)continue;
            rows.Add(new(c.StageId,c.Id,c.StageAr,c.StageEn,c.NameAr,c.NameEn,n?.Count??0,e?.Solved??0,review?.Count??0,
                a?.Attempts??0,a?.Correct??0,a?.Incorrect??0,e?.First??0,e?.Points??0,a?.Seconds??0){TotalProblems=total,MasteredProblems=mastery.FirstOrDefault(m=>m.CategoryId==c.Id)?.Count??0});
        }
        rows=rows.OrderBy(x=>x.StageId).ThenBy(x=>x.CategoryId).ToList();
        var stageName=filter.StageId.HasValue?await _db.EducationalStages.AsNoTracking()
            .Where(s=>s.Id==filter.StageId).Select(s=>new{s.NameAr,s.NameEn}).SingleOrDefaultAsync(ct):null;
        var categoryName=categories.FirstOrDefault(s=>s.Id==filter.CategoryId);
        var trackName=filter.TrackId.HasValue?await _db.LearningTracks.AsNoTracking()
            .Where(s=>s.Id==filter.TrackId).Select(s=>new{s.NameAr,s.NameEn}).SingleOrDefaultAsync(ct):null;
        return new StudentAnalyticsReport(generated,rows.Sum(x=>x.AttemptedProblems),rows.Sum(x=>x.SolvedProblems),
            rows.Sum(x=>x.Attempts),rows.Sum(x=>x.CorrectAttempts),rows.Sum(x=>x.IncorrectAttempts),rows.Sum(x=>x.FirstTryCorrect),
            rows.Sum(x=>x.AwardedPoints),rows.Sum(x=>x.TimeSpentSeconds),rows)
        {TotalProblems=rows.Sum(x=>x.TotalProblems),RecentAttempts=await Recent(userId,filter,scope,cutoff,true,ct),
            ScoreBasis="PermanentAchievements",GuidedAttempts=await guided.CountAsync(ct),GuidedTimeMeasured=false,
            FilterStageId=filter.StageId,FilterCategoryId=filter.CategoryId,FilterTrackId=filter.TrackId,WindowDays=filter.Days,WindowStartUtc=cutoff,
            FilterStageNameAr=stageName?.NameAr,FilterStageNameEn=stageName?.NameEn,
            FilterCategoryNameAr=categoryName?.NameAr,FilterCategoryNameEn=categoryName?.NameEn,
            FilterTrackNameAr=trackName?.NameAr,FilterTrackNameEn=trackName?.NameEn};
    }

    private async Task<IReadOnlyList<RecentAttempt>> Recent(int userId,ReportFilter filter,
        IQueryable<MathWorldAPI.Models.MathProblem> scope,DateTime? cutoff,bool includeGuided,CancellationToken ct)
    {
        var ordinary=await _db.ProblemAttempts.AsNoTracking()
            .Where(a=>a.UserId==userId&&scope.Any(p=>p.Id==a.ProblemId)&&
                (!filter.TrackId.HasValue||a.PracticeScopeId==filter.TrackId.Value)&&
                (!cutoff.HasValue||a.SubmittedAt>=cutoff))
            .OrderByDescending(a=>a.SubmittedAt).ThenByDescending(a=>a.Id).Take(10)
            .Select(a=>new RecentAttempt(a.ProblemId,a.Problem.TitleAr,a.Problem.TitleEn,a.IsCorrect,a.SubmittedAt)).ToListAsync(ct);
        if(!includeGuided)return ordinary;
        var guided=await (from a in _db.LearningSessionAttempts.AsNoTracking()
                         join session in _db.LearningSessions.AsNoTracking() on a.SessionId equals session.Id
                         join p in scope on a.ProblemId equals p.Id
                         where session.UserId==userId&&session.StageId==p.StageId&&
                             (!filter.TrackId.HasValue||session.TrackId==filter.TrackId)&&
                             (!cutoff.HasValue||a.SubmittedAtUtc>=cutoff)
                         orderby a.SubmittedAtUtc descending
                         select new RecentAttempt(p.Id,p.TitleAr,p.TitleEn,a.IsCorrect,a.SubmittedAtUtc)).Take(10).ToListAsync(ct);
        return ordinary.Concat(guided).OrderByDescending(a=>a.SubmittedAtUtc).Take(10).ToArray();
    }

    private static string Csv(string? input)
    {
        var value = (input ?? "").Trim();
        // Disarm Excel formula injection from admin-entered stage/category names.
        if (value.Length > 0 && "=+-@".Contains(value[0])) value = "'" + value;
        return "\"" + value.Replace("\"", "\"\"").Replace("\r", " ").Replace("\n", " ") + "\"";
    }
}
