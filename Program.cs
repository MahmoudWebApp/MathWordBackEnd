// ============================================================================
// File: Program.cs
// Description: Main application entry point for MathWorld API.
// Configures services, middleware, Swagger, authentication, authorization,
// rate limiting, response compression, CORS, database health checks, and logs.
// ============================================================================

using System.Security.Claims;
using System.Text;
using System.Text.Json;
using System.Threading.RateLimiting;
using MathWorldAPI.Data;
using MathWorldAPI.Filters;
using MathWorldAPI.Helpers;
using MathWorldAPI.Middleware;
using MathWorldAPI.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);

// FIX: Force WebRootPath to a specific physical path for Docker/Render.
// This guarantees that IWebHostEnvironment.WebRootPath is not null.
builder.Environment.WebRootPath =
    Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");

// ============================================================================
// 1. Read and validate required configuration
// ============================================================================

var connectionString =
    builder.Configuration.GetConnectionString("DefaultConnection")
    ?? throw new InvalidOperationException(
        "ConnectionStrings:DefaultConnection is not configured.");

var jwtKey =
    builder.Configuration["Jwt:Key"]
    ?? throw new InvalidOperationException(
        "Jwt:Key is not configured.");

var jwtIssuer =
    builder.Configuration["Jwt:Issuer"]
    ?? throw new InvalidOperationException(
        "Jwt:Issuer is not configured.");

var jwtAudience =
    builder.Configuration["Jwt:Audience"]
    ?? throw new InvalidOperationException(
        "Jwt:Audience is not configured.");

if (Encoding.UTF8.GetByteCount(jwtKey) < 32)
{
    throw new InvalidOperationException(
        "Jwt:Key must contain at least 32 UTF-8 bytes.");
}

// ============================================================================
// 2. Configure DbContext with PostgreSQL
// ============================================================================

builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseNpgsql(connectionString);
});

// ============================================================================
// 3. Register application services
// ============================================================================

builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<ISocialAuthService, SocialAuthService>();
builder.Services.AddScoped<IMeiliSearchService, MeiliSearchService>();
builder.Services.AddScoped<AdminBootstrapper>();

// Register ImgBB as a typed HTTP client.
builder.Services.AddHttpClient<IImgBbStorageService, ImgBbStorageService>();

builder.Services.AddHttpClient("GoogleAuth", client =>
{
    client.BaseAddress = new Uri("https://www.googleapis.com/");
    client.Timeout = TimeSpan.FromSeconds(30);
});

builder.Services.AddHttpClient("FacebookAuth", client =>
{
    client.BaseAddress = new Uri("https://graph.facebook.com/");
    client.Timeout = TimeSpan.FromSeconds(30);
});

// ============================================================================
// 4. Configure JWT authentication
// ============================================================================

builder.Services
    .AddAuthentication(options =>
    {
        options.DefaultAuthenticateScheme =
            JwtBearerDefaults.AuthenticationScheme;

        options.DefaultChallengeScheme =
            JwtBearerDefaults.AuthenticationScheme;
    })
    .AddJwtBearer(options =>
    {
        options.RequireHttpsMetadata =
            !builder.Environment.IsDevelopment();

        options.SaveToken = false;

        options.TokenValidationParameters =
            new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,

                IssuerSigningKey = new SymmetricSecurityKey(
                    Encoding.UTF8.GetBytes(jwtKey)),

                ValidateIssuer = true,
                ValidIssuer = jwtIssuer,

                ValidateAudience = true,
                ValidAudience = jwtAudience,

                ValidateLifetime = true,
                RequireExpirationTime = true,

                ClockSkew = TimeSpan.FromSeconds(30)
            };

        options.Events = new JwtBearerEvents
        {
            OnAuthenticationFailed = context =>
            {
                Console.WriteLine(
                    $"JWT authentication failed: {context.Exception.Message}");

                return Task.CompletedTask;
            },

            OnTokenValidated = context =>
            {
                var userId = context.Principal?
                    .FindFirstValue(ClaimTypes.NameIdentifier);

                Console.WriteLine(
                    $"JWT token validated for user: {userId ?? "unknown"}");

                return Task.CompletedTask;
            }
        };
    });

// ============================================================================
// 5. Configure authorization policies
// ============================================================================

builder.Services.AddAuthorization(options =>
{
    options.AddPolicy(
        "AdminOnly",
        policy => policy.RequireRole("Admin"));

    options.AddPolicy(
        "StudentOnly",
        policy => policy.RequireRole("Student"));
});

