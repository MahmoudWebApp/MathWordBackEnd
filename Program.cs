// ============================================================================
// File: Program.cs
// Description: Main application entry point for MathWorld API
// Configures services, middleware, Swagger, authentication, and CORS
// ============================================================================

using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using MathWorldAPI.Data;
using MathWorldAPI.Middleware;
using MathWorldAPI.Services;
using MathWorldAPI.Filters;

var builder = WebApplication.CreateBuilder(args);

// ✅ FIX: Force WebRootPath to a specific physical path for Docker/Render environments
// This guarantees that _environment.WebRootPath will never be null.
builder.Environment.WebRootPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");

// ============================================================================
// 1. Configure DbContext with PostgreSQL
// ============================================================================
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection")));

// ============================================================================
// 2. Register Application Services
// ============================================================================
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IMeiliSearchService, MeiliSearchService>();

// ============================================================================
// 3. Configure JWT Authentication
// ============================================================================
var jwtKey = builder.Configuration["Jwt:Key"] ?? "MathWorldSuperSecretKey2025!@#$%";
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.RequireHttpsMetadata = false;
    options.SaveToken = true;
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtKey)),
        ValidateIssuer = !string.IsNullOrEmpty(builder.Configuration["Jwt:Issuer"]),
        ValidateAudience = !string.IsNullOrEmpty(builder.Configuration["Jwt:Audience"]),
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        ClockSkew = TimeSpan.Zero
    };
});

// ============================================================================
// 4. Configure Authorization Policies
// ============================================================================
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("AdminOnly", policy => policy.RequireRole("Admin"));
    options.AddPolicy("StudentOnly", policy => policy.RequireRole("Student"));
});

// ============================================================================
// 5. Configure Form Options for File Uploads (FormData/Multipart)
// ============================================================================
builder.Services.Configure<FormOptions>(options =>
{
    // Maximum size for multipart form data (10 MB)
    options.MultipartBodyLengthLimit = 10 * 1024 * 1024;
    // Maximum size for individual form values (2 MB)
    options.ValueLengthLimit = 2 * 1024 * 1024;
    // Maximum number of form values allowed
    options.ValueCountLimit = 1000;
});

// ============================================================================
// 6. Configure Controllers with JSON Serialization Options
// ============================================================================
builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        // Ignore reference cycles to prevent serialization errors
        options.JsonSerializerOptions.ReferenceHandler =
            System.Text.Json.Serialization.ReferenceHandler.IgnoreCycles;
        // Keep property names in PascalCase (match C# conventions)
        options.JsonSerializerOptions.PropertyNamingPolicy = null;
        // Don't serialize null properties to reduce response size
        options.JsonSerializerOptions.DefaultIgnoreCondition =
            System.Text.Json.Serialization.JsonIgnoreCondition.WhenWritingNull;
    });

// ============================================================================
// 7. Configure Swagger/OpenAPI Documentation
// ============================================================================
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "MathWorld API",
        Version = "v1",
        Description = "API for MathWorld - Math Problems Platform"
    });

    // ✅ JWT Bearer Authentication - Enter token WITHOUT the word 'Bearer'
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

    // ✅ Dynamic FormData Filter - Auto-documents any [FromForm] endpoint
    c.OperationFilter<MathWorldAPI.Filters.DynamicFormDataOperationFilter>();
});

// ============================================================================
// 8. Configure CORS for React/Vue/Angular Frontend
// ============================================================================
builder.Services.AddCors(options =>
{
    options.AddPolicy("ReactApp", policy =>
    {
        policy.WithOrigins(
                "http://localhost:3000",      // React default port
                "http://localhost:3001",      // React alternate port
                "http://localhost:5173",      // Vite default port
                "https://your-frontend.onrender.com" // Production frontend URL
            )
            .AllowAnyHeader()
            .AllowAnyMethod()
            .AllowCredentials(); // Required for JWT cookies if used
    });
});

// ============================================================================
// 9. Register HttpClient for Keep-Alive Background Pings
// ============================================================================
builder.Services.AddHttpClient("KeepAlive", client =>
{
    client.Timeout = TimeSpan.FromSeconds(30);
});
builder.Services.AddHttpClient<IImgBbStorageService, ImgBbStorageService>();
// ============================================================================
// Build the Application
// ============================================================================
var app = builder.Build();

// ============================================================================
// 10. Apply Database Migrations on Startup (Development Convenience)
// ============================================================================
using (var scope = app.Services.CreateScope())
{
    var dbContext = scope.ServiceProvider.GetRequiredService<AppDbContext>();
    try
    {
        await dbContext.Database.MigrateAsync();
        Console.WriteLine("✅ Database migrated successfully!");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"❌ Database migration error: {ex.Message}");
    }
}

// ============================================================================
// 11. Configure Middleware Pipeline (Order Matters!)
// ============================================================================

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "MathWorld API v1");
        c.RoutePrefix = "swagger";
    });
}

// Security middleware - redirect HTTP to HTTPS
app.UseHttpsRedirection();

// CORS must come before authentication
app.UseCors("ReactApp");

// ✅ FIX: This line is required to serve images from the wwwroot folder to React
app.UseStaticFiles();

// Custom middleware for language detection/logging
app.UseMiddleware<LanguageMiddleware>();

// Authentication and Authorization middleware
app.UseAuthentication();
app.UseAuthorization();

// Map controller endpoints to routes
app.MapControllers();

// ============================================================================
// 12. Health Check Endpoint (for load balancers and monitoring)
// ============================================================================
app.MapGet("/health", () => Results.Ok(new
{
    status = "healthy",
    timestamp = DateTime.UtcNow,
    service = "MathWorld-Backend",
    version = "1.0.0"
}));

// ============================================================================
// 13. Keep-Alive Background Task (Prevent Render/Railway sleep)
// ============================================================================
_ = Task.Run(async () =>
{
    var logger = app.Services.GetRequiredService<ILogger<Program>>();
    var factory = app.Services.GetRequiredService<IHttpClientFactory>();

    var targets = new[]
    {
        "https://mathwordbackend.onrender.com/health",
        "https://mathworld-search.onrender.com/health"
    };

    logger.LogInformation("🔄 Keep-alive task started - pinging every 10 minutes");

    while (true)
    {
        await Task.Delay(TimeSpan.FromMinutes(10));

        foreach (var url in targets)
        {
            try
            {
                var client = factory.CreateClient("KeepAlive");
                var response = await client.GetAsync(url);
                var content = await response.Content.ReadAsStringAsync();

                if (response.IsSuccessStatusCode && content.TrimStart().StartsWith("{"))
                {
                    logger.LogInformation("✅ Keep-alive ping {Url} -> {Status}", url, response.StatusCode);
                }
                else
                {
                    logger.LogWarning("⚠️ Keep-alive ping {Url} returned unexpected: {ContentType}",
                        url, response.Content.Headers.ContentType?.MediaType);
                }
            }
            catch (TaskCanceledException)
            {
                logger.LogWarning("⏱️ Keep-alive timeout for {Url}", url);
            }
            catch (Exception ex)
            {
                logger.LogWarning("❌ Keep-alive ping failed for {Url}: {Error}", url, ex.Message);
            }
        }
    }
});

// ============================================================================
// Start the Application
// ============================================================================
Console.WriteLine("🚀 MathWorld API is running!");
Console.WriteLine($"📚 Swagger UI: https://localhost:{builder.Configuration["HttpsPort"] ?? "7000"}/swagger");
Console.WriteLine($"🌐 Base URL: https://localhost:{builder.Configuration["HttpsPort"] ?? "7000"}/api");

app.Run();