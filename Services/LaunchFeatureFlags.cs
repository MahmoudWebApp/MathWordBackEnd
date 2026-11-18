using Microsoft.Extensions.Configuration;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Launch-safe switches. Missing settings are OFF. Entitlements are always
    /// enforced server-side regardless of what the UI chooses to display.
    /// Configure via Features__* environment variables on the server.
    /// </summary>
    public sealed class LaunchFeatureFlags
    {
        private readonly IConfiguration _configuration;

        public LaunchFeatureFlags(IConfiguration configuration) =>
            _configuration = configuration;

        public bool PaidCheckoutEnabled =>
            _configuration.GetValue<bool>("Features:PaidCheckoutEnabled", false);

        public bool CouponRedemptionEnabled =>
            _configuration.GetValue<bool>("Features:CouponRedemptionEnabled", false);

        public bool TutorMarketplaceEnabled =>
            _configuration.GetValue<bool>("Features:TutorMarketplaceEnabled", false);

        public bool AdsEnabled =>
            _configuration.GetValue<bool>("Features:AdsEnabled", false);

        public bool GeometryInteractiveEnabled =>
            _configuration.GetValue<bool>("Features:GeometryInteractiveEnabled", false);

        public bool NotificationsEnabled =>
            _configuration.GetValue<bool>("Features:NotificationsEnabled", false);
    }
}
