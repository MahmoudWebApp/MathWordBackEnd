using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Stage-scoped rankings based on unique solved questions. A learner who
    /// selected the stage appears even before completing their first problem.
    /// Names of other learners are never exposed to student clients.
    /// </summary>
    [ApiController]
    [Route("api")]
    public sealed class LeaderboardController : ControllerBase
    {
        private readonly AppDbContext _db;
        public LeaderboardController(AppDbContext db) => _db = db;

        [Authorize(Roles = "Student")]
        [HttpGet("users/leaderboard")]
        public async Task<IActionResult> StudentLeaderboard(
            [FromQuery] int? stageId,
            [FromQuery] string period = "all",
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 20,
            CancellationToken cancellationToken = default)
        {
            if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id))
                return Unauthorized(Error("Unauthorized", 401));
            var user = await _db.Users.AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id && x.Role == "Student",
                    cancellationToken);
            if (user == null)
                return NotFound(Error("UserNotFound", 404));
            var chosenStage = stageId ?? user.CurrentStageId;
            if (!chosenStage.HasValue)
                return Conflict(Error("LearningStageRequired", 409));
            return await Build(chosenStage.Value, period, page, pageSize, id, false,
                cancellationToken);
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("admin/stages/{stageId:int}/leaderboard")]
        public Task<IActionResult> AdminLeaderboard(
            int stageId,
            [FromQuery] string period = "all",
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 20,
            CancellationToken cancellationToken = default)
            => Build(stageId, period, page, pageSize, null, true, cancellationToken);

        private async Task<IActionResult> Build(
            int stageId, string period, int page, int pageSize,
            int? currentUserId, bool admin, CancellationToken cancellationToken)
        {
            period = (period ?? "all").Trim().ToLowerInvariant();
            if (period != "all" && period != "weekly" && period != "monthly")
                return BadRequest(Error("InvalidLeaderboardPeriod", 400));
            if (page < 1 || pageSize < 1 || page > 1000000)
                return BadRequest(Error("InvalidLeaderboardPagination", 400));
            pageSize = Math.Min(pageSize, 50);

            var stage = await _db.EducationalStages.AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == stageId, cancellationToken);
            if (stage == null)
                return NotFound(Error("StageNotFound", 404));

            var today = DateTime.UtcNow.Date;
            DateTime? since = period switch
            {
                "weekly" => today.AddDays(-(((int)today.DayOfWeek + 6) % 7)),
                "monthly" => new DateTime(today.Year, today.Month, 1, 0, 0, 0,
                    DateTimeKind.Utc),
                _ => null
            };

            // A member of this stage must not disappear when they have zero solves.
            // Also include learners with prior solved work if they switched stages.
            var members = _db.Users.AsNoTracking().Where(u => u.Role == "Student" &&
                (u.CurrentStageId == stageId ||
                 _db.UserProgresses.Any(p => p.UserId == u.Id &&
                     p.IsSolved && p.Problem.StageId == stageId)));

            var solved = _db.UserProgresses.AsNoTracking().Where(p =>
                p.IsSolved && p.Problem.StageId == stageId);
            if (since.HasValue)
                solved = solved.Where(p => p.SolvedAt >= since.Value);

            var scores = members.Select(u => new
            {
                UserId = u.Id,
                FullName = u.FullName,
                SolvedProblems = solved.Count(p => p.UserId == u.Id),
                Points = solved.Where(p => p.UserId == u.Id)
                    .Sum(p => (int?)p.Problem.Points) ?? 0,
                FirstTryCorrect = solved.Count(p =>
                    p.UserId == u.Id && p.FirstAttemptCorrect == true)
            });

            var sorted = scores
                .OrderByDescending(x => x.SolvedProblems)
                .ThenByDescending(x => x.Points)
                .ThenByDescending(x => x.FirstTryCorrect)
                .ThenBy(x => x.UserId);

            var total = await scores.CountAsync(cancellationToken);
            var rows = await sorted.Skip((page - 1) * pageSize)
                .Take(pageSize).ToListAsync(cancellationToken);

            int? myRank = null;
            if (currentUserId.HasValue)
            {
                var mine = await scores.FirstOrDefaultAsync(
                    x => x.UserId == currentUserId.Value, cancellationToken);
                if (mine != null)
                {
                    var ahead = await scores.CountAsync(x =>
                        x.SolvedProblems > mine.SolvedProblems ||
                        (x.SolvedProblems == mine.SolvedProblems &&
                            x.Points > mine.Points) ||
                        (x.SolvedProblems == mine.SolvedProblems &&
                            x.Points == mine.Points &&
                            x.FirstTryCorrect > mine.FirstTryCorrect) ||
                        (x.SolvedProblems == mine.SolvedProblems &&
                            x.Points == mine.Points &&
                            x.FirstTryCorrect == mine.FirstTryCorrect &&
                            x.UserId < mine.UserId), cancellationToken);
                    myRank = ahead + 1;
                }
            }

            var arabic = LanguageHelper.GetLanguageFromRequest(Request) != "en";
            var result = new LeaderboardDto
            {
                StageId = stage.Id,
                NameAr = stage.NameAr,
                NameEn = stage.NameEn,
                Period = period,
                Page = page,
                PageSize = pageSize,
                TotalLearners = total,
                MyRank = myRank,
                Entries = rows.Select((row, index) =>
                {
                    var rank = (page - 1) * pageSize + index + 1;
                    var self = currentUserId.HasValue && row.UserId == currentUserId.Value;
                    return new LeaderboardEntryDto
                    {
                        Rank = rank,
                        UserId = admin ? row.UserId : null,
                        DisplayName = admin ? row.FullName :
                            self ? (arabic ? "أنت" : "You") :
                            arabic ? $"متعلم #{rank}" : $"Learner #{rank}",
                        SolvedProblems = row.SolvedProblems,
                        Points = row.Points,
                        FirstTryCorrect = row.FirstTryCorrect,
                        IsCurrentUser = self
                    };
                }).ToList()
            };
            return Ok(LanguageHelper.SuccessResponse(result, "Success",
                LanguageHelper.GetLanguageFromRequest(Request)));
        }

        private ApiResponse<object> Error(string key, int status) =>
            LanguageHelper.ErrorResponse<object>(key,
                LanguageHelper.GetLanguageFromRequest(Request), status);
    }
}
