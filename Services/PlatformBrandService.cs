using System.Net.Mail;
using System.Text.Json;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

public sealed record PlatformSocialLink
{
    public string Platform { get; init; } = "";
    public string LabelAr { get; init; } = "";
    public string LabelEn { get; init; } = "";
    public string Url { get; init; } = "";
    public bool IsEnabled { get; init; }
    public int DisplayOrder { get; init; }
}

public sealed record PlatformBrandProfile
{
    public string NameAr { get; init; } = "MathWorld";
    public string NameEn { get; init; } = "MathWorld";
    public string? LogoUrl { get; init; }
    public string? SupportEmail { get; init; }
    public string? Phone { get; init; }
    public string? ContactAddressAr { get; init; }
    public string? ContactAddressEn { get; init; }
    public string? DescriptionAr { get; init; }
    public string? DescriptionEn { get; init; }
    public string? HelpUrl { get; init; }
    public string? PrivacyUrl { get; init; }
    public string? TermsUrl { get; init; }
    public IReadOnlyList<PlatformSocialLink> SocialLinks { get; init; } = Array.Empty<PlatformSocialLink>();
}

public sealed record PlatformBrandView(int Revision, string WebsiteUrl, PlatformBrandProfile Profile);

public sealed class PlatformBrandService(AppDbContext db, IConfiguration config)
{
    public const string DefaultOrigin = "https://math-world-frontend.vercel.app";
    private const string LogoPath = "/mathworld-mark-transparent-v3.png";

    public static bool IsSafeHttpsUrl(string? value)
    {
        if (string.IsNullOrWhiteSpace(value) || value.Length > 500 ||
            value.Any(c => char.IsWhiteSpace(c) || char.IsControl(c)) || value.Contains('\\'))
            return false;
        return Uri.TryCreate(value, UriKind.Absolute, out var uri) &&
            uri.IsWellFormedOriginalString() && uri.Scheme == Uri.UriSchemeHttps &&
            uri.HostNameType == UriHostNameType.Dns && uri.Host.Contains('.') &&
            string.IsNullOrEmpty(uri.UserInfo) && uri.IsDefaultPort &&
            !uri.Host.EndsWith(".local", StringComparison.OrdinalIgnoreCase) &&
            !uri.Host.EndsWith(".localhost", StringComparison.OrdinalIgnoreCase);
    }

    public static bool IsSameOrigin(string? value, string origin) =>
        IsSafeHttpsUrl(value) && IsSafeHttpsUrl(origin) &&
        string.Equals(new Uri(value!).GetLeftPart(UriPartial.Authority),
            new Uri(origin).GetLeftPart(UriPartial.Authority), StringComparison.OrdinalIgnoreCase);

    public string OfficialOrigin
    {
        get
        {
            var configured = config["MathWorldBrand:WebsiteUrl"];
            return IsSafeHttpsUrl(configured) ? new Uri(configured!).GetLeftPart(UriPartial.Authority) : DefaultOrigin;
        }
    }

    private PlatformBrandProfile Defaults() => new()
    {
        LogoUrl = OfficialOrigin + LogoPath,
        HelpUrl = OfficialOrigin + "/ar/contact",
        PrivacyUrl = OfficialOrigin + "/ar/privacy"
    };

    private static bool RequiredText(string? value, int limit) =>
        !string.IsNullOrWhiteSpace(value) && value.Length <= limit && !value.Any(char.IsControl);
    private static bool OptionalText(string? value, int limit) =>
        string.IsNullOrEmpty(value) || RequiredText(value, limit);
    private static string? Clean(string? value) => string.IsNullOrWhiteSpace(value) ? null : value.Trim();

