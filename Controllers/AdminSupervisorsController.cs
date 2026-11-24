using System.ComponentModel.DataAnnotations;
using System.Net.Mail;
using System.Security.Claims;
using System.Security.Cryptography;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[Route("api/admin/supervisors")]
[Authorize(Policy = "AdminOnly")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class AdminSupervisorsController(AppDbContext db, IConfiguration config,
    PasswordRecoveryService recovery, BrevoEmailTransport transport) : ControllerBase
{
    public sealed record CreateRequest([Required, StringLength(150, MinimumLength=2)] string FullName,
        [Required, StringLength(254)] string Email, string Language = "ar");
    public sealed record UpdateRequest(bool IsActive, int Permissions, int Revision);
    public sealed record InviteRequest(string Language = "ar");

    private int AdminId => int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id) ? id : 0;

    [HttpGet]
    public async Task<IActionResult> List([FromQuery] int page = 1, CancellationToken ct = default)
    {
        if (page is < 1 or > 10000) return BadRequest();
        var query = db.Users.AsNoTracking().Where(x => x.Role == AccountRolePolicy.Supervisor);
        return Ok(new { Total = await query.CountAsync(ct), Items = await query.OrderBy(x => x.Id)
            .Skip((page-1)*50).Take(50).Select(x => new { x.Id,x.FullName,x.Email,x.IsActive,
                x.StaffSetupPending, Permissions=x.StaffPermissions, Revision=x.TokenVersion,x.CreatedAt,x.LastLoginAt }).ToListAsync(ct) });
    }

    private void Audit(int targetId, string action) => db.PlatformActivityEvents.Add(new PlatformActivityEvent
    {
        ActorUserId=AdminId, ActorRole=AccountRolePolicy.LegacyAdmin, Action=action, Resource="Supervisor",
        ResourceId=targetId.ToString(), Origin="api", CreatedAtUtc=DateTime.UtcNow
    });

    [HttpPost]
    public async Task<IActionResult> Create(CreateRequest request, CancellationToken ct)
    {
        if (!MailAddress.TryCreate(request.Email.Trim(), out var address) ||
            !string.Equals(address.Address,request.Email.Trim(),StringComparison.OrdinalIgnoreCase) ||
            request.Language is not ("ar" or "en") || request.FullName.Trim().Length<2 ||
            request.FullName.Any(char.IsControl)) return BadRequest();
        var email=address.Address.ToLowerInvariant();
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        if (await db.Users.AnyAsync(x=>x.Email.ToLower()==email,ct)) return Conflict(new {Message="EmailAlreadyInUse"});
        var user=new AppUser { FullName=request.FullName.Trim(),Email=email,
            PasswordHash=BCrypt.Net.BCrypt.HashPassword(Convert.ToHexString(RandomNumberGenerator.GetBytes(32)),12),
            Role=AccountRolePolicy.Supervisor, SubscriptionType="Free", IsActive=true, StaffSetupPending=true,
            StaffPermissions=AccountRolePolicy.DefaultSupervisorPermissions, CreatedAt=DateTime.UtcNow };
        db.Users.Add(user);
        try { await db.SaveChangesAsync(ct); }
        catch (DbUpdateException e) when (e.InnerException is Npgsql.PostgresException { SqlState: "23505" }) { return Conflict(new {Message="EmailAlreadyInUse"}); }
        Audit(user.Id,"SupervisorCreated");
        await db.SaveChangesAsync(ct); await tx.CommitAsync(ct);
        return StatusCode(201,new {user.Id, user.StaffSetupPending, InvitationQueued=false});
    }

    [HttpPut("{id:int}")]
    public async Task<IActionResult> Update(int id, UpdateRequest request, CancellationToken ct)
    {
        if (!AccountRolePolicy.ValidStaffPermissions(request.Permissions) || request.Revision is <0 or int.MaxValue)
            return BadRequest();
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        var changed=await db.Users.Where(x=>x.Id==id && x.Role==AccountRolePolicy.Supervisor && x.TokenVersion==request.Revision)
            .ExecuteUpdateAsync(s=>s.SetProperty(x=>x.IsActive,request.IsActive)
                .SetProperty(x=>x.StaffPermissions,request.Permissions)
                .SetProperty(x=>x.TokenVersion,x=>x.TokenVersion+1),ct);
        if(changed!=1) return Conflict(new {Message="SupervisorChanged"});
        await db.PasswordResetGrants.Where(x=>x.UserId==id && x.ConsumedAtUtc==null)
            .ExecuteUpdateAsync(s=>s.SetProperty(x=>x.ConsumedAtUtc,DateTime.UtcNow),ct);
        Audit(id,"SupervisorPermissionsChanged");
        await db.SaveChangesAsync(ct); await tx.CommitAsync(ct);
        return Ok(new {Updated=true});
    }

    [HttpPost("{id:int}/invite")]
    public async Task<IActionResult> Invite(int id,InviteRequest request,CancellationToken ct)
    {
        if(request.Language is not ("ar" or "en")) return BadRequest();
        if(!recovery.Enabled || !config.GetValue<bool>("MathWorldEmail:OutboxEnabled"))
            return StatusCode(503,new {Message="EmailNotConfigured"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        await db.Users.Where(x=>x.Id==id && x.Role==AccountRolePolicy.Supervisor)
            .ExecuteUpdateAsync(s=>s.SetProperty(x=>x.TokenVersion,x=>x.TokenVersion),ct);
        var user=await db.Users.AsNoTracking().SingleOrDefaultAsync(x=>x.Id==id && x.Role==AccountRolePolicy.Supervisor,ct);
        if(user is null || !user.IsActive || !user.StaffSetupPending) return Conflict(new {Message="SupervisorNotPending"});
        if(!transport.AllowsRecipient(user.Email)) return StatusCode(503,new {Message="RecipientNotAllowed"});
        var now=DateTime.UtcNow;
        await db.Database.ExecuteSqlRawAsync("SELECT pg_advisory_xact_lock(7240162026)",ct);
        if(await db.PasswordResetGrants.AnyAsync(x=>x.UserId==id && x.CreatedAtUtc>now.AddMinutes(-2),ct) ||
            await db.PasswordResetGrants.CountAsync(x=>x.CreatedAtUtc>=now.Date,ct)>=Math.Clamp(config.GetValue("MathWorldRecovery:DailyRequestLimit",60),1,100))
            return StatusCode(429,new {Message="InvitationLimit"});
        await db.PasswordResetGrants.Where(x=>x.UserId==id && x.ConsumedAtUtc==null)
            .ExecuteUpdateAsync(s=>s.SetProperty(x=>x.ConsumedAtUtc,now),ct);
        var grant=new PasswordResetGrant {Id=Guid.NewGuid(),UserId=id,Email=user.Email,Role=user.Role,
            TokenVersion=user.TokenVersion,IsInvitation=true,CreatedAtUtc=now,ExpiresAtUtc=now.AddMinutes(20)};
        grant.TokenHash=RecoveryTokenCodec.Hash(new RecoveryTokenCodec(config).Derive(grant.Id))!;
        db.PasswordResetGrants.Add(grant);
        db.EmailOutbox.Add(new EmailOutboxItem {Id=Guid.NewGuid(),UserId=id,ResetGrantId=grant.Id,
            Recipient=user.Email,TemplateKey="supervisor-invite",Locale=request.Language,State="Pending",
            CreatedAtUtc=now,NextRetryAtUtc=now,ExpiresAtUtc=grant.ExpiresAtUtc});
        Audit(id,"SupervisorInvited");
        await db.SaveChangesAsync(ct); await tx.CommitAsync(ct);
        return Accepted(new {Queued=true});
    }
}
