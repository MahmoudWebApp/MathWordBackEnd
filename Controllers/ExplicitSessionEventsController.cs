using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

/// <summary>
/// Explicit user-requested sign-out acknowledgment for audit purposes.
/// JWT logout remains client token removal; this does not revoke already
/// issued stateless tokens and does not detect browser/app process exits.
/// </summary>
[ApiController]
[Authorize]
[Route("api/users/session")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class ExplicitSessionEventsController : ControllerBase
{
    private readonly AppDbContext _db;
    private readonly PlatformActivityAuditWriter _audit;
    public ExplicitSessionEventsController(AppDbContext db, PlatformActivityAuditWriter audit)
    {
        _db = db;
        _audit = audit;
    }

    [SupervisorEndpoint]
    [HttpPost("sign-out")]
    public async Task<IActionResult> SignOut(CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var id) || id <= 0)
            return Unauthorized();
        var user = await _db.Users.AsNoTracking().AnyAsync(u =>
            u.Id == id && u.IsActive && !u.StaffSetupPending &&
            (u.Role == "Admin" || u.Role == "Student" || u.Role == AccountRolePolicy.Supervisor), ct);
        if (!user) return Unauthorized();

        await _audit.TryRecordAsync(id, "ExplicitSignOut", "api", ct);
        // This event reflects a request the authenticated user actually sent.
        // It must not be interpreted as the last activity of an abruptly closed app.
        return NoContent();
    }
}
