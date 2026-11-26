using System.Globalization;
using System.Security.Claims;
using System.Text;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Learner-owned Premium progress reports. No arbitrary user ID is
    /// accepted from the client, and exports never include peer information.
    /// </summary>
    [ApiController]
    [Authorize(Roles = "Student")]
    [Route("api/users/premium-report")]
    public sealed class PremiumReportsController : ControllerBase
    {
        private readonly AppDbContext _db;

        public PremiumReportsController(AppDbContext db) => _db = db;

        [HttpGet]
        public async Task<IActionResult> Get(
            [FromQuery] int? stageId,
            CancellationToken cancellationToken)
        {
            var report = await Build(stageId, cancellationToken);
            return report.Error ?? Ok(LanguageHelper.SuccessResponse(
                report.Data!, "Success",
                LanguageHelper.GetLanguageFromRequest(Request)));
        }

        [HttpGet("csv")]
        public async Task<IActionResult> ExportCsv(
            [FromQuery] int? stageId,
            CancellationToken cancellationToken)
        {
            var report = await Build(stageId, cancellationToken);
            if (report.Error != null) return report.Error;
            var data = report.Data!;
            var csv = new StringBuilder();
            // UTF-8 BOM lets desktop Excel correctly interpret Arabic.
            csv.AppendLine("Category,Total Problems,Attempted,Solved,First Try Correct,Mastered,Completion %,Official Points");
            foreach (var category in data.Categories)
            {
                csv.Append(Csv(category.Name)).Append(',')
                    .Append(category.TotalProblems).Append(',')
                    .Append(category.AttemptedProblems).Append(',')
                    .Append(category.SolvedProblems).Append(',')
                    .Append(category.FirstTryCorrect).Append(',')
                    .Append(category.MasteredProblems).Append(',')
                    .Append(category.CompletionPercent).Append(',')
                    .Append(category.OfficialPoints).AppendLine();
            }
            // Prefixing BOM is intentional and safe for UTF-8 CSV downloads.
            var bytes = new UTF8Encoding(true).GetPreamble()
                .Concat(Encoding.UTF8.GetBytes(csv.ToString())).ToArray();
            return File(bytes, "text/csv; charset=utf-8",
                data.TrackId.HasValue ? $"mathworld-track-{data.TrackId}-progress.csv" : $"mathworld-stage-{data.StageId}-progress.csv");
        }

        private async Task<(PremiumProgressReport? Data, IActionResult? Error)> Build(
            int? stageId, CancellationToken cancellationToken)
        {
            if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),
                    out var userId))
                return (null, Unauthorized());

            var user = await _db.Users.AsNoTracking()
                .Where(u => u.Id == userId && u.Role == "Student" && u.IsActive)
                .Select(u => new { u.CurrentStageId, u.CurrentTrackId, u.SubscriptionType, u.PremiumExpiresAtUtc })
                .FirstOrDefaultAsync(cancellationToken);
            if (user == null) return (null, Unauthorized());
            if (!PremiumEntitlement.IsActive(user.SubscriptionType,
                    user.PremiumExpiresAtUtc))
                return (null, StatusCode(403, LanguageHelper.ErrorResponse<object>(
                    "PremiumRequired",
                    LanguageHelper.GetLanguageFromRequest(Request), 403)));

            var selectedId = user.CurrentStageId;
            if(stageId.HasValue&&stageId!=selectedId)
            {
                if(!await _db.EducationalStages.AsNoTracking().AnyAsync(s=>s.Id==stageId,cancellationToken))return (null,NotFound());
                return (null,BadRequest(new{Message="CurrentGradeReportOnly"}));
            }
            if (selectedId == null || selectedId < 1) return (null, BadRequest());
            var stage = await _db.EducationalStages.AsNoTracking()
                .Where(s => s.Id == selectedId.Value)
                .Select(s => new { s.Id, s.NameAr, s.NameEn })
                .FirstOrDefaultAsync(cancellationToken);
            if (stage == null) return (null, NotFound());

            var tracks=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
            var track=await tracks.ActiveAsync(stage.Id,user.CurrentTrackId,cancellationToken);
            if(tracks.Enabled&&track is null&&await tracks.VisibleTracks().AnyAsync(t=>t.StageId==stage.Id,cancellationToken))
                return (null,Conflict(new{Message="CurrentGradeRequired"}));
            var scope=track is null?_db.Problems.AsNoTracking().Where(p=>p.StageId==stage.Id):tracks.ValidProblems(track.Id);
            var categoriesQuery=_db.Categories.AsNoTracking().Where(c=>c.StageId==stage.Id);
            if(track is not null)categoriesQuery=categoriesQuery.Where(c=>scope.Any(p=>p.CategoryId==c.Id));
            var categories = await categoriesQuery
                .Where(c => c.StageId == stage.Id)
                .OrderBy(c => c.Order).ThenBy(c => c.Id)
                .Select(c => new
                {
                    c.Id, c.NameAr, c.NameEn,
                    TotalProblems = scope.Count(p=>p.CategoryId==c.Id)
                }).ToListAsync(cancellationToken);

            // Official awarded points come from immutable attempt snapshots.
            // Never reaward points based on the current problem point value.
            var progress = await TrackPractice.For(_db,TrackPractice.Scope(HttpContext.RequestServices.GetRequiredService<IConfiguration>(),track?.Id)).AsNoTracking()
                .Where(p => p.UserId == userId && scope.Any(q=>q.Id==p.ProblemId))
                .GroupBy(p => p.Problem.CategoryId)
                .Select(g => new
                {
                    CategoryId = g.Key,
                    Attempted = g.Count(p => p.Attempts > 0),
                    Solved = g.Count(p => p.IsSolved),
                    FirstTry = g.Count(p => p.FirstAttemptCorrect == true),
                    Mastered = g.Count(p => p.MasteryStatus == "Mastered")
                }).ToListAsync(cancellationToken);
            var attempts = await _db.ProblemAttempts.AsNoTracking()
                .Where(a => a.UserId == userId && scope.Any(q=>q.Id==a.ProblemId) &&
                    a.IsOfficial&&(track==null||a.PracticeScopeId==track.Id))
                .GroupBy(a => a.Problem.CategoryId)
                .Select(g => new { CategoryId = g.Key,
                    Points = g.Sum(a => a.PointsEarned) })
                .ToListAsync(cancellationToken);

            if(HttpContext.RequestServices.GetRequiredService<IConfiguration>().GetValue<bool>("LearningSessions:Enabled"))
                attempts=await _db.PermanentProblemAchievements.AsNoTracking()
                    .Where(a=>a.UserId==userId&&scope.Any(q=>q.Id==a.ProblemId)&&
                        (track==null||
                         _db.ProblemAttempts.Any(p=>p.UserId==userId&&p.ProblemId==a.ProblemId&&p.PracticeScopeId==track.Id&&p.IsCorrect&&p.SubmittedAt==a.EarnedAtUtc)||
                         (from sa in _db.LearningSessionAttempts
                          join session in _db.LearningSessions on sa.SessionId equals session.Id
                          where session.UserId==userId&&session.TrackId==track.Id&&sa.ProblemId==a.ProblemId&&sa.IsCorrect&&sa.SubmittedAtUtc==a.EarnedAtUtc
                          select sa).Any()))
                    .GroupBy(a=>a.CategoryId).Select(g=>new{CategoryId=g.Key,Points=g.Sum(a=>a.Points)}).ToListAsync(cancellationToken);

            var localizedArabic =
                LanguageHelper.GetLanguageFromRequest(Request) != "en";
            var rows = categories.Select(c =>
            {
                var p = progress.FirstOrDefault(x => x.CategoryId == c.Id);
                var a = attempts.FirstOrDefault(x => x.CategoryId == c.Id);
                var solved = p?.Solved ?? 0;
                return new PremiumCategoryReport
                {
                    CategoryId = c.Id,
                    Name = localizedArabic ? c.NameAr : c.NameEn,
                    TotalProblems = c.TotalProblems,
                    AttemptedProblems = p?.Attempted ?? 0,
                    SolvedProblems = solved,
                    FirstTryCorrect = p?.FirstTry ?? 0,
                    MasteredProblems = p?.Mastered ?? 0,
                    OfficialPoints = a?.Points ?? 0,
                    CompletionPercent = c.TotalProblems == 0 ? 0 :
                        (int)Math.Round(100d * solved / c.TotalProblems)
                };
            }).ToArray();

            var total = rows.Sum(x => x.TotalProblems);
            var solvedTotal = rows.Sum(x => x.SolvedProblems);
            return (new PremiumProgressReport
            {
                StageId = stage.Id,
                TrackId = track?.Id,
                StageName = localizedArabic ? (track?.NameAr??stage.NameAr) : (track?.NameEn??stage.NameEn),
                TotalProblems = total,
                AttemptedProblems = rows.Sum(x => x.AttemptedProblems),
                SolvedProblems = solvedTotal,
                FirstTryCorrect = rows.Sum(x => x.FirstTryCorrect),
                MasteredProblems = rows.Sum(x => x.MasteredProblems),
                OfficialPoints = rows.Sum(x => x.OfficialPoints),
                CompletionPercent = total == 0 ? 0 :
                    (int)Math.Round(100d * solvedTotal / total),
                Categories = rows
            }, null);
        }

        private static string Csv(string text)
        {
            // Escape formula-leading characters before Excel evaluates CSV.
            var safe = text.TrimStart();
            if (safe.Length > 0 && "=+-@".Contains(safe[0]))
                text = "'" + text;
            return "\"" + text.Replace("\"", "\"\"") + "\"";
        }

        private sealed class PremiumProgressReport
        {
            public int StageId { get; set; }
            public int? TrackId { get; set; }
            public string StageName { get; set; } = string.Empty;
            public int TotalProblems { get; set; }
            public int AttemptedProblems { get; set; }
            public int SolvedProblems { get; set; }
            public int FirstTryCorrect { get; set; }
            public int MasteredProblems { get; set; }
            public int OfficialPoints { get; set; }
            public int CompletionPercent { get; set; }
            public PremiumCategoryReport[] Categories { get; set; } =
                Array.Empty<PremiumCategoryReport>();
        }

        private sealed class PremiumCategoryReport
        {
            public int CategoryId { get; set; }
            public string Name { get; set; } = string.Empty;
            public int TotalProblems { get; set; }
            public int AttemptedProblems { get; set; }
            public int SolvedProblems { get; set; }
            public int FirstTryCorrect { get; set; }
            public int MasteredProblems { get; set; }
            public int OfficialPoints { get; set; }
            public int CompletionPercent { get; set; }
        }
    }
}
