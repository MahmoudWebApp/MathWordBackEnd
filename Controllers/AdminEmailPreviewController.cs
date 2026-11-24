using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace MathWorldAPI.Controllers;

[ApiController]
[Authorize(Policy = "AdminOnly")]
[Route("api/admin/platform/email-preview")]
[ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
public sealed class AdminEmailPreviewController(PlatformBrandService brand) : ControllerBase
{
    // Fixed non-sensitive preview samples only; no sending and no live reset token.
    [HttpGet]
    public async Task<IActionResult> Preview([FromQuery] string template = "password-changed",
        [FromQuery] string language = "ar", CancellationToken ct = default)
    {
        if (language is not ("ar" or "en")) return BadRequest();
        if(!EmailTemplateSamples.Contains(template))return BadRequest(new{Message="UnknownEmailTemplate"});
        var settings=await brand.ReadAsync(false,ct);
        return Ok(EmailTemplateSamples.Render(settings,language,template,false));
    }
}
