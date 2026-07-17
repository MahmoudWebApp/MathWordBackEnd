// File: MathWorldAPI/Middleware/LanguageMiddleware.cs

namespace MathWorldAPI.Middleware
{
    /// <summary>
    /// Detects the requested Arabic or English language.
    /// Supports both X-Language and Accept-Language headers.
    /// </summary>
    public sealed class LanguageMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<LanguageMiddleware> _logger;

        /// <summary>
        /// Initializes a new instance of the LanguageMiddleware.
        /// </summary>
        public LanguageMiddleware(
            RequestDelegate next,
            ILogger<LanguageMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        /// <summary>
        /// Detects the language and stores it in HttpContext.Items.
        /// </summary>
        public async Task InvokeAsync(HttpContext context)
        {
            var requestedLanguage =
                context.Request.Headers["X-Language"]
                    .FirstOrDefault();

            if (string.IsNullOrWhiteSpace(requestedLanguage))
            {
                requestedLanguage =
                    context.Request.Headers["Accept-Language"]
                        .FirstOrDefault();
            }

            var language =
                NormalizeLanguage(requestedLanguage);

            context.Items["Language"] = language;
            context.Response.Headers.ContentLanguage = language;

            _logger.LogDebug(
                "Request language resolved to {Language}.",
                language);

            await _next(context);
        }

        /// <summary>
        /// Converts the supplied language header to ar or en.
        /// </summary>
        private static string NormalizeLanguage(
            string? language)
        {
            if (string.IsNullOrWhiteSpace(language))
            {
                return "ar";
            }

            var primaryLanguage = language
                .Split(
                    ',',
                    StringSplitOptions.RemoveEmptyEntries)
                .FirstOrDefault()?
                .Split(
                    ';',
                    StringSplitOptions.RemoveEmptyEntries)
                .FirstOrDefault()?
                .Trim();

            return primaryLanguage?.StartsWith(
                       "en",
                       StringComparison.OrdinalIgnoreCase) == true
                ? "en"
                : "ar";
        }
    }
}