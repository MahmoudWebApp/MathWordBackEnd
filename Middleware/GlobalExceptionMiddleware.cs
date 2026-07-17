// File: MathWorldAPI/Middleware/GlobalExceptionMiddleware.cs

using MathWorldAPI.Helpers;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Middleware
{
    /// <summary>
    /// Handles unhandled exceptions and returns a standardized API response.
    /// </summary>
    public sealed class GlobalExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<GlobalExceptionMiddleware> _logger;

        /// <summary>
        /// Initializes a new instance of the GlobalExceptionMiddleware.
        /// </summary>
        public GlobalExceptionMiddleware(
            RequestDelegate next,
            ILogger<GlobalExceptionMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        /// <summary>
        /// Executes the next middleware and handles unhandled exceptions.
        /// </summary>
        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (OperationCanceledException)
                when (context.RequestAborted.IsCancellationRequested)
            {
                _logger.LogInformation(
                    "Request was cancelled. CorrelationId: {CorrelationId}",
                    context.TraceIdentifier);
            }
            catch (Exception exception)
            {
                if (context.Response.HasStarted)
                {
                    _logger.LogError(
                        exception,
                        "The response already started. CorrelationId: {CorrelationId}",
                        context.TraceIdentifier);

                    throw;
                }

                await HandleExceptionAsync(
                    context,
                    exception);
            }
        }

        /// <summary>
        /// Maps an exception to an HTTP response.
        /// </summary>
        private async Task HandleExceptionAsync(
            HttpContext context,
            Exception exception)
        {
            var language =
                context.Items["Language"]?.ToString()
                ?? "ar";

            var statusCode = exception switch
            {
                ArgumentException =>
                    StatusCodes.Status400BadRequest,

                UnauthorizedAccessException =>
                    StatusCodes.Status401Unauthorized,

                KeyNotFoundException =>
                    StatusCodes.Status404NotFound,

                DbUpdateException =>
                    StatusCodes.Status409Conflict,

                _ =>
                    StatusCodes.Status500InternalServerError
            };

            var messageKey = statusCode switch
            {
                StatusCodes.Status400BadRequest =>
                    "BadRequest",

                StatusCodes.Status401Unauthorized =>
                    "Unauthorized",

                StatusCodes.Status404NotFound =>
                    "NotFound",

                StatusCodes.Status409Conflict =>
                    "Conflict",

                _ =>
                    "ServerError"
            };

            _logger.LogError(
                exception,
                "Unhandled exception. CorrelationId: {CorrelationId}",
                context.TraceIdentifier);

            context.Response.Clear();
            context.Response.StatusCode = statusCode;
            context.Response.ContentType = "application/json";

            var response =
                LanguageHelper.ErrorResponse<object>(
                    messageKey,
                    language,
                    statusCode);

            response.CorrelationId =
                context.TraceIdentifier;

            await context.Response.WriteAsJsonAsync(response);
        }
    }
}