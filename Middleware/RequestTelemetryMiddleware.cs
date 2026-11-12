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

                RequestCount.Add(1, tags);
                RequestDuration.Record(
                    stopwatch.Elapsed.TotalMilliseconds,
                    tags);

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
