using System.Net.Mail;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Controllers;

// Store actual contact submissions in the private administrative inbox.
// This is not an SMTP endpoint and never sends mail to user supplied addresses.
[ApiController]
[Route("api/contact")]
public sealed class ContactController(AppDbContext db,NotificationStreamBroker stream):ControllerBase
{
    public sealed record ContactInput(string Name,string Email,string Category,string? Subject,string Message);
    private static bool Text(string? value,int min,int max)=>value!=null&&value.Trim().Length>=min&&value.Trim().Length<=max;
    [AllowAnonymous]
    [HttpPost]
    [EnableRateLimiting("contact-form")]
    public async Task<IActionResult> Submit(ContactInput input,CancellationToken ct)
    {
        if(!Text(input.Name,2,100)||!Text(input.Email,3,254)||!MailAddress.TryCreate(input.Email.Trim(),out var address)||
            !string.Equals(address.Address,input.Email.Trim(),StringComparison.OrdinalIgnoreCase)||
            input.Name.Any(char.IsControl)||input.Email.Any(char.IsControl)||
            !Text(input.Message,10,2000)||(input.Subject?.Trim().Length??0)>150||
            (input.Subject?.Any(char.IsControl)??false))return BadRequest(new{Message="InvalidContactMessage"});
        var category=input.Category switch{
            "complaint"=>("شكوى أو الإبلاغ عن مشكلة","Complaint or problem report"),
            "suggestion"=>("اقتراح تحسين","Improvement suggestion"),
            "feedback"=>("رأي أو تقييم عام","Feedback"),
            "inquiry"=>("استفسار عام أو اشتراك","General or subscription inquiry"),
            "other"=>("أخرى","Other"),
            _=>("","")};
        if(category.Item1.Length==0)return BadRequest(new{Message="InvalidContactCategory"});
        var admins=await db.Users.AsNoTracking().Where(u=>u.IsActive&&u.Role=="Admin").Select(u=>u.Id).ToArrayAsync(ct);
        if(admins.Length==0)return StatusCode(503,new{Message="SupportUnavailable"});
        var now=DateTime.UtcNow;
        var body=$"{input.Name.Trim()}\n{address.Address}\n{input.Subject?.Trim()}\n\n{input.Message.Trim()}";
        foreach(var admin in admins)db.UserNotifications.Add(new UserNotification{UserId=admin,Type="contact",
            TitleAr="تواصل معنا · "+category.Item1,TitleEn="Contact · "+category.Item2,
            BodyAr=body,BodyEn=body,CreatedAtUtc=now});
        await db.SaveChangesAsync(ct);
        foreach(var admin in admins)stream.Notify(admin);
        return Ok(new{Received=true});
    }
}
