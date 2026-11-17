namespace MathWorldAPI.DTOs
{
    /// <summary>
    /// Admin-only manual Free/Premium entitlement, independent of future billing.
    /// </summary>
    public sealed class ChangeLearnerSubscriptionDto
    {
        public string? SubscriptionType { get; set; }
    }
}
