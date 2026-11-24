using System.Net;
using System.Net.Mail;
using System.Text;

namespace MathWorldAPI.Services;

public sealed record TransactionalEmail(string Subject, string PlainText, string Html);
public enum EmailSendResult { Sent, NotConfigured, Failed }

public interface ITransactionalEmailSender
{
    bool IsConfigured { get; }
    Task<EmailSendResult> SendAsync(string recipient, TransactionalEmail email, CancellationToken ct);
}

/// <summary>One HTML/plain-text layout for all transactional emails; no raw HTML input.</summary>
public static class MathWorldEmailLayout
{
    private static string E(string? value) => WebUtility.HtmlEncode(value ?? "");
    private static string TextBlock(string? value) => E(value).Replace("\r\n", "\n").Replace("\r", "\n").Replace("\n", "<br>");
    public static TransactionalEmail Render(PlatformBrandView brand, string locale, string title,
        string body, string? actionLabel = null, string? actionUrl = null)
    {
        if (actionUrl is not null && (!PlatformBrandService.IsSameOrigin(actionUrl, brand.WebsiteUrl) ||
            string.IsNullOrWhiteSpace(actionLabel)))
            throw new ArgumentException("Email actions must target the official platform.");
        var ar = locale == "ar";
        var p = brand.Profile;
        var name = ar ? p.NameAr : p.NameEn;
        var description = ar ? p.DescriptionAr : p.DescriptionEn;
        var address = ar ? p.ContactAddressAr : p.ContactAddressEn;
        var direction = ar ? "rtl" : "ltr";
        var plain = new StringBuilder().AppendLine(name).AppendLine().AppendLine(title).AppendLine(body);
        var html = new StringBuilder()
            .Append($"<!doctype html><html lang=\"{(ar ? "ar" : "en")}\" dir=\"{direction}\"><body style=\"margin:0;background:#f5f3ff;font-family:Arial,sans-serif;color:#1f2937\"><table role=\"presentation\" width=\"100%\"><tr><td align=\"center\"><table role=\"presentation\" width=\"100%\" style=\"max-width:600px;background:#fff;border-radius:12px;overflow:hidden\"><tr><td style=\"padding:24px;background:#f3e8ff;color:#4c1d95;text-align:center\">");
        if (PlatformBrandService.IsSameOrigin(p.LogoUrl, brand.WebsiteUrl))
            html.Append($"<img src=\"{E(p.LogoUrl)}\" alt=\"{E(name)}\" width=\"64\" height=\"64\" style=\"display:block;margin:auto\">");
        html.Append($"<strong>{E(name)}</strong></td></tr><tr><td style=\"padding:24px\"><h1 style=\"font-size:22px\">{E(title)}</h1><p style=\"line-height:1.7\">{TextBlock(body)}</p>");
        if (actionUrl is not null)
        {
            html.Append($"<p><a style=\"display:inline-block;background:#6d28d9;color:#fff;padding:12px 20px;border-radius:8px;text-decoration:none\" href=\"{E(actionUrl)}\">{E(actionLabel)}</a></p><p style=\"font-size:12px;overflow-wrap:anywhere\">{E(actionUrl)}</p>");
            plain.AppendLine().AppendLine(actionLabel).AppendLine(actionUrl);
        }
        html.Append($"</td></tr><tr><td style=\"padding:20px;background:#f9fafb;border-top:1px solid #e5e7eb;font-size:13px;line-height:1.6\"><strong>{E(name)}</strong><p>{(ar ? "هذه رسالة من منصة MathWorld." : "This is a message from MathWorld.")}</p>");
        plain.AppendLine().AppendLine(name);
        foreach (var value in new[] { description, address, p.Phone, p.SupportEmail })
            if (!string.IsNullOrWhiteSpace(value)) { html.Append($"<div>{E(value)}</div>"); plain.AppendLine(value); }
        string? Localize(string? value, string page) =>
            !ar && value == brand.WebsiteUrl + "/ar/" + page ? brand.WebsiteUrl + "/en/" + page : value;
        var links = new List<(string Label, string? Url)>
        {
            (ar ? "الموقع الرسمي" : "Website", brand.WebsiteUrl),
            (ar ? "المساعدة" : "Help", Localize(p.HelpUrl, "contact")),
            (ar ? "الخصوصية" : "Privacy", Localize(p.PrivacyUrl, "privacy")),
            (ar ? "الشروط" : "Terms", p.TermsUrl)
        };
        links.AddRange(p.SocialLinks.Where(x => x.IsEnabled).OrderBy(x => x.DisplayOrder)
            .Select(x => (ar ? x.LabelAr : x.LabelEn, (string?)x.Url)));
        foreach (var link in links)
            if (PlatformBrandService.IsSafeHttpsUrl(link.Url))
            {
                html.Append($"<div><a style=\"color:#5b21b6\" href=\"{E(link.Url)}\">{E(link.Label)}</a></div>");
                plain.AppendLine($"{link.Label}: {link.Url}");
            }
        html.Append("</td></tr></table></td></tr></table></body></html>");
        return new TransactionalEmail(title.Replace('\r', ' ').Replace('\n', ' '), plain.ToString(), html.ToString());
    }
}

/// <summary>Adapter for the existing explicit SMTP route. Configuration is server-side only.</summary>
public sealed class SmtpTransactionalEmailSender(IConfiguration configuration) : ITransactionalEmailSender
{
    private sealed record Settings(string Host, int Port, string From, string User, string Password);
    private Settings? ReadSettings()
    {
        var host = configuration["MathWorldEmail:Host"]?.Trim();
        var from = configuration["MathWorldEmail:From"]?.Trim();
        var user = configuration["MathWorldEmail:User"]?.Trim();
        var password = configuration["MathWorldEmail:Password"];
        if (string.IsNullOrWhiteSpace(host) || string.IsNullOrWhiteSpace(from) ||
            string.IsNullOrWhiteSpace(user) || string.IsNullOrWhiteSpace(password) ||
            !int.TryParse(configuration["MathWorldEmail:Port"] ?? "587", out var port) ||
            port is < 1 or > 65535 || !MailAddress.TryCreate(from, out _)) return null;
        return new Settings(host, port, from, user, password);
    }

    public bool IsConfigured => ReadSettings() is not null;
    public async Task<EmailSendResult> SendAsync(string recipient, TransactionalEmail email, CancellationToken ct)
    {
        var settings = ReadSettings();
        if (settings is null) return EmailSendResult.NotConfigured;
        if (!MailAddress.TryCreate(recipient, out var address)) return EmailSendResult.Failed;
        try
        {
            using var message = new MailMessage
            {
                From = new MailAddress(settings.From, "MathWorld"),
                Subject = email.Subject, Body = email.PlainText, IsBodyHtml = false,
                SubjectEncoding = Encoding.UTF8, BodyEncoding = Encoding.UTF8
            };
            message.To.Add(address);
            message.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(email.Html, Encoding.UTF8, "text/html"));
            using var client = new SmtpClient(settings.Host, settings.Port)
            {
                Credentials = new NetworkCredential(settings.User, settings.Password),
                EnableSsl = true, DeliveryMethod = SmtpDeliveryMethod.Network, Timeout = 15000
            };
            await client.SendMailAsync(message, ct);
            return EmailSendResult.Sent;
        }
        catch (Exception ex) when (ex is SmtpException or InvalidOperationException or IOException)
        {
            return EmailSendResult.Failed;
        }
    }
}
