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
    builder.Configuration.GetConnectionString("DefaultConnection");

if (string.IsNullOrWhiteSpace(connectionString))
{
    throw new InvalidOperationException(
        "ConnectionStrings:DefaultConnection must be configured through a secure environment setting.");
}

var jwtKey =
    builder.Configuration["Jwt:Key"];

if (string.IsNullOrWhiteSpace(jwtKey))
{
    throw new InvalidOperationException(
        "Jwt:Key must be configured through a secure environment setting.");
}

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

// Force Npgsql client-side pooling even when a legacy hosting connection
// string has Pooling=false. Otherwise every authenticated API request can
// negotiate fresh TCP/TLS connections to the cross-region database.
// Cap one Render instance to 15 open connections on Supabase's free tier.
// This does not change the host, credentials, SSL mode or migration behavior.
var pooledConnection = new Npgsql.NpgsqlConnectionStringBuilder(connectionString)
{
    Pooling = true
};
pooledConnection.MaxPoolSize = Math.Min(pooledConnection.MaxPoolSize, 15);
pooledConnection.MinPoolSize = Math.Min(
    pooledConnection.MinPoolSize, pooledConnection.MaxPoolSize);

// Render is a persistent ASP.NET Core host. Supabase recommends its session
// pooler (port 5432) rather than the transaction pooler (6543) for long-lived
// Npgsql clients. Keep the configured host, user, password, SSL and pool limits.
// Only rewrite the port for Supabase's shared pooler; leave other databases
// and local/test connection strings unchanged. The setting allows rollback
// without changing database credentials if a provider issue is discovered.
if (builder.Configuration.GetValue("Database:PreferSupabaseSessionPooler", true) &&
    pooledConnection.Port == 6543 &&
    pooledConnection.Host?.EndsWith(".pooler.supabase.com",
        StringComparison.OrdinalIgnoreCase) == true)
{
    pooledConnection.Port = 5432;
}

builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseNpgsql(pooledConnection.ConnectionString);
});

// ============================================================================
// 3. Register application services
// ============================================================================

// Cache non-personal, aggregated public statistics briefly to reduce DB round trips.
builder.Services.AddMemoryCache();
builder.Services.AddScoped<ProblemCategoryAccessService>();
builder.Services.AddScoped<PlatformActivityAuditWriter>();
// Lightweight SSE invalidation; per-process only, with polling as fallback.
builder.Services.AddSingleton<NotificationStreamBroker>();
// Invoked only by a future server-side, independently verified payment adapter.
builder.Services.AddScoped<PremiumPaymentSettlementService>();
// Privacy-minimal learner presence: expire stale sessions hourly.
builder.Services.AddHostedService<LearnerPresenceCleanupService>();
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<AccountPasswordService>();
builder.Services.AddScoped<PlatformBrandService>();
builder.Services.AddScoped<ISocialAuthService, SocialAuthService>();
builder.Services.AddScoped<IMeiliSearchService, MeiliSearchService>();
builder.Services.AddScoped<AdminBootstrapper>();
builder.Services.AddSingleton<LaunchFeatureFlags>();

// Register ImgBB as a typed HTTP client.
builder.Services.AddHttpClient<IImgBbStorageService, ImgBbStorageService>();

