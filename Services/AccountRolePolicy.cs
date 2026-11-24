namespace MathWorldAPI.Services;

/// <summary>
/// Canonical role values for the existing authentication contract.
/// R1 deliberately does not enable new administrative roles until
/// persisted permissions, endpoint authorization and client compatibility
/// can be released together.
/// </summary>
public static class AccountRolePolicy
{
    public const string LegacyAdmin = "Admin";
    public const string Student = "Student";

    public static bool IsSupportedSessionRole(string? role) =>
        role is LegacyAdmin or Student;

    // Preserve the existing trusted service's role normalization. Public
    // registration must continue to supply Student rather than a client role.
    public static string NormalizeExistingRegistrationRole(string? role) =>
        string.Equals(role, LegacyAdmin, StringComparison.OrdinalIgnoreCase)
            ? LegacyAdmin
            : Student;
}
