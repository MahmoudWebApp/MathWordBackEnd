using System.Security.Claims;
using System.Security.Cryptography;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

// Remove a test account from login and active directories, while retaining
// its surrogate identity for append-only audit, financial and learning history.
[ApiController]
[Authorize(Policy = "AdminOnly")]
[Route("api/admin")]
public sealed class AdminAccountRemovalController(AppDbContext db) : ControllerBase
{
    [HttpDelete("learners/{id:int}")]
    public Task<IActionResult> RemoveLearner(int id, [FromQuery] bool confirm, CancellationToken ct)
        => Remove(id, AccountRolePolicy.Student, confirm, ct);

    [HttpDelete("supervisors/{id:int}")]
    public Task<IActionResult> RemoveSupervisor(int id, [FromQuery] bool confirm, CancellationToken ct)
        => Remove(id, AccountRolePolicy.Supervisor, confirm, ct);

    private async Task<IActionResult> Remove(int id, string role, bool confirm, CancellationToken ct)
    {
        if (!confirm || id <= 0) return BadRequest(new { Message = "DeletionConfirmationRequired" });
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var actorId) || actorId == id)
            return Forbid();
        await using var tx = await db.Database.BeginTransactionAsync(ct);
        var actor = await db.Users.AsNoTracking().AnyAsync(u => u.Id == actorId && u.IsActive && u.Role == AccountRolePolicy.LegacyAdmin, ct);
        if (!actor) return Forbid();
        var target = await db.Users.FromSqlInterpolated($"SELECT * FROM \"Users\" WHERE \"Id\"={id} FOR UPDATE").SingleOrDefaultAsync(ct);
        if (target is null || target.Role != role) return NotFound();
        if (target.TokenVersion == int.MaxValue) return Conflict(new { Message = "AccountChanged" });
        // Unsupported session role + inactive + rotated credentials: old tokens
        // and password login cannot authenticate. Original email can register again.
        target.IsActive = false;
        target.Role = "Deleted";
        target.TokenVersion++;
        target.FullName = "Deleted account #" + id;
        target.Email = $"deleted-{id}-{Guid.NewGuid():N}@invalid.invalid";
        target.PasswordHash = BCrypt.Net.BCrypt.HashPassword(Convert.ToHexString(RandomNumberGenerator.GetBytes(32)), 12);
        target.ProfilePicture = null;
        target.VerifiedNotificationEmail = null;
        target.EmailLearningUpdates = false;
        target.EmailSubscriptionUpdates = false;
        target.EmailImportantAnnouncements = false;
        target.EmailNotificationLocale = null;
        target.ShareLeaderboardFullName = false;
        target.StaffPermissions = 0;
        target.StaffSetupPending = false;
        target.CurrentStageId = null;
        target.CurrentTrackId = null;
        await db.SocialLogins.Where(x => x.UserId == id).ExecuteDeleteAsync(ct);
        await db.PasswordResetGrants.Where(x => x.UserId == id).ExecuteDeleteAsync(ct);
        await db.EmailVerificationGrants.Where(x => x.UserId == id).ExecuteDeleteAsync(ct);
        // Withdraw pending work owned by a removed supervisor rather than
        // leaving invisible pending requests or publishing without an owner.
        if (role == AccountRolePolicy.Supervisor)
            await db.CurriculumDraftItems.Where(x => x.OwnerUserId == id && x.WizardJson != null &&
                x.EditorialStatus != "Published" && x.EditorialStatus != "Withdrawn")
                .ExecuteUpdateAsync(set => set.SetProperty(x => x.EditorialStatus, "Withdrawn")
                    .SetProperty(x => x.ReviewNote, "Account removed by administrator"), ct);
        db.PlatformActivityEvents.Add(new PlatformActivityEvent { ActorUserId = actorId,
            ActorRole = AccountRolePolicy.LegacyAdmin, Action = "AccountRemoved", Resource = role,
            ResourceId = id.ToString(), Origin = "api", CreatedAtUtc = DateTime.UtcNow });
        await db.SaveChangesAsync(ct);
        await tx.CommitAsync(ct);
        return Ok(new { Removed = true, HistoryRetained = true });
    }
}
