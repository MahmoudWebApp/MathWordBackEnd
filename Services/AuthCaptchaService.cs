using System.Net.Http.Json;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace MathWorldAPI.Services;

// Off by default until both clients support the same challenge contract.
// Never select enforcement based on client headers, platform or user identity.
public sealed class AuthCaptchaService(IHttpClientFactory clients, IConfiguration config)
{
    public const string Header = "X-MathWorld-Captcha";
    private const string Endpoint = "https://challenges.cloudflare.com/turnstile/v0/siteverify";
    private readonly object gate = new();
    private readonly Dictionary<string, DateTimeOffset> used = new(StringComparer.Ordinal);

    public async Task<bool> VerifyAsync(string action, string? token, CancellationToken ct)
    {
        if (!config.GetValue<bool>("MathWorldCaptcha:Enabled")) return true;
        var secret = config["MathWorldCaptcha:SecretKey"];
        var hostname = config["MathWorldCaptcha:Hostname"];
        if (string.IsNullOrWhiteSpace(secret) || string.IsNullOrWhiteSpace(hostname) ||
            string.IsNullOrWhiteSpace(token) || token.Length > 2048) return false;
        if (action is not ("login" or "register" or "forgot-password" or "reset-password")) return false;

        // Reserve a digest before the remote request; reject concurrent local replays.
        // A failed request needs a fresh challenge. Multi-instance replay protection
        // still requires shared state before scaling horizontally.
        var digest = Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(token)));
        lock (gate)
        {
            var now = DateTimeOffset.UtcNow;
            foreach (var key in used.Where(x => x.Value <= now).Select(x => x.Key).ToArray()) used.Remove(key);
            if (used.Count >= 10000 || used.ContainsKey(digest)) return false;
            used[digest] = now.AddMinutes(5);
        }
        try
        {
            using var body = new FormUrlEncodedContent(new Dictionary<string, string>
            {
                ["secret"] = secret, ["response"] = token
            });
            using var response = await clients.CreateClient("AuthCaptcha").PostAsync(Endpoint, body, ct);
            if (!response.IsSuccessStatusCode) return false;
            var result = await response.Content.ReadFromJsonAsync<SiteverifyResult>(cancellationToken: ct);
            return result is { Success: true } &&
                string.Equals(result.Hostname, hostname, StringComparison.OrdinalIgnoreCase) &&
                string.Equals(result.Action, action, StringComparison.Ordinal);
        }
        catch (HttpRequestException) { return false; }
        catch (JsonException) { return false; }
        catch (OperationCanceledException) when (!ct.IsCancellationRequested) { return false; }
    }

    private sealed record SiteverifyResult(
        [property: JsonPropertyName("success")] bool Success,
        [property: JsonPropertyName("hostname")] string? Hostname,
        [property: JsonPropertyName("action")] string? Action);
}
