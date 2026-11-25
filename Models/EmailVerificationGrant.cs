namespace MathWorldAPI.Models;

// Independent of password recovery: mailbox confirmation is not an auth grant.
public sealed class EmailVerificationGrant
{
    public Guid Id { get; set; }
    public int UserId { get; set; }
    public string Email { get; set; } = "";
    public string TokenHash { get; set; } = "";
    public int FailedCodeAttempts { get; set; }
    public int TokenVersion { get; set; }
    public DateTime CreatedAtUtc { get; set; }
    public DateTime ExpiresAtUtc { get; set; }
    public DateTime? ConsumedAtUtc { get; set; }
}
