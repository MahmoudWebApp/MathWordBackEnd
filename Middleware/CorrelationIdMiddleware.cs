using System.Text.RegularExpressions;

namespace MathWorldAPI.Middleware
{
    /// <summary>
    /// Validates or generates a correlation ID for safe tracing across requests.
    /// Never trust an arbitrary client-supplied string in response headers/logs.
    /// </summary>
    public sealed class CorrelationIdMiddleware
    {
        private const string HeaderName = "X-Correlation-ID";

        private static readonly Regex SafeCorrelationId = new(
            "^[A-Za-z0-9_-]{1,64}$",
            RegexOptions.Compiled | RegexOptions.CultureInvariant);

        private readonly RequestDelegate _next;
        private readonly ILogger<CorrelationIdMiddleware> _logger;

        public CorrelationIdMiddleware(
            RequestDelegate next,
            ILogger<CorrelationIdMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            var incomingId = context.Request.Headers[HeaderName]
                .FirstOrDefault();

            var correlationId =
                incomingId is not null &&
                SafeCorrelationId.IsMatch(incomingId)
                    ? incomingId
                    : Guid.NewGuid().ToString("N");

            context.TraceIdentifier = correlationId;

            context.Response.OnStarting(() =>
            {
                context.Response.Headers[HeaderName] = correlationId;
                return Task.CompletedTask;
            });

            using (_logger.BeginScope(
                       new Dictionary<string, object>
                       {
                           ["CorrelationId"] = correlationId
                       }))
            {
                await _next(context);
            }
        }
    }
}
