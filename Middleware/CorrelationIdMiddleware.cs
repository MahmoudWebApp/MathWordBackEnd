// File: MathWorldAPI/Middleware/CorrelationIdMiddleware.cs

namespace MathWorldAPI.Middleware
{
    /// <summary>
    /// Adds a stable correlation ID to every HTTP request and response.
    /// The ID can be used to find the matching request in server logs.
    /// </summary>
    public sealed class CorrelationIdMiddleware
    {
        private const string HeaderName = "X-Correlation-ID";

        private readonly RequestDelegate _next;
        private readonly ILogger<CorrelationIdMiddleware> _logger;

        /// <summary>
        /// Initializes a new instance of the CorrelationIdMiddleware.
        /// </summary>
        public CorrelationIdMiddleware(
            RequestDelegate next,
            ILogger<CorrelationIdMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        /// <summary>
        /// Reads or generates a correlation ID and adds it to the response.
        /// </summary>
        public async Task InvokeAsync(HttpContext context)
        {
            var incomingId =
                context.Request.Headers[HeaderName]
                    .FirstOrDefault();

            var correlationId =
                !string.IsNullOrWhiteSpace(incomingId)
                && incomingId.Length <= 100
                    ? incomingId
                    : Guid.NewGuid().ToString("N");

            context.TraceIdentifier = correlationId;

            context.Response.OnStarting(() =>
            {
                context.Response.Headers[HeaderName] =
                    correlationId;

                return Task.CompletedTask;
            });

            using (_logger.BeginScope(
                       new Dictionary<string, object>
                       {
                           ["CorrelationId"] = correlationId
                       }))
            {
                _logger.LogInformation(
                    "Request started: {Method} {Path}",
                    context.Request.Method,
                    context.Request.Path);

                await _next(context);

                _logger.LogInformation(
                    "Request completed: {Method} {Path} with status {StatusCode}",
                    context.Request.Method,
                    context.Request.Path,
                    context.Response.StatusCode);
            }
        }
    }
}