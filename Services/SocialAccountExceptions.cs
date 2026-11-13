namespace MathWorldAPI.Services
{
    /// <summary>
    /// The verified social account's email matches an existing MathWorld user,
    /// but the provider identity is not explicitly linked to that user.
    /// </summary>
    public sealed class SocialAccountLinkRequiredException : Exception
    {
        public SocialAccountLinkRequiredException()
            : base("Existing account needs authenticated social provider linking.")
        {
        }
    }

    /// <summary>
    /// A verified provider identity is already assigned, or a user is already
    /// linked to a different ID at the same social provider.
    /// </summary>
    public sealed class SocialAccountConflictException : Exception
    {
        public SocialAccountConflictException()
            : base("Provider identity is already linked; reassignment is forbidden.")
        {
        }
    }
}