// ============================================================================
// 6. Configure rate limiting
// ============================================================================

builder.Services.AddRateLimiter(options =>
{
    options.RejectionStatusCode =
        StatusCodes.Status429TooManyRequests;

    // Limits registration and login attempts by IP address.
    options.AddPolicy("auth", httpContext =>
    {
        var partitionKey =
            httpContext.Connection.RemoteIpAddress?.ToString()
            ?? "unknown-client";

        return RateLimitPartition.GetFixedWindowLimiter(
            partitionKey,
            _ => new FixedWindowRateLimiterOptions
            {
                PermitLimit = 5,
                Window = TimeSpan.FromMinutes(1),
                QueueLimit = 0,
                AutoReplenishment = true
            });
    });

    // Limits answer submission by authenticated user ID.
    options.AddPolicy("answers", httpContext =>
    {
        var userId = httpContext.User
            .FindFirstValue(ClaimTypes.NameIdentifier);

        var partitionKey =
            userId
            ?? httpContext.Connection.RemoteIpAddress?.ToString()
            ?? "unknown-client";

        return RateLimitPartition.GetTokenBucketLimiter(
            partitionKey,
            _ => new TokenBucketRateLimiterOptions
            {
                TokenLimit = 15,
                TokensPerPeriod = 15,
                ReplenishmentPeriod = TimeSpan.FromMinutes(1),
                QueueLimit = 0,
                AutoReplenishment = true
            });
    });

    options.OnRejected = async (
        context,
        cancellationToken) =>
    {
        var language =
            context.HttpContext.Items["Language"]?.ToString()
            ?? "ar";

        var response =
            LanguageHelper.ErrorResponse<object>(
                "RateLimitExceeded",
                language,
                StatusCodes.Status429TooManyRequests);

        response.CorrelationId =
            context.HttpContext.TraceIdentifier;

        context.HttpContext.Response.ContentType =
            "application/json";

        await context.HttpContext.Response.WriteAsync(
            JsonSerializer.Serialize(response),
            cancellationToken);
    };
});

// ============================================================================
// 7. Configure form options for file uploads
// ============================================================================

builder.Services.Configure<FormOptions>(options =>
{
    // Maximum size for multipart form data: 10 MB.
    options.MultipartBodyLengthLimit =
        10 * 1024 * 1024;

    // Maximum size for individual form values: 2 MB.
    options.ValueLengthLimit =
        2 * 1024 * 1024;

    // Maximum number of form values.
    options.ValueCountLimit = 1000;
});

// ============================================================================
// 8. Configure controllers and JSON serialization
// ============================================================================

builder.Services
    .AddControllers()
    .AddJsonOptions(options =>
    {
        // Ignore reference cycles to prevent serialization errors.
        options.JsonSerializerOptions.ReferenceHandler =
            System.Text.Json.Serialization.ReferenceHandler.IgnoreCycles;

        // Keep PascalCase property names.
        options.JsonSerializerOptions.PropertyNamingPolicy = null;

        // Do not serialize null properties.
        options.JsonSerializerOptions.DefaultIgnoreCondition =
            System.Text.Json.Serialization.JsonIgnoreCondition
                .WhenWritingNull;
    });

// ============================================================================
// 9. Configure response compression
// ============================================================================

builder.Services.AddResponseCompression(options =>
{
    options.EnableForHttps = true;
});

// ============================================================================
// 10. Configure Swagger/OpenAPI
// ============================================================================

builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc(
        "v1",
        new OpenApiInfo
        {
            Title = "MathWorld API",
            Version = "v1",
            Description =
                "API for MathWorld - Math Problems Platform"
        });

    // JWT Bearer authentication.
    options.AddSecurityDefinition(
        "Bearer",
        new OpenApiSecurityScheme
        {
            Description =
                "Enter your JWT token without the word Bearer.",
            Name = "Authorization",
            In = ParameterLocation.Header,
            Type = SecuritySchemeType.Http,
            Scheme = "Bearer",
            BearerFormat = "JWT"
        });

    options.AddSecurityRequirement(
        new OpenApiSecurityRequirement
        {
            {
                new OpenApiSecurityScheme
                {
                    Reference = new OpenApiReference
                    {
                        Type = ReferenceType.SecurityScheme,
                        Id = "Bearer"
                    }
                },
                Array.Empty<string>()
            }
        });

    // Auto-documents [FromForm] endpoints.
    options.OperationFilter<DynamicFormDataOperationFilter>();
});

