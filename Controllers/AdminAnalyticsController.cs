using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Read-only operator analytics. Admin accounts are never included in
    /// learner, attempt, solved, or leaderboard totals.
    /// All period filters use UTC calendar dates, including the current day.
    /// </summary>
    [ApiController]
    [Route("api/admin/analytics")]
    [Authorize(Roles = "Admin")]
    public sealed class AdminAnalyticsController : ControllerBase
    {
        private readonly AppDbContext _db;
        public AdminAnalyticsController(AppDbContext db) => _db = db;

        [HttpGet("overview")]
        public async Task<ActionResult<ApiResponse<AdminAnalyticsOverviewDto>>> Overview(
            [FromQuery] int days = 30, CancellationToken cancellationToken = default)
        {
            if (days < 1 || days > 365)
                return BadRequest(Error<AdminAnalyticsOverviewDto>("InvalidAnalyticsWindow", 400));

            var cutoffUtc = Cutoff(days);
            var stages = await BuildStageSummaries(cutoffUtc, cancellationToken);
            var totalStudents = await _db.Users.AsNoTracking()
                .CountAsync(u => u.Role == "Student", cancellationToken);
            var activeStudents = await _db.ProblemAttempts.AsNoTracking()
                .Where(a => a.User.Role == "Student" && a.SubmittedAt >= cutoffUtc)
                .Select(a => a.UserId).Distinct()
                .CountAsync(cancellationToken);

            // Server-calculated platform trends: only actual Student attempts.
            var dailyRows = await _db.ProblemAttempts.AsNoTracking()
                .Where(a => a.User.Role == "Student" && a.SubmittedAt >= cutoffUtc)
                .GroupBy(a => a.SubmittedAt.Date)
                .Select(g => new
                {
                    Day = g.Key,
                    Attempts = g.Count(),
                    Correct = g.Count(a => a.IsCorrect),
                    Students = g.Select(a => a.UserId).Distinct().Count()
                }).ToListAsync(cancellationToken);
            var dailyLookup = dailyRows.ToDictionary(x => x.Day.Date);
            var dailyActivity = Enumerable.Range(0, days).Select(index =>
            {
                var date = cutoffUtc.AddDays(index);
                dailyLookup.TryGetValue(date.Date, out var row);
                return new AdminActivityDayDto
                {
                    DayUtc = date,
                    Attempts = row?.Attempts ?? 0,
                    CorrectAttempts = row?.Correct ?? 0,
                    UniqueStudents = row?.Students ?? 0
                };
            }).ToList();

            var categoryErrorRows = await _db.ProblemAttempts.AsNoTracking()
                .Where(a => a.User.Role == "Student" && a.SubmittedAt >= cutoffUtc)
                .GroupBy(a => a.Problem.CategoryId)
                .Select(g => new
                {
                    CategoryId = g.Key,
                    Attempts = g.Count(),
                    Incorrect = g.Count(a => !a.IsCorrect),
                    Correct = g.Count(a => a.IsCorrect),
                    Seconds = g.Sum(a => a.TimeSpentSeconds)
                })
                .Where(row => row.Incorrect > 0)
                .OrderByDescending(row => row.Incorrect)
                .ThenByDescending(row => row.Attempts)
                .ThenBy(row => row.CategoryId)
                .Take(5).ToListAsync(cancellationToken);

            var categoryIds = categoryErrorRows.Select(x => x.CategoryId).ToArray();
            var categoryDetails = await _db.Categories.AsNoTracking()
                .Where(c => categoryIds.Contains(c.Id))
                .Select(c => new
                {
                    c.Id, c.StageId, c.NameAr, c.NameEn,
                    StageNameAr = c.Stage.NameAr,
                    StageNameEn = c.Stage.NameEn
                }).ToDictionaryAsync(c => c.Id, cancellationToken);
            var missedCategories = categoryErrorRows
                .Where(row => categoryDetails.ContainsKey(row.CategoryId))
                .Select(row =>
                {
                    var cat = categoryDetails[row.CategoryId];
                    return new AdminWeakCategoryDto
                    {
                        CategoryId = cat.Id, StageId = cat.StageId,
                        NameAr = cat.NameAr, NameEn = cat.NameEn,
                        StageNameAr = cat.StageNameAr,
                        StageNameEn = cat.StageNameEn,
                        AttemptsInWindow = row.Attempts,
                        IncorrectAttemptsInWindow = row.Incorrect,
                        CorrectAttemptsInWindow = row.Correct,
                        IncorrectRatePercent = Percent(row.Incorrect, row.Attempts),
                        AverageAttemptSeconds = row.Attempts == 0 ? 0 :
                            Math.Round((double)row.Seconds / row.Attempts, 1)
                    };
                }).ToList();

            var problemErrorRows = await _db.ProblemAttempts.AsNoTracking()
                .Where(a => a.User.Role == "Student" && a.SubmittedAt >= cutoffUtc)
                .GroupBy(a => a.ProblemId)
                .Select(g => new
                {
                    ProblemId = g.Key,
                    Attempts = g.Count(),
                    Incorrect = g.Count(a => !a.IsCorrect),
                    Correct = g.Count(a => a.IsCorrect)
                })
                .Where(row => row.Incorrect > 0)
                .OrderByDescending(row => row.Incorrect)
                .ThenByDescending(row => row.Attempts)
                .ThenBy(row => row.ProblemId)
                .Take(5).ToListAsync(cancellationToken);
            var problemIds = problemErrorRows.Select(x => x.ProblemId).ToArray();
            var problemDetails = await _db.Problems.AsNoTracking()
                .Where(p => problemIds.Contains(p.Id))
                .Select(p => new
                {
                    p.Id, p.StageId, p.CategoryId, p.TitleAr, p.TitleEn
                }).ToDictionaryAsync(p => p.Id, cancellationToken);
            var missedProblems = problemErrorRows
                .Where(row => problemDetails.ContainsKey(row.ProblemId))
                .Select(row =>
                {
                    var problem = problemDetails[row.ProblemId];
                    return new AdminMissedProblemDto
                    {
                        ProblemId = problem.Id,
                        StageId = problem.StageId,
                        CategoryId = problem.CategoryId,
                        TitleAr = problem.TitleAr,
                        TitleEn = problem.TitleEn,
                        AttemptsInWindow = row.Attempts,
                        IncorrectAttemptsInWindow = row.Incorrect,
                        CorrectAttemptsInWindow = row.Correct
                    };
                }).ToList();

            var result = new AdminAnalyticsOverviewDto
            {
                GeneratedAtUtc = DateTime.UtcNow,
                WindowDays = days,
                TotalStudents = totalStudents,
                ActiveStudentsInWindow = activeStudents,
                TotalProblems = stages.Sum(s => s.Problems),
                TotalUniqueSolved = stages.Sum(s => s.UniqueSolved),
                AttemptsInWindow = stages.Sum(s => s.AttemptsInWindow),
                CorrectAttemptsInWindow = stages.Sum(s => s.CorrectAttemptsInWindow),
                Stages = stages,
                DailyActivity = dailyActivity,
                MostMissedCategories = missedCategories,
                MostMissedProblems = missedProblems
            };
            result.CorrectRatePercent = Percent(
                result.CorrectAttemptsInWindow, result.AttemptsInWindow);
            return Ok(Success(result));
        }

        [HttpGet("stages/{stageId:int}")]
        public async Task<ActionResult<ApiResponse<AdminStageDetailDto>>> StageDetails(
            [FromRoute] int stageId,
            [FromQuery] int days = 30,
            [FromQuery] int? trackId = null,
            [FromQuery] int? categoryId = null,
            CancellationToken cancellationToken = default)
        {
            if (days < 1 || days > 365)
                return BadRequest(Error<AdminStageDetailDto>("InvalidAnalyticsWindow", 400));

            var cutoffUtc = Cutoff(days);
            var summaries = await BuildStageSummaries(cutoffUtc, cancellationToken);
            var summary = summaries.FirstOrDefault(s => s.StageId == stageId);
            if (summary == null)
                return NotFound(Error<AdminStageDetailDto>("StageNotFound", 404));

            if(trackId is <=0 || categoryId is <=0)
                return BadRequest(Error<AdminStageDetailDto>("InvalidAnalyticsFilter",400));
            if(trackId.HasValue||categoryId.HasValue)
                return await ScopedDetails(summary,days,trackId,categoryId,cutoffUtc,cancellationToken);

            var categories = await _db.Categories.AsNoTracking()
                .Where(c => c.StageId == stageId)
                .OrderBy(c => c.Order)
                .Select(c => new { c.Id, c.NameAr, c.NameEn })
                .ToListAsync(cancellationToken);

            var problemCounts = await _db.Problems.AsNoTracking()
                .Where(p => p.StageId == stageId)
                .GroupBy(p => p.CategoryId)
                .Select(g => new { Id = g.Key, Count = g.Count() })
                .ToDictionaryAsync(x => x.Id, x => x.Count, cancellationToken);

            var solvedCounts = await _db.UserProgresses.AsNoTracking()
                .Where(p => p.IsSolved && p.User.Role == "Student" &&
                    p.Problem.StageId == stageId)
                .GroupBy(p => p.Problem.CategoryId)
                .Select(g => new { Id = g.Key, Count = g.Count() })
                .ToDictionaryAsync(x => x.Id, x => x.Count, cancellationToken);

            var categoryActivity = await _db.ProblemAttempts.AsNoTracking()
                .Where(a => a.User.Role == "Student" &&
                    a.Problem.StageId == stageId && a.SubmittedAt >= cutoffUtc)
                .GroupBy(a => a.Problem.CategoryId)
                .Select(g => new
                {
                    Id = g.Key,
                    Attempts = g.Count(),
                    Correct = g.Count(a => a.IsCorrect)
                })
                .ToListAsync(cancellationToken);
            var activityByCategory = categoryActivity.ToDictionary(x => x.Id);

            // Ranking includes all historical solves in this stage, regardless
            // of the learner's current stage selection. Point values come
            // from immutable attempt snapshots, not edited question settings.
            var top = await _db.UserProgresses.AsNoTracking()
                .Where(p => p.IsSolved && p.User.Role == "Student" &&
                    p.Problem.StageId == stageId)
                .GroupBy(p => new { p.UserId, p.User.FullName })
                .Select(g => new
                {
                    g.Key.UserId,
                    g.Key.FullName,
                    UniqueSolved = g.Count(),
                    FirstTry = g.Count(p => p.FirstAttemptCorrect == true),
                    Points = _db.ProblemAttempts
                        .Where(a => a.UserId == g.Key.UserId &&
                            a.Problem.StageId == stageId)
                        .Sum(a => a.PointsEarned)
                })
                .OrderByDescending(x => x.UniqueSolved)
                .ThenByDescending(x => x.Points)
                .ThenByDescending(x => x.FirstTry)
                .ThenBy(x => x.UserId)
                .Take(20)
                .ToListAsync(cancellationToken);

            var daily = await _db.ProblemAttempts.AsNoTracking()
                .Where(a => a.User.Role == "Student" &&
                    a.Problem.StageId == stageId && a.SubmittedAt >= cutoffUtc)
                .GroupBy(a => a.SubmittedAt.Date)
                .Select(g => new
                {
                    Date = g.Key,
                    Attempts = g.Count(),
                    Correct = g.Count(a => a.IsCorrect),
                    Students = g.Select(a => a.UserId).Distinct().Count()
                })
                .ToListAsync(cancellationToken);
            var dailyByDate = daily.ToDictionary(x => x.Date.Date);

            var response = new AdminStageDetailDto
            {
                Summary = summary,
                WindowDays = days,
                Categories = categories.Select(c =>
                {
                    problemCounts.TryGetValue(c.Id, out var problems);
                    solvedCounts.TryGetValue(c.Id, out var solved);
                    activityByCategory.TryGetValue(c.Id, out var activity);
                    return new AdminCategoryAnalyticsDto
                    {
                        CategoryId = c.Id, NameAr = c.NameAr, NameEn = c.NameEn,
                        Problems = problems, UniqueSolved = solved,
                        AttemptsInWindow = activity?.Attempts ?? 0,
                        CorrectAttemptsInWindow = activity?.Correct ?? 0
                    };
                }).ToList(),
                TopLearners = top.Select((x, index) => new AdminLearnerAnalyticsDto
                {
                    Rank = index + 1, UserId = x.UserId, FullName = x.FullName,
                    UniqueSolved = x.UniqueSolved, FirstTryCorrect = x.FirstTry,
                    AwardedPoints = x.Points
                }).ToList(),
                DailyActivity = Enumerable.Range(0, days).Select(offset =>
                {
                    var date = cutoffUtc.AddDays(offset);
                    dailyByDate.TryGetValue(date.Date, out var row);
                    return new AdminActivityDayDto
                    {
                        DayUtc = date,
                        Attempts = row?.Attempts ?? 0,
                        CorrectAttempts = row?.Correct ?? 0,
                        UniqueStudents = row?.Students ?? 0
                    };
                }).ToList()
            };
            return Ok(Success(response));
        }

        // Narrow the actual server-side catalog, answer history and rankings.
        // A question shared between two grades is not a shared practice attempt.
        private async Task<ActionResult<ApiResponse<AdminStageDetailDto>>> ScopedDetails(
            AdminStageAnalyticsDto summary,int days,int? trackId,int? categoryId,DateTime cutoff,CancellationToken ct)
        {
            var stageId=summary.StageId;
            var tracks=HttpContext.RequestServices.GetRequiredService<LearningTrackService>();
            if(trackId.HasValue&&!await _db.LearningTracks.AsNoTracking().AnyAsync(t=>t.Id==trackId&&t.StageId==stageId,ct))
                return BadRequest(Error<AdminStageDetailDto>("TrackStageMismatch",400));
            var catalog=_db.Problems.AsNoTracking().Where(p=>p.StageId==stageId&&p.Category.StageId==stageId);
            if(trackId.HasValue)
            {
                var valid=tracks.ValidProblems(trackId.Value);
                catalog=catalog.Where(p=>valid.Any(v=>v.Id==p.Id));
            }
            var categoryQuery=_db.Categories.AsNoTracking().Where(c=>c.StageId==stageId&&
                (!trackId.HasValue||_db.LearningTrackCategories.Any(l=>l.TrackId==trackId&&l.CategoryId==c.Id)));
            if(categoryId.HasValue&&!await categoryQuery.AnyAsync(c=>c.Id==categoryId,ct))
                return BadRequest(Error<AdminStageDetailDto>("CategoryScopeMismatch",400));
            if(categoryId.HasValue)
            {
                catalog=catalog.Where(p=>p.CategoryId==categoryId);
                categoryQuery=categoryQuery.Where(c=>c.Id==categoryId);
            }
            var categories=await categoryQuery.OrderBy(c=>c.Order).ThenBy(c=>c.Id)
                .Select(c=>new{c.Id,c.NameAr,c.NameEn}).ToListAsync(ct);
            var counts=await catalog.GroupBy(p=>p.CategoryId).Select(g=>new{Id=g.Key,Count=g.Count()}).ToDictionaryAsync(x=>x.Id,x=>x.Count,ct);
            var ordinary=_db.ProblemAttempts.AsNoTracking()
                .Where(a=>a.User.Role=="Student"&&catalog.Any(p=>p.Id==a.ProblemId)&&
                    (!trackId.HasValue||a.PracticeScopeId==trackId))
                .Select(a=>new{a.UserId,a.ProblemId,CategoryId=a.Problem.CategoryId,a.IsCorrect,
                    First=a.IsOfficial&&a.AttemptNumber==1&&a.IsCorrect&&!a.UsedHint,At=a.SubmittedAt});
            var guided=from a in _db.LearningSessionAttempts.AsNoTracking()
                       join session in _db.LearningSessions.AsNoTracking() on a.SessionId equals session.Id
                       join user in _db.Users.AsNoTracking() on session.UserId equals user.Id
                       join problem in catalog on a.ProblemId equals problem.Id
                       where user.Role=="Student"&&session.StageId==stageId&&(!trackId.HasValue||session.TrackId==trackId)
                       select new{session.UserId,a.ProblemId,problem.CategoryId,a.IsCorrect,
                           First=a.AttemptNumber==1&&a.IsCorrect&&!a.UsedHint,At=a.SubmittedAtUtc};
            var config=HttpContext.RequestServices.GetRequiredService<IConfiguration>();
            var lifetime=config.GetValue<bool>("LearningSessions:Enabled");
            var answers=lifetime?ordinary.Concat(guided):ordinary;
            var window=answers.Where(a=>a.At>=cutoff);
            var categoryActivity=await window.GroupBy(a=>a.CategoryId).Select(g=>new{Id=g.Key,Attempts=g.Count(),Correct=g.Count(a=>a.IsCorrect)}).ToDictionaryAsync(x=>x.Id,ct);
            var daily=await window.GroupBy(a=>a.At.Date).Select(g=>new{Date=g.Key,Attempts=g.Count(),Correct=g.Count(a=>a.IsCorrect),Students=g.Select(a=>a.UserId).Distinct().Count()}).ToDictionaryAsync(x=>x.Date,ct);
            var progress=(trackId.HasValue?TrackPractice.For(_db,trackId.Value):_db.UserProgresses).AsNoTracking()
                .Where(p=>p.User.Role=="Student"&&p.IsSolved&&catalog.Any(q=>q.Id==p.ProblemId))
                .Select(p=>new{p.UserId,p.ProblemId,CategoryId=p.Problem.CategoryId});
            var solved=progress;
            if(lifetime)
                solved=solved.Union(answers.Where(a=>a.IsCorrect).Select(a=>new{a.UserId,a.ProblemId,a.CategoryId}));
            var solvedCounts=await solved.GroupBy(p=>p.CategoryId).Select(g=>new{Id=g.Key,Count=g.Count()}).ToDictionaryAsync(x=>x.Id,x=>x.Count,ct);
            var first=answers.Where(a=>a.First).Select(a=>new{a.UserId,a.ProblemId}).Distinct();
            var firstCounts=await first.GroupBy(a=>a.UserId).Select(g=>new{UserId=g.Key,Count=g.Count()}).ToDictionaryAsync(x=>x.UserId,x=>x.Count,ct);
            // Use actual immutable awards, never the current editable point value.
            var points=await _db.ProblemAttempts.AsNoTracking().Where(a=>a.User.Role=="Student"&&
                catalog.Any(p=>p.Id==a.ProblemId)&&(!trackId.HasValue||a.PracticeScopeId==trackId))
                .GroupBy(a=>a.UserId).Select(g=>new{UserId=g.Key,Points=g.Sum(a=>a.PointsEarned)}).ToDictionaryAsync(x=>x.UserId,x=>x.Points,ct);
            if(lifetime)
                points=await _db.PermanentProblemAchievements.AsNoTracking()
                    .Where(a=>catalog.Any(p=>p.Id==a.ProblemId)&&answers.Any(q=>q.UserId==a.UserId&&q.ProblemId==a.ProblemId&&q.IsCorrect&&q.At==a.EarnedAtUtc))
                    .GroupBy(a=>a.UserId).Select(g=>new{UserId=g.Key,Points=g.Sum(a=>a.Points)}).ToDictionaryAsync(x=>x.UserId,x=>x.Points,ct);
            var solvedByUser=await solved.GroupBy(p=>p.UserId).Select(g=>new{UserId=g.Key,Count=g.Count()}).ToListAsync(ct);
            var ranked=solvedByUser.OrderByDescending(x=>x.Count).ThenByDescending(x=>points.GetValueOrDefault(x.UserId))
                .ThenByDescending(x=>firstCounts.GetValueOrDefault(x.UserId)).ThenBy(x=>x.UserId).Take(20).ToArray();
            var ids=ranked.Select(x=>x.UserId).ToArray();
            var names=await _db.Users.AsNoTracking().Where(u=>ids.Contains(u.Id)).ToDictionaryAsync(u=>u.Id,u=>u.FullName,ct);
            var rows=categories.Select(c=>{
                var activity=categoryActivity.GetValueOrDefault(c.Id);
                return new AdminCategoryAnalyticsDto{CategoryId=c.Id,NameAr=c.NameAr,NameEn=c.NameEn,
                    Problems=counts.GetValueOrDefault(c.Id),UniqueSolved=solvedCounts.GetValueOrDefault(c.Id),
                    AttemptsInWindow=activity?.Attempts??0,CorrectAttemptsInWindow=activity?.Correct??0};
            }).ToList();
            summary.Categories=rows.Count; summary.Problems=rows.Sum(c=>c.Problems);
            summary.UniqueSolved=rows.Sum(c=>c.UniqueSolved);
            summary.AttemptsInWindow=rows.Sum(c=>c.AttemptsInWindow); summary.CorrectAttemptsInWindow=rows.Sum(c=>c.CorrectAttemptsInWindow);
            summary.ActiveStudentsInWindow=await window.Select(a=>a.UserId).Distinct().CountAsync(ct);
            summary.SelectedStudents=await _db.Users.AsNoTracking().CountAsync(u=>u.Role=="Student"&&u.CurrentStageId==stageId&&(!trackId.HasValue||u.CurrentTrackId==trackId),ct);
            summary.CorrectRatePercent=Percent(summary.CorrectAttemptsInWindow,summary.AttemptsInWindow);
            return Ok(Success(new AdminStageDetailDto{Summary=summary,WindowDays=days,TrackId=trackId,CategoryId=categoryId,Categories=rows,
                TopLearners=ranked.Select((x,i)=>new AdminLearnerAnalyticsDto{Rank=i+1,UserId=x.UserId,FullName=names.GetValueOrDefault(x.UserId)??"",
                    UniqueSolved=x.Count,FirstTryCorrect=firstCounts.GetValueOrDefault(x.UserId),AwardedPoints=points.GetValueOrDefault(x.UserId)}).ToList(),
                DailyActivity=Enumerable.Range(0,days).Select(offset=>{
                    var date=cutoff.AddDays(offset);var row=daily.GetValueOrDefault(date);
                    return new AdminActivityDayDto{DayUtc=date,Attempts=row?.Attempts??0,CorrectAttempts=row?.Correct??0,UniqueStudents=row?.Students??0};
                }).ToList()}));
        }

        private async Task<List<AdminStageAnalyticsDto>> BuildStageSummaries(
            DateTime cutoffUtc, CancellationToken cancellationToken)
        {
            var stages = await _db.EducationalStages.AsNoTracking()
                .OrderBy(s => s.Order)
                .Select(s => new { s.Id, s.NameAr, s.NameEn })
                .ToListAsync(cancellationToken);
            var categoryCounts = await _db.Categories.AsNoTracking()
                .GroupBy(c => c.StageId)
                .Select(g => new { Stage = g.Key, Count = g.Count() })
                .ToDictionaryAsync(x => x.Stage, x => x.Count, cancellationToken);
            var problemCounts = await _db.Problems.AsNoTracking()
                .GroupBy(p => p.StageId)
                .Select(g => new { Stage = g.Key, Count = g.Count() })
                .ToDictionaryAsync(x => x.Stage, x => x.Count, cancellationToken);
            var selectedCounts = await _db.Users.AsNoTracking()
                .Where(u => u.Role == "Student" && u.CurrentStageId.HasValue)
                .GroupBy(u => u.CurrentStageId!.Value)
                .Select(g => new { Stage = g.Key, Count = g.Count() })
                .ToDictionaryAsync(x => x.Stage, x => x.Count, cancellationToken);
            var solvedCounts = await _db.UserProgresses.AsNoTracking()
                .Where(p => p.IsSolved && p.User.Role == "Student")
                .GroupBy(p => p.Problem.StageId)
                .Select(g => new { Stage = g.Key, Count = g.Count() })
                .ToDictionaryAsync(x => x.Stage, x => x.Count, cancellationToken);
            var activity = await _db.ProblemAttempts.AsNoTracking()
                .Where(a => a.User.Role == "Student" && a.SubmittedAt >= cutoffUtc)
                .GroupBy(a => a.Problem.StageId)
                .Select(g => new
                {
                    Stage = g.Key,
                    Attempts = g.Count(),
                    Correct = g.Count(a => a.IsCorrect),
                    ActiveStudents = g.Select(a => a.UserId).Distinct().Count()
                })
                .ToListAsync(cancellationToken);
            var activityByStage = activity.ToDictionary(x => x.Stage);
            return stages.Select(s =>
            {
                categoryCounts.TryGetValue(s.Id, out var categories);
                problemCounts.TryGetValue(s.Id, out var problems);
                selectedCounts.TryGetValue(s.Id, out var selected);
                solvedCounts.TryGetValue(s.Id, out var solved);
                activityByStage.TryGetValue(s.Id, out var active);
                return new AdminStageAnalyticsDto
                {
                    StageId = s.Id, NameAr = s.NameAr, NameEn = s.NameEn,
                    Categories = categories, Problems = problems,
                    SelectedStudents = selected, UniqueSolved = solved,
                    ActiveStudentsInWindow = active?.ActiveStudents ?? 0,
                    AttemptsInWindow = active?.Attempts ?? 0,
                    CorrectAttemptsInWindow = active?.Correct ?? 0,
                    CorrectRatePercent = Percent(active?.Correct ?? 0, active?.Attempts ?? 0)
                };
            }).ToList();
        }

        private static DateTime Cutoff(int days) =>
            DateTime.UtcNow.Date.AddDays(1 - days);

        private static double Percent(int correct, int total) =>
            total <= 0 ? 0 : Math.Round(100.0 * correct / total, 1);

        private ApiResponse<T> Success<T>(T value) =>
            LanguageHelper.SuccessResponse(
                value, "Success", LanguageHelper.GetLanguageFromRequest(Request));

        private ApiResponse<T> Error<T>(string messageKey, int code) =>
            LanguageHelper.ErrorResponse<T>(
                messageKey, LanguageHelper.GetLanguageFromRequest(Request), code);
    }
}