builder.Services.AddHttpClient("GoogleAuth", client =>
{
    client.BaseAddress = new Uri("https://www.googleapis.com/");
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
                // Do not log raw JWT validation exception details or token data.
                context.HttpContext.RequestServices
                    .GetRequiredService<ILogger<Program>>()
                    .LogWarning(
                        "JWT authentication failed ({FailureType}).",
                        context.Exception.GetType().Name);

                return Task.CompletedTask;
            },

            OnTokenValidated = async context =>
            {
                // A correctly signed JWT can outlive account deactivation
                // or an admin role change. Reject stale claims on every request.
                var rawId = context.Principal?
                    .FindFirstValue(ClaimTypes.NameIdentifier);
                var role = context.Principal?
                    .FindFirstValue(ClaimTypes.Role);
                if (!int.TryParse(rawId, out var userId) || userId <= 0 ||
                    !AccountRolePolicy.IsSupportedSessionRole(role))
                {
                    context.Fail("InvalidSessionIdentity");
                    return;
                }

                if (!SessionVersionPolicy.TryReadVersion(
                    context.Principal!.FindAll(SessionVersionPolicy.ClaimName).Select(claim => claim.Value),
                    out var tokenVersion))
                {
                    context.Fail("InvalidSessionVersion");
                    return;
                }

                var database = context.HttpContext.RequestServices
                    .GetRequiredService<AppDbContext>();
                var active = await database.Users.AsNoTracking().AnyAsync(
                    user => user.Id == userId && user.IsActive &&
                        user.Role == role && user.TokenVersion == tokenVersion,
                    context.HttpContext.RequestAborted);
                if (!active)
                    context.Fail("AccountInactiveOrSessionRevoked");
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
        policy => policy.RequireRole(AccountRolePolicy.LegacyAdmin));

    options.AddPolicy(
        "StudentOnly",
        policy => policy.RequireRole(AccountRolePolicy.Student));
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

    // Limit current-password verification independently of login/registration.
    options.AddPolicy("account-password", httpContext =>
    {
        var identity = httpContext.User.FindFirstValue(ClaimTypes.NameIdentifier);
        var key = identity is null
            ? "ip:" + (httpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown")
            : "user:" + identity;
        return RateLimitPartition.GetFixedWindowLimiter(key,
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
                TokenLimit = Math.Clamp(builder.Configuration.GetValue<int>("RateLimits:AnswerTokensPerMinute", 15), 15, 100),
                TokensPerPeriod = Math.Clamp(builder.Configuration.GetValue<int>("RateLimits:AnswerTokensPerMinute", 15), 15, 100),
                ReplenishmentPeriod = TimeSpan.FromMinutes(1),
                QueueLimit = 0,
                AutoReplenishment = true
            });
    });

    // Authenticated Premium gift attempts are bounded separately from
    // solving questions and login, limiting abuse without slowing practice.
    options.AddPolicy("premium-code", httpContext =>
    {
        var userId = httpContext.User.FindFirstValue(ClaimTypes.NameIdentifier);
        var partitionKey = userId
            ?? httpContext.Connection.RemoteIpAddress?.ToString()
            ?? "unknown-client";
        return RateLimitPartition.GetFixedWindowLimiter(
            partitionKey,
            _ => new FixedWindowRateLimiterOptions
            {
                PermitLimit = 8,
                Window = TimeSpan.FromMinutes(1),
                QueueLimit = 0,
                AutoReplenishment = true
            });
    });

    // Limit opening long-lived SSE streams per authenticated account.
    // Keep normal inbox GET and solving requests in separate budgets.
    options.AddPolicy("notification-stream", httpContext =>
    {
        var id = httpContext.User.FindFirstValue(ClaimTypes.NameIdentifier)
            ?? httpContext.Connection.RemoteIpAddress?.ToString()
            ?? "unknown-client";
        return RateLimitPartition.GetFixedWindowLimiter(id,
            _ => new FixedWindowRateLimiterOptions
            {
                PermitLimit = 12,
                Window = TimeSpan.FromMinutes(1),
                QueueLimit = 0,
                AutoReplenishment = true
            });
    });

    // A student heartbeat is best-effort and cannot flood PostgreSQL.
    // Each learner has a small quota independent of solving questions.
    options.AddPolicy("presence", httpContext =>
    {
        var id = httpContext.User.FindFirstValue(ClaimTypes.NameIdentifier)
            ?? httpContext.Connection.RemoteIpAddress?.ToString()
            ?? "unknown-client";
        return RateLimitPartition.GetFixedWindowLimiter(id,
            _ => new FixedWindowRateLimiterOptions
            {
                PermitLimit = 6,
                Window = TimeSpan.FromMinutes(1),
                QueueLimit = 0,
                AutoReplenishment = true
            });
    });

    // Solution previews have their own bucket; viewing a Premium solution
    // must never consume the answer-submission rate limit.
    options.AddPolicy("solution-preview", httpContext =>
    {
        var userId = httpContext.User.FindFirstValue(ClaimTypes.NameIdentifier);
        var partitionKey = userId
            ?? httpContext.Connection.RemoteIpAddress?.ToString()
            ?? "unknown-client";
        return RateLimitPartition.GetTokenBucketLimiter(
            partitionKey,
            _ => new TokenBucketRateLimiterOptions
            {
                TokenLimit = 30,
                TokensPerPeriod = 30,
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

// Exact, first-party production hosts must remain available even when
// Cors:Origins is configured separately on Render. Never allow *.vercel.app.
var allowedOrigins =
    (configuredOrigins is { Length: > 0 }
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
        })
    .Concat(new[]
    {
        "https://mathwords.netlify.app",
        "https://math-world-frontend.vercel.app",
        "https://math-world-frontend-mahmouds-projects-0868fac1.vercel.app",
        "https://math-world-frontend-git-main-mahmouds-projects-0868fac1.vercel.app"
    })
    .Distinct(StringComparer.OrdinalIgnoreCase)
    .ToArray();

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

// Record low-cardinality request metrics and structured duration logs.
// Keep this after routing so /api/problems/{id} is recorded as a template.
app.UseMiddleware<RequestTelemetryMiddleware>();

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

// Store successful user/admin command metadata after authorization.
// No request bodies, email addresses, tokens or raw query strings.
app.UseMiddleware<PlatformActivityAuditMiddleware>();

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

// Liveness checks the process only (no database dependency).
app.MapGet(
        "/health/live",
        () => Results.Ok(new
        {
            status = "alive",
            service = "MathWorld-Backend"
        }))
    .AllowAnonymous();

// Readiness checks connectivity AND whether EF Core schema migrations are
// up to date. A reachable database with an outdated schema caused HTTP 500
// logins during the 2026-11-13 learning-stage rollout.
// Do not apply migrations in the readiness endpoint or expose schema details.
app.MapGet(
        "/health/ready",
        async (
            AppDbContext database,
            ILogger<Program> logger,
            CancellationToken cancellationToken) =>
        {
            using var timeout =
                CancellationTokenSource.CreateLinkedTokenSource(
                    cancellationToken);
            timeout.CancelAfter(TimeSpan.FromSeconds(3));

            try
            {
                if (await database.Database.CanConnectAsync(timeout.Token))
                {
                    // Read-only check: EF migrations must already have been
                    // applied by an explicit migration release step.
                    // CanConnectAsync alone returns true for a missing column.
                    var pending = await database.Database.GetPendingMigrationsAsync(
                        timeout.Token);

                    if (pending.Any())
                    {
                        logger.LogWarning(
                            "Database readiness blocked: {Count} unapplied EF migrations.",
                            pending.Count());

                        return Results.Json(
                            new
                            {
                                status = "unready",
                                database = "available",
                                schema = "outdated"
                            },
                            statusCode: StatusCodes.Status503ServiceUnavailable);
                    }

                    return Results.Ok(new
                    {
                        status = "ready",
                        database = "available",
                        schema = "current"
                    });
                }
            }
            catch (Exception exception)
                when (!cancellationToken.IsCancellationRequested)
            {
                logger.LogWarning(
                    exception,
                    "Database readiness probe failed.");
            }

            return Results.Json(
                new
                {
                    status = "unready",
                    database = "unavailable"
                },
                statusCode: StatusCodes.Status503ServiceUnavailable);
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