    public static bool Validate(PlatformBrandProfile? p, string origin)
    {
        if (p is null || !RequiredText(p.NameAr, 100) || !RequiredText(p.NameEn, 100) ||
            !OptionalText(p.Phone, 60) || !OptionalText(p.ContactAddressAr, 300) ||
            !OptionalText(p.ContactAddressEn, 300) || !OptionalText(p.DescriptionAr, 500) ||
            !OptionalText(p.DescriptionEn, 500))
            return false;
        if (!string.IsNullOrEmpty(p.SupportEmail) &&
            (p.SupportEmail.Length > 254 || !MailAddress.TryCreate(p.SupportEmail, out var address) ||
                !string.Equals(address.Address, p.SupportEmail, StringComparison.Ordinal) ||
                p.SupportEmail.Any(char.IsControl)))
            return false;
        foreach (var url in new[] { p.LogoUrl, p.HelpUrl, p.PrivacyUrl, p.TermsUrl })
            if (!string.IsNullOrEmpty(url) && !IsSameOrigin(url, origin)) return false;
        if (!string.IsNullOrEmpty(p.LogoUrl) &&
            !new[] { ".png", ".jpg", ".jpeg", ".webp" }.Any(ext =>
                new Uri(p.LogoUrl).AbsolutePath.EndsWith(ext, StringComparison.OrdinalIgnoreCase)))
            return false;
        if (p.SocialLinks is null || p.SocialLinks.Count > 20) return false;
        var keys = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        foreach (var link in p.SocialLinks)
        {
            if (link is null || !RequiredText(link.Platform, 50) || !keys.Add(link.Platform.Trim()) ||
                !RequiredText(link.LabelAr, 80) || !RequiredText(link.LabelEn, 80) ||
                link.DisplayOrder is < 0 or > 1000 ||
                (link.IsEnabled ? !IsSafeHttpsUrl(link.Url) : !string.IsNullOrEmpty(link.Url) && !IsSafeHttpsUrl(link.Url)))
                return false;
        }
        return true;
    }

    private PlatformBrandProfile Normalize(PlatformBrandProfile p) => p with
    {
        NameAr = p.NameAr.Trim(), NameEn = p.NameEn.Trim(),
        LogoUrl = Clean(p.LogoUrl) ?? Defaults().LogoUrl,
        SupportEmail = Clean(p.SupportEmail), Phone = Clean(p.Phone),
        ContactAddressAr = Clean(p.ContactAddressAr), ContactAddressEn = Clean(p.ContactAddressEn),
        DescriptionAr = Clean(p.DescriptionAr), DescriptionEn = Clean(p.DescriptionEn),
        HelpUrl = Clean(p.HelpUrl) ?? Defaults().HelpUrl,
        PrivacyUrl = Clean(p.PrivacyUrl) ?? Defaults().PrivacyUrl,
        TermsUrl = Clean(p.TermsUrl),
        SocialLinks = p.SocialLinks.OrderBy(x => x.DisplayOrder).ThenBy(x => x.Platform)
            .Select(x => x with { Platform = x.Platform.Trim(), LabelAr = x.LabelAr.Trim(), LabelEn = x.LabelEn.Trim() }).ToArray()
    };

    public async Task<PlatformBrandView> ReadAsync(bool admin, CancellationToken ct)
    {
        var row = await db.PlatformBrandSettings.AsNoTracking().SingleOrDefaultAsync(x => x.Id == 1, ct);
        var profile = row is null ? Defaults() : JsonSerializer.Deserialize<PlatformBrandProfile>(row.SettingsJson);
        profile = Validate(profile, OfficialOrigin) ? Normalize(profile!) : Defaults();
        if (!admin) profile = profile with { SocialLinks = profile.SocialLinks.Where(x => x.IsEnabled).ToArray() };
        return new PlatformBrandView(row?.Revision ?? 0, OfficialOrigin, profile);
    }

    public async Task<bool> UpdateAsync(PlatformBrandProfile profile, int revision, int actorId, CancellationToken ct)
    {
        if (revision < 0 || revision == int.MaxValue || !Validate(profile, OfficialOrigin))
            throw new ArgumentException("Invalid platform brand settings.");
        await using var transaction = await db.Database.BeginTransactionAsync(ct);
        if (!await db.Users.AsNoTracking().AnyAsync(x => x.Id == actorId && x.IsActive &&
            x.Role == AccountRolePolicy.LegacyAdmin, ct)) return false;
        var json = JsonSerializer.Serialize(Normalize(profile));
        var changed = await db.PlatformBrandSettings.Where(x => x.Id == 1 && x.Revision == revision)
            .ExecuteUpdateAsync(x => x.SetProperty(y => y.SettingsJson, json)
                .SetProperty(y => y.Revision, y => y.Revision + 1), ct);
        if (changed != 1) return false;
        db.PlatformActivityEvents.Add(new PlatformActivityEvent
        {
            ActorUserId = actorId, ActorRole = AccountRolePolicy.LegacyAdmin,
            Action = "BrandSettingsUpdated", Resource = "PlatformBrand", CreatedAtUtc = DateTime.UtcNow
        });
        await db.SaveChangesAsync(ct);
        await transaction.CommitAsync(ct);
        return true;
    }
}