// ============================================================================
// 11. Configure CORS for frontend applications
// ============================================================================

var configuredOrigins =
    builder.Configuration
        .GetSection("Cors:Origins")
        .Get<string[]>();

var allowedOrigins =
    configuredOrigins is { Length: > 0 }
        ? configuredOrigins
        : new[]
        {
            "http://localhost:3000",
            "http://localhost:3001",
            "http://localhost:5173",
            "https://localhost:3000",
            "https://localhost:3001",
            "https://localhost:5173",
            "https://mathwords.netlify.app"
        };

builder.Services.AddCors(options =>
{
    options.AddPolicy("Frontend", policy =>
    {
        policy
            .WithOrigins(allowedOrigins)
            .AllowAnyHeader()
            .AllowAnyMethod()
            .AllowCredentials();
    });
});

// ============================================================================
// Build the application
// ============================================================================

var app = builder.Build();

// ============================================================================
// 12. Apply migrations when explicitly enabled
// ============================================================================

if (app.Configuration.GetValue<bool>(
        "Database:ApplyMigrationsOnStartup"))
{
    using var migrationScope =
        app.Services.CreateScope();

    var database = migrationScope.ServiceProvider
        .GetRequiredService<AppDbContext>();

    try
    {
        await database.Database.MigrateAsync();

        Console.WriteLine(
            "Database migrated successfully!");
    }
    catch (Exception exception)
    {
        Console.WriteLine(
            $"Database migration error: {exception.Message}");

        throw;
    }
}
else
{
    Console.WriteLine(
        "Automatic database migrations are disabled.");
}

// ============================================================================
// 13. Create the initial administrator when explicitly enabled
// ============================================================================

using (var bootstrapScope = app.Services.CreateScope())
{
    var bootstrapper = bootstrapScope.ServiceProvider
        .GetRequiredService<AdminBootstrapper>();

    await bootstrapper.EnsureAdminAsync();
}

// ============================================================================
// 14. Configure middleware pipeline
// ============================================================================

// Add a unique identifier to each request.
app.UseMiddleware<CorrelationIdMiddleware>();

// Catch unhandled exceptions from the remaining pipeline.
app.UseMiddleware<GlobalExceptionMiddleware>();

app.UseResponseCompression();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();

    app.UseSwaggerUI(options =>
    {
        options.SwaggerEndpoint(
            "/swagger/v1/swagger.json",
            "MathWorld API v1");

        options.RoutePrefix = "swagger";
    });
}

// Render terminates HTTPS at the proxy level.
// Enable this locally only when HTTPS is configured correctly.
// app.UseHttpsRedirection();

app.UseRouting();

// CORS must run before authentication and authorization.
app.UseCors("Frontend");

// Serve files from wwwroot.
app.UseStaticFiles();

// Detect request language before controllers run.
app.UseMiddleware<LanguageMiddleware>();

app.UseAuthentication();

// Rate limiting runs after authentication so it can use the user ID.
app.UseRateLimiter();

app.UseAuthorization();

app.MapControllers();

// ============================================================================
// 15. Health check endpoint
// ============================================================================

app.MapGet(
        "/health",
        async (
            AppDbContext database,
            CancellationToken cancellationToken) =>
        {
            var databaseAvailable =
                await database.Database.CanConnectAsync(
                    cancellationToken);

            if (!databaseAvailable)
            {
                return Results.Json(
                    new
                    {
                        status = "unhealthy",
                        database = "unavailable",
                        timestamp = DateTime.UtcNow,
                        service = "MathWorld-Backend",
                        version = "1.0.0"
                    },
                    statusCode:
                        StatusCodes.Status503ServiceUnavailable);
            }

            return Results.Ok(
                new
                {
                    status = "healthy",
                    database = "available",
                    timestamp = DateTime.UtcNow,
                    service = "MathWorld-Backend",
                    version = "1.0.0"
                });
        })
    .AllowAnonymous();

// ============================================================================
// Start the application
// ============================================================================

Console.WriteLine("MathWorld API is running!");
Console.WriteLine(
    $"Environment: {app.Environment.EnvironmentName}");
Console.WriteLine(
    $"Swagger UI: https://localhost:{builder.Configuration["HttpsPort"] ?? "7000"}/swagger");
Console.WriteLine(
    $"Base URL: https://localhost:{builder.Configuration["HttpsPort"] ?? "7000"}/api");

app.Run();