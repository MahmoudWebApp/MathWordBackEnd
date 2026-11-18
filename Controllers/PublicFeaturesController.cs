using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace MathWorldAPI.Controllers
{
    /// <summary>
    /// Public display capabilities, not authorization grants. Every paid action
    /// must separately verify the server-side entitlement and launch switch.
    /// </summary>
    [ApiController]
    [Route("api/config/features")]
    [AllowAnonymous]
    public sealed class PublicFeaturesController : ControllerBase
    {
        private readonly LaunchFeatureFlags _features;

        public PublicFeaturesController(LaunchFeatureFlags features) =>
            _features = features;

        [HttpGet]
        [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]
        public IActionResult Get() => Ok(new
        {
            PaidCheckoutEnabled = _features.PaidCheckoutEnabled,
            CouponRedemptionEnabled = _features.CouponRedemptionEnabled,
            TutorMarketplaceEnabled = _features.TutorMarketplaceEnabled,
            AdsEnabled = _features.AdsEnabled,
            GeometryInteractiveEnabled = _features.GeometryInteractiveEnabled,
            NotificationsEnabled = _features.NotificationsEnabled
        });
    }
}
