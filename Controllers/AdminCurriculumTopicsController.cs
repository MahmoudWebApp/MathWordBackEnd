using System.Security.Claims;
using System.Text.Json;
using MathWorldAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>Admin inventory of editorial proposals and their current publication status.</summary>
[ApiController]
[Authorize(Roles = "Admin")]
[Route("api/admin/curriculum/topics")]
public sealed class AdminCurriculumTopicsController : ControllerBase
{
    private readonly AppDbContext _db;
    public AdminCurriculumTopicsController(AppDbContext db) => _db = db;

    [HttpGet("proposals")]
    public async Task<IActionResult> Proposals(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var adminId)
            || adminId <= 0
            || !await _db.Users.AsNoTracking().AnyAsync(
                user => user.Id == adminId && user.IsActive && user.Role == "Admin", ct))
            return Forbid();

        var rows = await _db.CurriculumTopicProposals.AsNoTracking()
            .OrderBy(x => x.StageId).ThenBy(x => x.SortOrder).ThenBy(x => x.Id)
            .Select(x => new
            {
                x.StableKey,
                x.StageId,
                DomainKey = x.Domain.StableKey,
                x.NameAr,
                x.NameEn,
                x.DescriptionAr,
                x.DescriptionEn,
                x.IconKey,
                x.SortOrder,
                x.EditorialStatus,
                ProposedQuestionCount = _db.CurriculumDraftItems.Count(item => item.TopicProposalId == x.Id),
                PublishedQuestionCount = _db.CurriculumDraftItems.Count(item =>
                    item.TopicProposalId == x.Id && item.EditorialStatus == "Published"),
                DraftQuestionCount = _db.CurriculumDraftItems.Count(item =>
                    item.TopicProposalId == x.Id && item.EditorialStatus != "Published")
            }).ToArrayAsync(ct);

        return Ok(new
        {
            Published = rows.Length > 0 && rows.All(x => x.EditorialStatus == "Published"),
            Total = rows.Length,
            TotalDraftProblems = rows.Sum(x => x.DraftQuestionCount),
            RequiresIndependentReview = true,
            Topics = rows
        });
    }
    [HttpGet("proposals/{stableKey}/questions")]
    public async Task<IActionResult> ReviewQuestions(string stableKey, CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var adminId)
            || adminId <= 0
            || !await _db.Users.AsNoTracking().AnyAsync(
                user => user.Id == adminId && user.IsActive && user.Role == "Admin", ct))
            return Forbid();

        if (string.IsNullOrWhiteSpace(stableKey) || stableKey.Length > 120)
            return BadRequest(new { Message = "InvalidProposalKey" });

        var topic = await _db.CurriculumTopicProposals.AsNoTracking()
            .Where(p => p.StableKey == stableKey)
            .Select(p => new { p.Id, p.StableKey, p.NameAr, p.NameEn, p.EditorialStatus })
            .FirstOrDefaultAsync(ct);
        if (topic is null) return NotFound();

        var questions = await _db.CurriculumDraftItems.AsNoTracking()
            .Where(x => x.TopicProposalId == topic.Id)
            .OrderBy(x => x.DifficultyLevel).ThenBy(x => x.Id)
            .Select(x => new
            {
                x.ContentKey, x.PrimarySkillKey, x.TemplateFamilyKey,
                x.DifficultyLevel, x.PisaProcess,
                x.LearningObjectiveAr, x.LearningObjectiveEn,
                x.QuestionTextAr, x.QuestionTextEn,
                x.DetailedSolutionAr, x.DetailedSolutionEn,
                x.OptionsJson, x.EditorialStatus
            }).ToListAsync(ct);

        return Ok(new
        {
            TopicKey = topic.StableKey,
            TopicNameAr = topic.NameAr,
            TopicNameEn = topic.NameEn,
            TopicStatus = topic.EditorialStatus,
            Total = questions.Count,
            ApprovedForPublication = false,
            Questions = questions.Select(x => new
            {
                x.ContentKey, x.PrimarySkillKey, x.TemplateFamilyKey,
                x.DifficultyLevel, x.PisaProcess,
                x.LearningObjectiveAr, x.LearningObjectiveEn,
                x.QuestionTextAr, x.QuestionTextEn,
                x.DetailedSolutionAr, x.DetailedSolutionEn,
                Options = JsonSerializer.Deserialize<JsonElement>(x.OptionsJson),
                x.EditorialStatus
            })
        });
    }

}
