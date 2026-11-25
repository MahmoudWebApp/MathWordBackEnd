using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace MathWorldAPI.Controllers;

[ApiController]
[Authorize(Roles="Student")]
[Route("api/users/onboarding")]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
public sealed class StudentOnboardingController(AppDbContext db,IConfiguration config,LearningTrackService tracks):ControllerBase
{
    [HttpGet]
    public async Task<IActionResult> Get(CancellationToken ct)
    {
        if(!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),out var id))return Unauthorized();
        return Ok(await StudentOnboardingPolicy.ReadAsync(id,db,config,tracks,ct));
    }
}
