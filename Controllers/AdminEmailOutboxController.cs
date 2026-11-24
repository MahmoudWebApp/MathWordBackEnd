using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[Authorize(Policy = "AdminOnly")]
[Route("api/admin/platform/email-outbox")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class AdminEmailOutboxController(AppDbContext db, IConfiguration config,
    BrevoEmailTransport transport, PasswordRecoveryService recovery) : ControllerBase
{
    [HttpGet]
    public async Task<IActionResult> Status(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),out var id)) return Unauthorized();
        var admin=await db.Users.AsNoTracking().SingleOrDefaultAsync(u=>u.Id==id&&u.IsActive&&u.Role==AccountRolePolicy.LegacyAdmin,ct);
        if(admin is null)return Forbid();
        var cutoff = DateTime.UtcNow.Date.AddDays(-1);
        var recent = await db.EmailOutbox.AsNoTracking().Where(x => x.CreatedAtUtc >= cutoff)
            .GroupBy(x => x.State).Select(g => new { State = g.Key, Count = g.Count() }).ToListAsync(ct);
        var attempts = await db.EmailOutbox.AsNoTracking().Where(x => x.CreatedAtUtc >= cutoff)
            .SumAsync(x => (int?)x.Attempts, ct) ?? 0;
        var items = await db.EmailOutbox.AsNoTracking().OrderByDescending(x => x.CreatedAtUtc).Take(50)
            .Select(x => new { x.Id, x.TemplateKey, x.Locale, x.State, x.Attempts,
                x.CreatedAtUtc, x.NextRetryAtUtc, x.LastErrorCode }).ToListAsync(ct);
        var workerEnabled=config.GetValue<bool>("MathWorldEmail:OutboxEnabled");
        var recoveryRequested=config.GetValue<bool>("MathWorldRecovery:Enabled");
        var recoveryKeyConfigured=new RecoveryTokenCodec(config).IsConfigured;
        var adminVerified=string.Equals(config["MathWorldRecovery:VerifiedAdminEmail"]?.Trim(),admin.Email,StringComparison.OrdinalIgnoreCase);
        var adminAllowed=transport.IsTestMode&&transport.AllowsRecipient(admin.Email);
        var limit=Math.Clamp(config.GetValue("MathWorldEmail:DailyAttemptLimit",100),10,150);
        // These are only local configuration checks; they do not claim
        // provider authentication, sender verification or inbox delivery.
        var missing=new List<string>();
        if(!transport.ProviderEnabled)missing.Add("ProviderDisabled");
        if(!transport.HasApiKey)missing.Add("ApiKeyMissing");
        if(!transport.HasValidSender)missing.Add("SenderMissingOrInvalid");
        if(!transport.HasValidMode)missing.Add("ModeInvalid");
        if(!workerEnabled)missing.Add("WorkerDisabled");
        if(transport.IsTestMode&&!adminAllowed)missing.Add("AdminTestRecipientUnavailable");
        if(!recoveryRequested)missing.Add("RecoveryDisabled");
        if(!recoveryKeyConfigured)missing.Add("RecoveryKeyMissingOrInvalid");
        if(!adminVerified)missing.Add("AdminRecoveryAddressNotVerifiedInConfig");
        // Never expose recipient, message body, provider ID, grant ID or secrets.
        return Ok(new { IsConfigured = transport.IsConfigured, IsTestMode = transport.IsTestMode,
            IsWorkerEnabled = workerEnabled, RecoveryEnabled = recovery.Enabled,
            Readiness = new { Missing = missing, CanQueueAdminTest=transport.IsConfigured&&workerEnabled&&adminAllowed&&attempts<limit*3/4,
                AdminRecoveryConfigured=recovery.Enabled&&workerEnabled&&adminVerified&&transport.AllowsRecipient(admin.Email),
                ProviderConnectionVerified=false, InboxDeliveryVerified=false },
            TestTemplates=EmailTemplateSamples.Keys,
            AttemptLimit = limit,
            ReservedAttempts = attempts, Counts = recent, Items = items });
    }

    public sealed record TestRequest(string Language = "ar",string Template="test");

    [HttpPost("test")]
    public async Task<IActionResult> Test(TestRequest request, CancellationToken ct)
    {
        if (!transport.IsTestMode || !transport.IsConfigured || !config.GetValue<bool>("MathWorldEmail:OutboxEnabled"))
            return StatusCode(503, new { Message = "EmailTestUnavailable" });
        if (request.Language is not ("ar" or "en")||!EmailTemplateSamples.Contains(request.Template)) return BadRequest();
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id)) return Unauthorized();
        var admin = await db.Users.AsNoTracking().SingleOrDefaultAsync(x => x.Id == id &&
            x.IsActive && x.Role == AccountRolePolicy.LegacyAdmin, ct);
        // A test can go only to this admin's own address, which must also be
        // explicitly allowed by the deployment configuration.
        if (admin is null || !transport.AllowsRecipient(admin.Email)) return Forbid();
        var now = DateTime.UtcNow;
        await using var tx = await db.Database.BeginTransactionAsync(ct);
        await db.Database.ExecuteSqlRawAsync("SELECT pg_advisory_xact_lock(7240162028)", ct);
        // Enforce the same reserve as the worker, not merely a disabled UI button.
        await db.Database.ExecuteSqlRawAsync("SELECT pg_advisory_xact_lock(7240162027)", ct);
        var cap=Math.Clamp(config.GetValue("MathWorldEmail:DailyAttemptLimit",100),10,150);
        var used=await db.EmailOutbox.Where(x=>x.CreatedAtUtc>=now.Date.AddDays(-1))
            .SumAsync(x=>(int?)x.Attempts,ct)??0;
        if(used>=cap*3/4)return StatusCode(429,new{Message="EmailTestLimit"});
        if (await db.EmailOutbox.AnyAsync(x => (x.TemplateKey == "test"||x.TemplateKey.StartsWith("test:")) && x.UserId == id &&
            x.CreatedAtUtc > now.AddMinutes(-5), ct) ||
            await db.EmailOutbox.CountAsync(x => (x.TemplateKey == "test"||x.TemplateKey.StartsWith("test:")) && x.CreatedAtUtc >= now.Date, ct) >= 5)
            return StatusCode(429, new { Message = "EmailTestLimit" });
        db.EmailOutbox.Add(new EmailOutboxItem { Id = Guid.NewGuid(), UserId = id,
            Recipient = admin.Email, Locale = request.Language, TemplateKey = "test:"+request.Template, State = "Pending",
            CreatedAtUtc = now, NextRetryAtUtc = now, ExpiresAtUtc = now.AddMinutes(15) });
        await db.SaveChangesAsync(ct);
        await tx.CommitAsync(ct);
        return Accepted(new { Queued = true });
    }
}
