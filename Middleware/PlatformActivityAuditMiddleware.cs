using System.Security.Claims;
using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.AspNetCore.Routing;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Middleware;

/// <summary>
/// Records successful authenticated state-changing API calls. No request or
/// response bodies, secrets, IP addresses, or raw query strings are retained.
/// Login/registration are added explicitly by the auth controllers.
/// This is a best-effort trail; it does not claim atomic parity with domain
/// writes or a reliable logout timestamp.
/// </summary>
public sealed class PlatformActivityAuditMiddleware
{
    private readonly RequestDelegate _next;
    public PlatformActivityAuditMiddleware(RequestDelegate next) => _next = next;

    /// <summary>
    /// Stable, low-cardinality event labels. We only inspect the matched
    /// route template (never raw query strings, values or request bodies).
    /// </summary>
    public static string ClassifyAction(string method, string route)
    {
        if (method == "DELETE") return "Delete";
        if (method is "PUT" or "PATCH")
        {
            if (route.Contains("/disable", StringComparison.OrdinalIgnoreCase))
                return "Disable";
            if (route.Contains("/revoke", StringComparison.OrdinalIgnoreCase))
                return "Revoke";
            return "Update";
        }
        if (method == "POST")
        {
            if (route.Contains("/publish", StringComparison.OrdinalIgnoreCase))
                return "Publish";
            if (route.Contains("/approve", StringComparison.OrdinalIgnoreCase))
                return "Approve";
            if (route.Contains("/reject", StringComparison.OrdinalIgnoreCase))
                return "Reject";
            if (route.Contains("/redeem", StringComparison.OrdinalIgnoreCase))
                return "Redeem";
            if (route.Contains("/grant", StringComparison.OrdinalIgnoreCase))
                return "Grant";
            if (route.Contains("/notifications", StringComparison.OrdinalIgnoreCase))
                return "Notify";
            return "CreateOrSubmit";
        }
        return "Change";
    }

    public async Task InvokeAsync(HttpContext context, AppDbContext db,
        ILogger<PlatformActivityAuditMiddleware> logger)
    {
        await _next(context);

        if (context.Response.StatusCode is < 200 or >= 300) return;
        if (context.User.Identity?.IsAuthenticated != true) return;
        if (!int.TryParse(context.User.FindFirstValue(ClaimTypes.NameIdentifier), out var userId) ||
            userId <= 0) return;

        var method = context.Request.Method.ToUpperInvariant();
        if (method is not ("POST" or "PUT" or "PATCH" or "DELETE")) return;

        var urlPath = context.Request.Path.Value ?? "";
        // Categories are edited under /api/categories (legacy controller),
        // not /api/admin/categories. Admin creations/updates/deletions must
        // still appear in the same audit trail as modern admin endpoints.
        var adminCommand =
            urlPath.StartsWith("/api/admin/", StringComparison.OrdinalIgnoreCase) ||
            urlPath.Equals("/api/categories", StringComparison.OrdinalIgnoreCase) ||
            urlPath.StartsWith("/api/categories/", StringComparison.OrdinalIgnoreCase);
        var learnerCommand = urlPath.StartsWith("/api/users/learning-stage", StringComparison.OrdinalIgnoreCase) ||
            urlPath.StartsWith("/api/users/premium-codes/", StringComparison.OrdinalIgnoreCase) ||
            urlPath.StartsWith("/api/problems/", StringComparison.OrdinalIgnoreCase) ||
            urlPath.StartsWith("/api/users/favorites", StringComparison.OrdinalIgnoreCase) ||
            urlPath.StartsWith("/api/notifications/", StringComparison.OrdinalIgnoreCase);

        if (!adminCommand && !learnerCommand) return;

        // Use endpoint templates instead of URLs containing untrusted segments.
        var route = (context.GetEndpoint() as RouteEndpoint)?.RoutePattern.RawText ?? "";
        if (string.IsNullOrWhiteSpace(route)) return;

        var role = context.User.IsInRole("Admin") ? "Admin"
            : context.User.IsInRole("Student") ? "Student" : "";
        if ((adminCommand && role != "Admin") || (learnerCommand && role != "Student"))
            return;

        var actorActive = await db.Users.AsNoTracking().AnyAsync(
            u => u.Id == userId && u.IsActive && u.Role == role,
            context.RequestAborted);
        if (!actorActive) return;

        var resourceId = new[] { "id", "learnerId", "stageId", "problemId", "categoryId" }
            .Select(key => context.Request.RouteValues.TryGetValue(key, out var value) ?
                value?.ToString() : null)
            .FirstOrDefault(value => !string.IsNullOrWhiteSpace(value));

        try
        {
            db.PlatformActivityEvents.Add(new PlatformActivityEvent
            {
                ActorUserId = userId,
                ActorRole = role,
                Action = ClassifyAction(method, route),
                Resource = route.Length <= 140 ? route : route[..140],
                ResourceId = resourceId?.Length > 64 ? resourceId[..64] : resourceId,
                Origin = "api",
                CreatedAtUtc = DateTime.UtcNow
            });
            await db.SaveChangesAsync(context.RequestAborted);
        }
        catch (Exception error) when (!context.RequestAborted.IsCancellationRequested)
        {
            // An audit failure must not turn a committed student/admin command
            // into a misleading HTTP error that causes duplicate retries.
            logger.LogError(error,
                "Failed to audit committed {Action} by actor ID {UserId}.",
                method, userId);
        }
    }
}
