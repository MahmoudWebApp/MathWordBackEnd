using System.Security.Claims;

namespace MathWorldAPI.Services;

[AttributeUsage(AttributeTargets.Method | AttributeTargets.Class)]
public sealed class SupervisorEndpointAttribute : Attribute { }

public sealed class SupervisorBoundaryMiddleware(RequestDelegate next)
{
    public async Task InvokeAsync(HttpContext context)
    {
        if (context.User.Identity?.IsAuthenticated == true &&
            context.User.FindFirstValue(ClaimTypes.Role) == AccountRolePolicy.Supervisor &&
            context.GetEndpoint()?.Metadata.GetMetadata<SupervisorEndpointAttribute>() is null)
        {
            context.Response.StatusCode = StatusCodes.Status403Forbidden;
            return;
        }
        await next(context);
    }
}
