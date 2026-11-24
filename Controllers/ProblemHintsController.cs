using System.Security.Claims;
using System.Text.Json;
using MathWorldAPI.Data;
using MathWorldAPI.Helpers;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.EntityFrameworkCore;
namespace MathWorldAPI.Controllers;

[ApiController]
[Route("api/problems/{problemId:int}/hints")]
[Authorize(Roles="Student")]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
public sealed class ProblemHintsController(AppDbContext db,ProblemCategoryAccessService access,LearningTrackService tracks):ControllerBase
{
    public sealed record HintRequest(int Level);
    [HttpGet]
    public Task<IActionResult> Status(int problemId,CancellationToken ct)=>Handle(problemId,null,ct);
    [HttpPost]
    [EnableRateLimiting("solution-preview")]
    public Task<IActionResult> Reveal(int problemId,HintRequest request,CancellationToken ct)=>Handle(problemId,request.Level,ct);

    private async Task<IActionResult> Handle(int problemId,int? level,CancellationToken ct)
    {
        if(!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),out var id))return Unauthorized();
        if(level.HasValue&&level.Value is not (1 or 2))return BadRequest(new{Message="InvalidHintLevel"});
        await using var tx=await db.Database.BeginTransactionAsync(ct);
        // Same lock order as answering and reset; the next hint cannot race a correct solve.
        await ProblemTransactionLocks.LockQuestionForAnswerAsync(db,problemId,ct);
        await db.Database.SqlQuery<int>($"SELECT 1 AS \"Value\" FROM pg_advisory_xact_lock({-987654320}, {id})").SingleAsync(ct);
        await ProblemTransactionLocks.LockStudentAttemptAsync(db,id,problemId,ct);
        var user=await db.Users.AsNoTracking().SingleOrDefaultAsync(u=>u.Id==id&&u.IsActive&&u.Role=="Student",ct);
        if(user is null)return Unauthorized();
        if(!PremiumEntitlement.IsActive(user))return StatusCode(403,new{Message="PremiumRequired"});
        var problem=await db.Problems.AsNoTracking().SingleOrDefaultAsync(p=>p.Id==problemId,ct);
        if(problem is null)return NotFound();
        if(!await access.CanReadProblemAsync(User,problem.StageId,problem.CategoryId,ct)||
            !await tracks.CanPracticeAsync(User,problemId,ct))return StatusCode(403,new{Message="ProblemLocked"});
        var progress=await db.UserProgresses.SingleOrDefaultAsync(p=>p.UserId==id&&p.ProblemId==problemId,ct);
        if(progress?.IsSolved==true)return Conflict(new{Message="AlreadySolved"});
        BilingualText[]? hints=null;
        if(problem.EditorialDetailsJson is not null)
        {
            using var json=JsonDocument.Parse(problem.EditorialDetailsJson);
            if(json.RootElement.TryGetProperty("Hints",out var value))
                hints=value.Deserialize<BilingualText[]>();
        }
        if(hints is null||hints.Length!=2||hints.Any(h=>!WizardProblemContract.Pair(h,1000)))
            return Ok(new{ProblemId=problemId,Available=false,RevealedCount=0,Hints=Array.Empty<object>()});
        var revealed=Math.Clamp(progress?.HintsRevealed??0,0,2);
        if(level.HasValue)
        {
            if(level.Value>revealed+1)return Conflict(new{Message="RevealPreviousHintFirst"});
            if(level.Value>revealed)
            {
                if(progress is null){progress=new UserProgress{UserId=id,ProblemId=problemId};db.UserProgresses.Add(progress);}
                progress.HintsRevealed=level.Value;revealed=level.Value;
                db.PlatformActivityEvents.Add(new PlatformActivityEvent{ActorUserId=id,ActorRole="Student",
                    Action="ProblemHint"+revealed,Resource="Problem",ResourceId=problemId.ToString(),
                    Origin="api",CreatedAtUtc=DateTime.UtcNow});
                await db.SaveChangesAsync(ct);
            }
        }
        await tx.CommitAsync(ct);
        var ar=LanguageHelper.GetLanguageFromRequest(Request)!="en";
        return Ok(new{ProblemId=problemId,Available=true,RevealedCount=revealed,
            Hints=hints.Take(revealed).Select((h,i)=>new{Level=i+1,Text=ar?h.Ar:h.En}).ToArray()});
    }
}
