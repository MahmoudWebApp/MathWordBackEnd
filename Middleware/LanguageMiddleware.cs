namespace MathWorldAPI.Middleware
{
    public class LanguageMiddleware
    {
        private readonly RequestDelegate _next;

        public LanguageMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            var language = context.Request.Headers["Accept-Language"].ToString();

            if (string.IsNullOrEmpty(language))
                language = "ar";

            context.Items["Language"] = language.StartsWith("en") ? "en" : "ar";

            await _next(context);
        }
    }
}