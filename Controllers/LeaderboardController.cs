using System;
using System.Linq;
using System.Security.Claims;
using System.Threading;
using System.Threading.Tasks;
using MathWorldAPI.Data;
using MathWorldAPI.DTOs;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Stage-specific rankings based exclusively on immutable solve awards.
    /// Public learner output is anonymized. Admin names require the Admin role.
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
            if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId))
                return Unauthorized(Error("Unauthorized", 401));

            var user = await _db.Users.AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
            if (user == null)
                return NotFound(Error("UserNotFound", 404));
            var requestedStageId = stageId ?? user.CurrentStageId;
            if (requestedStageId == null)
                return Conflict(Error("LearningStageRequired", 409));
            return await Build(requestedStageId.Value, period, page, pageSize, userId,
                includeIdentities: false, cancellationToken);
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("admin/stages/{stageId:int}/leaderboard")]
        public Task<IActionResult> AdminLeaderboard(
            [FromRoute] int stageId,
            [FromQuery] string period = "all",
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 20,
            CancellationToken cancellationToken = default)
            => Build(stageId, period, page, pageSize, currentUserId: null,
                includeIdentities: true, cancellationToken);

        private async Task<IActionResult> Build(
            int stageId, string period, int page, int pageSize,
            int? currentUserId, bool includeIdentities, CancellationToken cancellationToken)
        {
            period = period.Trim().ToLowerInvariant();
            if (period != "all" && period != "weekly" && period != "monthly")
                return BadRequest(Error("InvalidLeaderboardPeriod", 400));
            if (page < 1 || pageSize < 1)
                return BadRequest(Error("InvalidLeaderboardPagination", 400));
            pageSize = Math.Min(pageSize, 50);

            var stage = await _db.EducationalStages.AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == stageId, cancellationToken);
            if (stage == null)
                return NotFound(Error("StageNotFound", 404));

            var now = DateTime.UtcNow;
            DateTime? since = period switch
            {
                "weekly" => now.Date.AddDays(-(((int)now.DayOfWeek + 6) % 7)),
                "monthly" => new DateTime(now.Year, now.Month, 1, 0, 0, 0, DateTimeKind.Utc),
                _ => null
            };

            var awards = _db.PointLedgerEntries.AsNoTracking()
                .Where(x => x.StageId == stageId && x.Reason == PointLedgerReasons.SolveCredit);
            if (since.HasValue)
                awards = awards.Where(x => x.AwardedAt >= since.Value);

            // Grouping/ordering is executed in PostgreSQL, not in memory.
            var grouped = awards.GroupBy(x => x.UserId)
                .Select(group => new
                {
                    UserId = group.Key,
                    SolvedProblems = group.Count(),
                    Points = group.Sum(x => x.Points),
                    FirstTryCorrect = group.Count(x => x.FirstTryCorrect)
                });
            var total = await grouped.CountAsync(cancellationToken);
            var rows = await grouped
                .OrderByDescending(x => x.SolvedProblems)
                .ThenByDescending(x => x.Points)
                .ThenByDescending(x => x.FirstTryCorrect)
                .ThenBy(x => x.UserId)
                .Skip((page - 1) * pageSize).Take(pageSize)
                .ToListAsync(cancellationToken);

            int? myRank = null;
            if (currentUserId.HasValue)
            {
                var mine = await grouped.FirstOrDefaultAsync(
                    x => x.UserId == currentUserId.Value, cancellationToken);
                if (mine != null)
                {
                    var ahead = await grouped.CountAsync(x =>
                        x.SolvedProblems > mine.SolvedProblems ||
                        (x.SolvedProblems == mine.SolvedProblems && x.Points > mine.Points) ||
                        (x.SolvedProblems == mine.SolvedProblems && x.Points == mine.Points &&
                            x.FirstTryCorrect > mine.FirstTryCorrect) ||
                        (x.SolvedProblems == mine.SolvedProblems && x.Points == mine.Points &&
                            x.FirstTryCorrect == mine.FirstTryCorrect && x.UserId < mine.UserId),
                        cancellationToken);
                    myRank = ahead + 1;
                }
            }

            var names = includeIdentities
                ? await _db.Users.AsNoTracking()
                    .Where(x => rows.Select(row => row.UserId).Contains(x.Id))
                    .Select(x => new { x.Id, x.FullName })
                    .ToDictionaryAsync(x => x.Id, x => x.FullName, cancellationToken)
                : new System.Collections.Generic.Dictionary<int, string>();
            var isArabic = LanguageHelper.GetLanguageFromRequest(Request) != "en";
            var response = new LeaderboardDto
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
                    var self = row.UserId == currentUserId;
                    return new LeaderboardEntryDto
                    {
                        Rank = rank,
                        UserId = includeIdentities ? row.UserId : null,
                        DisplayName = includeIdentities
                            ? names.GetValueOrDefault(row.UserId, isArabic ? "طالب" : "Learner")
                            : self ? (isArabic ? "أنت" : "You")
                                : isArabic ? $"متعلم #{rank}" : $"Learner #{rank}",
                        SolvedProblems = row.SolvedProblems,
                        Points = row.Points,
                        FirstTryCorrect = row.FirstTryCorrect,
                        IsCurrentUser = self
                    };
                }).ToList()
            };
            return Ok(LanguageHelper.SuccessResponse(
                response, "Success", LanguageHelper.GetLanguageFromRequest(Request)));
        }

        private ApiResponse<object> Error(string key, int status) =>
            LanguageHelper.ErrorResponse<object>(
                key, LanguageHelper.GetLanguageFromRequest(Request), status);
    }
}
