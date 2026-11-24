using System.Security.Claims;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace MathWorldAPI.Controllers;

[ApiController]
public sealed class PlatformBrandController(PlatformBrandService brand) : ControllerBase
{
    [AllowAnonymous]
    [SupervisorEndpoint]
    [HttpGet("api/platform/brand")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public Task<PlatformBrandView> Public(CancellationToken ct) => brand.ReadAsync(false, ct);

    [Authorize(Policy = "AdminOnly")]
    [HttpGet("api/admin/platform/brand")]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
    public Task<PlatformBrandView> Admin(CancellationToken ct) => brand.ReadAsync(true, ct);

    public sealed record UpdateBrandRequest(int Revision, PlatformBrandProfile Profile);

    [Authorize(Policy = "AdminOnly")]
    [HttpPut("api/admin/platform/brand")]
    public async Task<IActionResult> Update([FromBody] UpdateBrandRequest request, CancellationToken ct)
    {
        if (!int.TryParse(User.FindFirstValue(ClaimTypes.NameIdentifier), out var actorId))
            return Unauthorized();
        if (request.Revision < 0 || request.Revision == int.MaxValue ||
            !PlatformBrandService.Validate(request.Profile, brand.OfficialOrigin))
            return BadRequest(new { Message = "InvalidBrandSettings" });
        if (!await brand.UpdateAsync(request.Profile, request.Revision, actorId, ct))
            return Conflict(new { Message = "BrandSettingsChanged" });
        return Ok(await brand.ReadAsync(true, ct));
    }
}
