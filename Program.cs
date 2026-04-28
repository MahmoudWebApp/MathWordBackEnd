// =============================================
// File: Program.cs - Merged Version with Keep-Alive & Resilience
// =============================================

using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using MathWorldAPI.Data;
using MathWorldAPI.Middleware;
using MathWorldAPI.Services;
using Polly; // Add Polly for handling transient errors

var builder = WebApplication.CreateBuilder(args);

// 1. Configure DbContext with PostgreSQL
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection")));

// 2. Register Services - MeiliSearch as Singleton with Polly Retry Policy
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddHttpClient<IMeiliSearchService, MeiliSearchService>(client =>
{
    client.BaseAddress = new Uri(builder.Configuration["MeiliSearch:Url"] ?? "http://localhost:7700");
    client.Timeout = TimeSpan.FromSeconds(30);
})
.AddTransientHttpErrorPolicy(policy =>
    policy.WaitAndRetryAsync(3, retryAttempt =>
        TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)) // Exponential backoff: 2s, 4s, 8s
));

// 3. Configure JWT Authentication (Combined: Security + Flexibility)
var jwtKey = builder.Configuration["Jwt:Key"] ?? "MathWorldSuperSecretKey2025!@#$%";
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.RequireHttpsMetadata = false; // Change to true in production
    options.SaveToken = true;
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtKey)),

        // Support both modes: with or without Issuer/Audience validation
        ValidateIssuer = !string.IsNullOrEmpty(builder.Configuration["Jwt:Issuer"]),
        ValidateAudience = !string.IsNullOrEmpty(builder.Configuration["Jwt:Audience"]),
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],

        ClockSkew = TimeSpan.Zero
    };
});

// 4. Configure Authorization Policies
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("AdminOnly", policy => policy.RequireRole("Admin"));
    options.AddPolicy("StudentOnly", policy => policy.RequireRole("Student"));
});

// 5. Configure Controllers with JSON Options
builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.ReferenceHandler = System.Text.Json.Serialization.ReferenceHandler.IgnoreCycles;
        options.JsonSerializerOptions.PropertyNamingPolicy = null;
    });

// 6. Configure Swagger with Bearer Authentication
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "MathWorld API",
        Version = "v1",
        Description = "API for MathWorld - Math Problems Platform"
    });

    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Description = "Enter your JWT token (without the word 'Bearer')",
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.Http,
        Scheme = "Bearer",
        BearerFormat = "JWT"
    });

    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "Bearer" }
            },
            Array.Empty<string>()
        }
    });
});

// 7. Configure CORS for React Frontend (Restricted for Security)
builder.Services.AddCors(options =>
{
    options.AddPolicy("ReactApp", policy =>
    {
        policy.WithOrigins(
                "http://localhost:3000",
                "http://localhost:3001",
                "http://localhost:5173",
                "https://your-frontend.onrender.com" // Add your actual frontend URL
            )
            .AllowAnyHeader()
            .AllowAnyMethod()
            .AllowCredentials();
    });
});

// 8. Register HttpClient for Keep-Alive pings
builder.Services.AddHttpClient("KeepAlive");

var app = builder.Build();

// 9. Apply Database Migrations on Startup (with error handling)
using (var scope = app.Services.CreateScope())
{
    var dbContext = scope.ServiceProvider.GetRequiredService<AppDbContext>();
    try
    {
        // Use Migrate() instead of EnsureCreated() to handle migrations properly
        await dbContext.Database.MigrateAsync();
        Console.WriteLine("Database migrated successfully!");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Database error: {ex.Message}");
        // In production: log the error but don't crash the app for transient issues
    }
}

// 10. Configure Middleware Pipeline
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseCors("ReactApp");
app.UseMiddleware<LanguageMiddleware>(); // Keep the custom language middleware
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();

// 11. Health Check Endpoint (used by Keep-Alive task)
app.MapGet("/health", () => Results.Ok(new
{
    status = "healthy",
    timestamp = DateTime.UtcNow,
    service = "MathWorld-Backend"
}));

// 12. Keep-Alive Background Task: Ping both services every 10 minutes
// Prevents Render Free Tier from sleeping (sleep timeout is 15 minutes)
_ = Task.Run(async () =>
{
    var logger = app.Services.GetRequiredService<ILogger<Program>>();
    var factory = app.Services.GetRequiredService<IHttpClientFactory>();

    var targets = new[]
    {
        "https://mathwordbackend.onrender.com/health",      // Backend service itself
        "https://mathworld-search.onrender.com/health"      // Meilisearch service
    };

    logger.LogInformation("Keep-alive task started - pinging every 10 minutes");

    while (true)
    {
        await Task.Delay(TimeSpan.FromMinutes(10)); // Ping every 10 minutes (less than 15 min sleep threshold)

        foreach (var url in targets)
        {
            try
            {
                var client = factory.CreateClient("KeepAlive");
                client.Timeout = TimeSpan.FromSeconds(30);

                var response = await client.GetAsync(url);
                var content = await response.Content.ReadAsStringAsync();

                // Verify response is JSON, not HTML (Render sleep page)
                if (response.IsSuccessStatusCode && content.TrimStart().StartsWith("{"))
                {
                    logger.LogInformation("Keep-alive ping {Url} -> {Status}", url, response.StatusCode);
                }
                else
                {
                    logger.LogWarning("Keep-alive ping {Url} returned unexpected content: {ContentType}",
                        url, response.Content.Headers.ContentType?.MediaType);
                }
            }
            catch (TaskCanceledException)
            {
                logger.LogWarning("Keep-alive timeout for {Url}", url);
            }
            catch (Exception ex)
            {
                logger.LogWarning("Keep-alive ping failed for {Url}: {Error}", url, ex.Message);
            }
        }
    }
});

Console.WriteLine("MathWorld API is running!");
Console.WriteLine("Swagger UI: https://localhost:7000/swagger");

app.Run();