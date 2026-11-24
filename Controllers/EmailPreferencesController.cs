using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

[ApiController]
[Authorize(Roles="Student")]
[Route("api/users/email-preferences")]
[ResponseCache(NoStore=true,Location=ResponseCacheLocation.None)]
public sealed class EmailPreferencesController(AppDbContext db,IConfiguration config):ControllerBase
{
    private int UserId=>int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier),out var id)?id:0;
    private IQueryable<AppUser> Mine()=>db.Users.Where(x=>x.Id==UserId&&x.IsActive&&x.Role=="Student");
    private object View(AppUser u)=>new {
        EmailVerified=OptionalEmailPolicy.HasVerifiedAddress(u),
        OptionalDeliveryEnabled=config.GetValue<bool>("MathWorldEmail:OptionalEventsEnabled"),
        u.EmailLearningUpdates,u.EmailSubscriptionUpdates,u.EmailImportantAnnouncements,
        Locale=u.EmailNotificationLocale??"ar"
    };
    public sealed record Preferences(bool EmailLearningUpdates,bool EmailSubscriptionUpdates,bool EmailImportantAnnouncements,string Locale);
    [HttpGet]
    public async Task<IActionResult> Get(CancellationToken ct)
    {
        var u=await Mine().AsNoTracking().SingleOrDefaultAsync(ct);
        return u==null?Unauthorized():Ok(View(u));
    }
    [HttpPut]
    public async Task<IActionResult> Put(Preferences input,CancellationToken ct)
    {
        if(input.Locale is not ("ar" or "en"))return BadRequest(new{Message="InvalidEmailLanguage"});
        var u=await Mine().AsNoTracking().SingleOrDefaultAsync(ct);
        if(u==null)return Unauthorized();
        if((input.EmailLearningUpdates||input.EmailSubscriptionUpdates||input.EmailImportantAnnouncements)&&!OptionalEmailPolicy.HasVerifiedAddress(u))
            return Conflict(new{Message="VerifiedEmailRequired"});
        var changed=await Mine().Where(x=>x.Email==u.Email&&x.VerifiedNotificationEmail==u.VerifiedNotificationEmail)
            .ExecuteUpdateAsync(s=>s.SetProperty(x=>x.EmailLearningUpdates,input.EmailLearningUpdates)
                .SetProperty(x=>x.EmailSubscriptionUpdates,input.EmailSubscriptionUpdates)
                .SetProperty(x=>x.EmailImportantAnnouncements,input.EmailImportantAnnouncements)
                .SetProperty(x=>x.EmailNotificationLocale,input.Locale),ct);
        if(changed!=1)return Conflict(new{Message="AccountChanged"});
        return await Get(ct);
    }
}
