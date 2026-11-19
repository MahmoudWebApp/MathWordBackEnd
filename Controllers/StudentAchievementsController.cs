using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Student badges derived from actual unique solved questions.
/// No mutable client-side points, no separate claimable badge state.
/// </summary>
[ApiController]
[Route("api/users/achievements")]
[Authorize(Roles = "Student")]
public sealed class StudentAchievementsController : ControllerBase
{
    private readonly AppDbContext _db;
    private static readonly (int Count, string Key, string TitleAr, string TitleEn)[] Milestones =
    [
        (1, "first_step", "الخطوة الأولى", "First Step"),
        (10, "getting_started", "بداية قوية", "Strong Start"),
        (25, "steady_solver", "مثابر الرياضيات", "Steady Solver"),
        (50, "problem_explorer", "مستكشف المسائل", "Problem Explorer"),
        (100, "century_club", "مئة مسألة", "Century Club"),
        (250, "number_master", "خبير الأعداد", "Number Master"),
        (500, "math_champion", "بطل الرياضيات", "Math Champion"),
        (1000, "legend", "أسطورة الرياضيات", "Math Legend")
    ];

    public StudentAchievementsController(AppDbContext db) => _db = db;

    [HttpGet]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public async Task<IActionResult> Get(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId) ||
            userId <= 0)
            return Unauthorized();
        var student = await _db.Users.AsNoTracking().FirstOrDefaultAsync(
            u => u.Id == userId && u.Role == "Student" && u.IsActive, ct);
        if (student == null) return Unauthorized();
        var allBadgesEnabled = PremiumEntitlement.IsActive(student);

        var solved = await _db.UserProgresses.AsNoTracking()
            .CountAsync(p => p.UserId == userId && p.IsSolved, ct);
        // The first two milestones stay earnable for all learners. Advanced
        // badges are visible as an upgrade incentive but never awarded to Free.
        var badges = Milestones.Select((m, index) => new
        {
            m.Key, m.TitleAr, m.TitleEn,
            RequiredSolved = m.Count,
            IsAvailable = index < 2 || allBadgesEnabled,
            Earned = (index < 2 || allBadgesEnabled) && solved >= m.Count,
            CurrentProgress = Math.Min(solved, m.Count)
        }).ToArray();
        var next = badges.FirstOrDefault(m => m.IsAvailable && !m.Earned);
        return Ok(new
        {
            UniqueSolved = solved,
            EarnedCount = badges.Count(b => b.Earned),
            TotalBadges = badges.Length,
            NextMilestone = next?.RequiredSolved,
            Badges = badges
        });
    }
}
