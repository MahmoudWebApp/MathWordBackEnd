using System.Net.Mail;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

public sealed class EmailVerificationService(AppDbContext db,IConfiguration config,BrevoEmailTransport transport)
{
    public enum RequestResult { Queued, AlreadyVerified, NotAvailable, Cooldown, SessionChanged }
    private readonly RecoveryTokenCodec codec=new(config);
    public bool Enabled=>config.GetValue<bool>("MathWorldEmail:VerificationEnabled")&&codec.IsConfigured&&transport.IsConfigured;
    private bool WorkerEnabled=>config.GetValue<bool>("MathWorldEmail:OutboxEnabled");
    private bool CanIssue=>Enabled&&(WorkerEnabled||(transport.IsTestMode&&config.GetValue<bool>("MathWorldEmail:AllowOfflineVerificationTestQueue")));
    public bool Available(AppUser u)=>Enabled&&WorkerEnabled&&transport.AllowsRecipient(u.Email)&&!OptionalEmailPolicy.HasVerifiedAddress(u);
    public async Task<RequestResult> RequestAsync(int userId,int version,string locale,CancellationToken ct)
    {
        if(!CanIssue)return RequestResult.NotAvailable;
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        // Same account row lock as password recovery; verification never
        // changes password or grants a login or a new authentication role.
        var locked=await db.Users.Where(x=>x.Id==userId&&x.IsActive&&x.Role=="Student"&&x.TokenVersion==version)
            .ExecuteUpdateAsync(s=>s.SetProperty(x=>x.TokenVersion,x=>x.TokenVersion),ct);
        if(locked!=1)return RequestResult.SessionChanged;
        var u=await db.Users.AsNoTracking().SingleAsync(x=>x.Id==userId,ct);
        if(OptionalEmailPolicy.HasVerifiedAddress(u))return RequestResult.AlreadyVerified;
        if(!MailAddress.TryCreate(u.Email,out var address)||address.Address!=u.Email||!transport.AllowsRecipient(u.Email))
            return RequestResult.NotAvailable;
        var now=DateTime.UtcNow;
        if(await db.EmailVerificationGrants.AnyAsync(x=>x.UserId==userId&&x.CreatedAtUtc>now.AddMinutes(-2),ct))
            return RequestResult.Cooldown;
        await db.Database.ExecuteSqlRawAsync("SELECT pg_advisory_xact_lock(7240162029)",ct);
        var cap=Math.Clamp(config.GetValue("MathWorldEmail:VerificationDailyLimit",30),1,60);
        if(await db.EmailVerificationGrants.CountAsync(x=>x.CreatedAtUtc>=now.Date,ct)>=cap)
            return RequestResult.Cooldown;
        await db.EmailVerificationGrants.Where(x=>x.UserId==userId&&x.ConsumedAtUtc==null)
            .ExecuteUpdateAsync(s=>s.SetProperty(x=>x.ConsumedAtUtc,now),ct);
        var id=Guid.NewGuid();
        var grant=new EmailVerificationGrant{Id=id,UserId=userId,Email=u.Email,TokenVersion=version,
            TokenHash=RecoveryTokenCodec.Hash(codec.DeriveEmailVerification(id))!,CreatedAtUtc=now,ExpiresAtUtc=now.AddMinutes(20)};
        db.EmailVerificationGrants.Add(grant);
        // The matching ID is a delivery correlation, never a bearer token.
        db.EmailOutbox.Add(new EmailOutboxItem{Id=id,UserId=userId,Recipient=u.Email,TemplateKey="welcome",
            Locale=locale=="en"?"en":"ar",State="Pending",CreatedAtUtc=now,NextRetryAtUtc=now,ExpiresAtUtc=grant.ExpiresAtUtc});
        await db.SaveChangesAsync(ct);
        await tx.CommitAsync(ct);
        return RequestResult.Queued;
    }

    public async Task<bool> ConfirmAsync(string token,CancellationToken ct)
    {
        var hash=RecoveryTokenCodec.Hash(token);
        if(!Enabled||hash==null)return false;
        var now=DateTime.UtcNow;
        var grant=await db.EmailVerificationGrants.AsNoTracking().SingleOrDefaultAsync(
            x=>x.TokenHash==hash&&x.ConsumedAtUtc==null&&x.ExpiresAtUtc>now,ct);
        if(grant==null||RecoveryTokenCodec.Hash(codec.DeriveEmailVerification(grant.Id))!=hash||!transport.AllowsRecipient(grant.Email))return false;
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        var changed=await db.Users.Where(x=>x.Id==grant.UserId&&x.Role=="Student"&&x.IsActive&&x.Email==grant.Email&&
                x.TokenVersion==grant.TokenVersion&&x.VerifiedNotificationEmail!=x.Email)
            .ExecuteUpdateAsync(s=>s.SetProperty(x=>x.VerifiedNotificationEmail,grant.Email),ct);
        if(changed!=1)return false;
        now=DateTime.UtcNow;
        var consumed=await db.EmailVerificationGrants.Where(x=>x.Id==grant.Id&&x.ConsumedAtUtc==null&&x.ExpiresAtUtc>now)
            .ExecuteUpdateAsync(s=>s.SetProperty(x=>x.ConsumedAtUtc,now),ct);
        if(consumed!=1)return false;
        db.PlatformActivityEvents.Add(new PlatformActivityEvent{ActorUserId=grant.UserId,ActorRole="Student",
            Action="EmailVerified",Resource="Authentication",Origin="api",CreatedAtUtc=now});
        await db.SaveChangesAsync(ct);
        await tx.CommitAsync(ct);
        return true;
    }
}
