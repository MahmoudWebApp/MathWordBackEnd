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

    // Explicit, read-only supervisor routes. Admin endpoints stay AdminOnly.
    // Always consult current database permissions, not a UI flag or stale claim.
    private async Task<bool> HasPermission(int permission,CancellationToken ct)
    {
        if(!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),out var id))return false;
        var staff=await db.Users.AsNoTracking().Where(x=>x.Id==id&&x.IsActive&&!x.StaffSetupPending&&x.Role==AccountRolePolicy.Supervisor)
            .Select(x=>new{x.StaffPermissions}).SingleOrDefaultAsync(ct);
        return staff is not null&&AccountRolePolicy.HasStaffPermission(staff.StaffPermissions,permission);
    }

    [HttpGet("students")]
    public async Task<IActionResult> Students([FromQuery]int page=1,CancellationToken ct=default)
    {
        if(!await HasPermission(AccountRolePolicy.ViewStudents,ct))return Forbid();
        if(page is <1 or >10000)return BadRequest();
        var q=db.Users.AsNoTracking().Where(x=>x.Role==AccountRolePolicy.Student);
        return Ok(new{Total=await q.CountAsync(ct),Items=await q.OrderBy(x=>x.Id).Skip((page-1)*30).Take(30)
            .Select(x=>new{x.Id,x.FullName,x.Email,x.IsActive,x.CurrentStageId,x.CurrentTrackId,x.CreatedAt,x.LastLoginAt}).ToListAsync(ct)});
    }

    [HttpGet("students/{id:int}/activity")]
    public async Task<IActionResult> StudentActivity(int id,[FromQuery]int page=1,CancellationToken ct=default)
    {
        if(!await HasPermission(AccountRolePolicy.ViewStudentActivity,ct))return Forbid();
        if(page is <1 or >10000)return BadRequest();
        if(!await db.Users.AsNoTracking().AnyAsync(x=>x.Id==id&&x.Role==AccountRolePolicy.Student,ct))return NotFound();
        var q=db.PlatformActivityEvents.AsNoTracking().Where(x=>x.ActorUserId==id&&x.ActorRole==AccountRolePolicy.Student);
        return Ok(new{Total=await q.CountAsync(ct),Items=await q.OrderByDescending(x=>x.CreatedAtUtc).ThenByDescending(x=>x.Id)
            .Skip((page-1)*30).Take(30).Select(x=>new{x.Id,x.Action,x.Resource,x.CreatedAtUtc}).ToListAsync(ct)});
    }

    [HttpGet("reports")]
    public async Task<IActionResult> Reports(CancellationToken ct)
    {
        if(!await HasPermission(AccountRolePolicy.ViewReports,ct))return Forbid();
        var learners=db.Users.AsNoTracking().Where(x=>x.Role==AccountRolePolicy.Student);
        var counts=await learners.GroupBy(x=>x.CurrentStageId).Select(g=>new{StageId=g.Key,Students=g.Count(),ActiveAccounts=g.Count(x=>x.IsActive)}).ToListAsync(ct);
        var attempts=await db.ProblemAttempts.AsNoTracking().Where(x=>x.User.Role==AccountRolePolicy.Student)
            .GroupBy(x=>x.Problem.StageId).Select(g=>new{StageId=g.Key,Attempts=g.Count()}).ToListAsync(ct);
        return Ok(new{Students=counts.Sum(x=>x.Students),ActiveAccounts=counts.Sum(x=>x.ActiveAccounts),Stages=counts,Attempts=attempts});
    }
}
