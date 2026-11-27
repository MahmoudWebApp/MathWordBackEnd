using System.Security.Claims;
using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

// Use the same database-backed state for the UI and the server boundary.
// Flags are off until compatible clients and the published catalog are ready.
public sealed record StudentOnboardingState(bool EmailRequired, bool StageRequired, bool TrackRequired, string NextStep);
public static class StudentOnboardingPolicy
{
    public static string Next(bool emailRequired,bool emailVerified,bool stageRequired,bool stageSelected,bool trackRequired,bool trackSelected)
        => emailRequired&&!emailVerified?"VerifyEmail":stageRequired&&!stageSelected?"SelectStage":trackRequired&&!trackSelected?"SelectTrack":"Complete";

    public static bool Allows(string step,string method,string path)
    {
        path=path.TrimEnd('/').ToLowerInvariant();
        if(method=="GET" && path is "/api/users/onboarding" or "/api/users/profile" or "/api/platform/brand" or "/api/config/features")return true;
        if(method=="POST" && path=="/api/users/session/sign-out")return true;
        if(method=="POST" && path is "/api/auth/email-verification/request" or "/api/auth/email-verification/confirm" or "/api/auth/email-verification/confirm-code")return true;
        if(step=="VerifyEmail")return false;
        if(method=="GET" && (path is "/api/stages" or "/api/users/learning-stage" or "/api/users/learning-track" ||
            System.Text.RegularExpressions.Regex.IsMatch(path,@"^/api/stages/[0-9]+/tracks$")))return true;
        if(method=="PUT" && path=="/api/users/learning-stage")return true;
        if(method=="PUT" && path=="/api/users/learning-track")return true;
        return false;
    }

    public static async Task<StudentOnboardingState> ReadAsync(int id,AppDbContext db,IConfiguration config,LearningTrackService tracks,CancellationToken ct)
    {
        var email=config.GetValue<bool>("StudentOnboarding:RequireVerifiedEmail");
        var track=config.GetValue<bool>("StudentOnboarding:RequireTrack");
        var stage=track||config.GetValue<bool>("StudentOnboarding:RequireStage");
        if(!email&&!stage&&!track)return new(false,false,false,"Complete");
        // Fetch only the fields used by the onboarding policy, not the full user.
        var user=await db.Users.AsNoTracking()
            .Where(u=>u.Id==id&&u.IsActive&&u.Role=="Student")
            .Select(u=>new{u.Email,u.VerifiedNotificationEmail,u.CurrentStageId,u.CurrentTrackId,u.CreatedAt})
            .SingleAsync(ct);
        var verified=!string.IsNullOrWhiteSpace(user.Email)&&
            string.Equals(user.Email,user.VerifiedNotificationEmail,StringComparison.Ordinal);
        // Next() gives email verification priority; the other checks cannot
        // affect the outcome yet. No cross-request cache or bypass of account validation.
        if(email&&!verified)return new(email,stage,track,"VerifyEmail");
        if(!stage)return new(email,stage,track,"Complete");
        var selected=await LegacyLearningStage.EffectiveIdForUserAsync(db,user.CurrentStageId,user.CreatedAt,ct);
        if(!selected.HasValue)return new(email,stage,track,"SelectStage");
        var stages=db.EducationalStages.AsNoTracking().Where(x=>x.Id==selected.Value);
        if(!track||!tracks.Enabled||!user.CurrentTrackId.HasValue)
        {
            var stageValid=await stages.AnyAsync(ct);
            return new(email,stage,track,Next(email,verified,stage,stageValid,track,false));
        }
        // A single round trip checks both the stage and the published, valid
        // track; retain the same catalog predicates used by ActiveAsync.
        var trackId=user.CurrentTrackId.Value;
        var visible=tracks.VisibleTracks();
        var state=await stages.Select(s=>new{
            TrackValid=visible.Any(t=>t.StageId==s.Id&&t.Id==trackId)
        }).SingleOrDefaultAsync(ct);
        return new(email,stage,track,Next(email,verified,stage,state is not null,track,state?.TrackValid==true));
    }
}

public sealed class StudentOnboardingBoundaryMiddleware(RequestDelegate next)
{
    public async Task InvokeAsync(HttpContext context,AppDbContext db,IConfiguration config,LearningTrackService tracks)
    {
        if(context.User.Identity?.IsAuthenticated==true&&context.User.IsInRole("Student")&&context.Request.Path.StartsWithSegments("/api")&&
            int.TryParse(context.User.FindFirstValue(ClaimTypes.NameIdentifier),out var id))
        {
            var state=await StudentOnboardingPolicy.ReadAsync(id,db,config,tracks,context.RequestAborted);
            if(state.NextStep!="Complete"&&!StudentOnboardingPolicy.Allows(state.NextStep,context.Request.Method,context.Request.Path.Value??""))
            {
                context.Response.StatusCode=StatusCodes.Status403Forbidden;
                context.Response.Headers.CacheControl="no-store";
                await context.Response.WriteAsJsonAsync(new{Message="OnboardingRequired",state.NextStep},context.RequestAborted);
                return;
            }
        }
        await next(context);
    }
}
