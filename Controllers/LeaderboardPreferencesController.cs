using System.Security.Claims;
using MathWorldAPI.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
namespace MathWorldAPI.Controllers;
[ApiController]
[Authorize(Roles="Student")]
[Route("api/users/leaderboard-preferences")]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
public sealed class LeaderboardPreferencesController(AppDbContext db):ControllerBase
{
    private int UserId=>int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),out var id)?id:0;
    private IQueryable<MathWorldAPI.Models.AppUser> Mine()=>db.Users.Where(x=>x.Id==UserId&&x.IsActive&&x.Role=="Student");
    public sealed record Preference(bool ShareLeaderboardFullName);
    [HttpGet]
    public async Task<IActionResult> Get(CancellationToken ct)
    {
        var row=await Mine().AsNoTracking().Select(x=>new Preference(x.ShareLeaderboardFullName)).SingleOrDefaultAsync(ct);
        return row==null?Unauthorized():Ok(row);
    }
    [HttpPut]
    public async Task<IActionResult> Put(Preference input,CancellationToken ct)
    {
        var count=await Mine().ExecuteUpdateAsync(s=>s.SetProperty(x=>x.ShareLeaderboardFullName,input.ShareLeaderboardFullName),ct);
        return count==1?Ok(input):Unauthorized();
    }
}
