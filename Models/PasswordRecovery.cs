namespace MathWorldAPI.Models;

// No plaintext reset secret or rendered email body is persisted.
public sealed class PasswordResetGrant
{
    public Guid Id { get; set; }
    public int UserId { get; set; }
    public string TokenHash { get; set; } = "";
    public string Email { get; set; } = "";
    public string Role { get; set; } = "";
    public int TokenVersion { get; set; }
    public DateTime CreatedAtUtc { get; set; }
    public DateTime ExpiresAtUtc { get; set; }
    public DateTime? ConsumedAtUtc { get; set; }
}

public sealed class EmailOutboxItem
{
    public Guid Id { get; set; }
    public int UserId { get; set; }
    public Guid? ResetGrantId { get; set; }
    public string Recipient { get; set; } = "";
    public string TemplateKey { get; set; } = "";
    public string Locale { get; set; } = "";
    public string State { get; set; } = "";
    public int Attempts { get; set; }
    public DateTime CreatedAtUtc { get; set; }
    public DateTime ExpiresAtUtc { get; set; }
    public DateTime NextRetryAtUtc { get; set; }
    public Guid? LeaseId { get; set; }
    public string? ProviderMessageId { get; set; }
    public string? LastErrorCode { get; set; }
}
