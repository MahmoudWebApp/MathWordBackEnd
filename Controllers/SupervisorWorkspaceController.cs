using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[Route("api/supervisor")]
[Authorize(Roles=AccountRolePolicy.Supervisor)]
[SupervisorEndpoint]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
public sealed class SupervisorWorkspaceController(AppDbContext db) : ControllerBase
{
    [HttpGet("permissions")]
    public async Task<IActionResult> Permissions(CancellationToken ct)
    {
        if(!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),out var id)) return Unauthorized();
        var data=await db.Users.AsNoTracking().Where(x=>x.Id==id && x.IsActive && !x.StaffSetupPending && x.Role==AccountRolePolicy.Supervisor)
            .Select(x=>new {x.Id,x.FullName,Permissions=x.StaffPermissions}).SingleOrDefaultAsync(ct);
        return data is null ? Unauthorized() : Ok(data);
    }
}
