using System.Diagnostics;
using System.Diagnostics.Metrics;
using Microsoft.AspNetCore.Routing;

namespace MathWorldAPI.Middleware
{
    /// <summary>
    /// Records HTTP request counts/duration using route templates, not raw paths
    /// or query strings. Logs one structured completion event per request.
    /// </summary>
    public sealed class RequestTelemetryMiddleware
    {
        private static readonly Meter Meter = new("MathWorld.API", "1.0.0");

        private static readonly Counter<long> RequestCount =
            Meter.CreateCounter<long>("mathworld.http.requests");

        private static readonly Histogram<double> RequestDuration =
            Meter.CreateHistogram<double>(
                "mathworld.http.duration",
                unit: "ms");

        private readonly RequestDelegate _next;
        private readonly ILogger<RequestTelemetryMiddleware> _logger;
        private readonly int _slowRequestThresholdMs;

        public RequestTelemetryMiddleware(
            RequestDelegate next,
            ILogger<RequestTelemetryMiddleware> logger,
            IConfiguration configuration)
        {
            _next = next;
            _logger = logger;
            var configured = configuration.GetValue<int>(
                "Monitoring:SlowRequestThresholdMs");
            _slowRequestThresholdMs = configured > 0 ? configured : 1500;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            var stopwatch = Stopwatch.StartNew();
            var statusCode = StatusCodes.Status500InternalServerError;

            try
            {
                await _next(context);
                statusCode = context.Response.StatusCode;
            }
            catch (OperationCanceledException)
                when (context.RequestAborted.IsCancellationRequested)
            {
                statusCode = 499; // Client closed the request.
                throw;
            }
            finally
            {
                stopwatch.Stop();

                var route = (context.GetEndpoint() as RouteEndpoint)
                    ?.RoutePattern.RawText ?? "unmatched";

                var tags = new TagList
                {
                    { "http.request.method", context.Request.Method },
                    { "http.route", route },
                    { "http.response.status_code", statusCode }
                };

                // Keep request counts for streams, but do not treat the
                // lifetime of a healthy SSE subscription as API latency.
                var isHealthyEventStream = statusCode is >= 200 and < 300 &&
                    context.Response.ContentType?.StartsWith(
                        "text/event-stream",
                        StringComparison.OrdinalIgnoreCase) == true;

                RequestCount.Add(1, tags);
                if (!isHealthyEventStream)
                {
                    RequestDuration.Record(
                        stopwatch.Elapsed.TotalMilliseconds,
                        tags);
                }

                if (statusCode >= 500)
                {
                    _logger.LogError(
                        "HTTP {Method} {Route} returned {StatusCode} in {ElapsedMs:F1}ms. CorrelationId={CorrelationId}",
                        context.Request.Method,
                        route,
                        statusCode,
                        stopwatch.Elapsed.TotalMilliseconds,
                        context.TraceIdentifier);
                }
                // Server-sent event responses intentionally stay open while
                // the client is connected. Their full connection lifetime is
                // not an indication of slow API request processing.
                else if (isHealthyEventStream)
                {
                    _logger.LogDebug(
                        "HTTP event stream {Method} {Route} closed after {ElapsedMs:F1}ms. CorrelationId={CorrelationId}",
                        context.Request.Method,
                        route,
                        stopwatch.Elapsed.TotalMilliseconds,
                        context.TraceIdentifier);
                }
                else if (stopwatch.Elapsed.TotalMilliseconds >=
                         _slowRequestThresholdMs)
                {
                    _logger.LogWarning(
                        "Slow HTTP {Method} {Route} returned {StatusCode} in {ElapsedMs:F1}ms. CorrelationId={CorrelationId}",
                        context.Request.Method,
                        route,
                        statusCode,
                        stopwatch.Elapsed.TotalMilliseconds,
                        context.TraceIdentifier);
                }
                else
                {
                    _logger.LogInformation(
                        "HTTP {Method} {Route} returned {StatusCode} in {ElapsedMs:F1}ms. CorrelationId={CorrelationId}",
                        context.Request.Method,
                        route,
                        statusCode,
                        stopwatch.Elapsed.TotalMilliseconds,
                        context.TraceIdentifier);
                }
            }
        }
    }
}
