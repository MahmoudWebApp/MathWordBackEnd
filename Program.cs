// =============================================
// File: Program.cs
// =============================================

using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using MathWorldAPI.Data;
using MathWorldAPI.Middleware;
using MathWorldAPI.Services;

var builder = WebApplication.CreateBuilder(args);

// 1. Configure DbContext with PostgreSQL
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection")));

// 2. Register Services
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IMeiliSearchService, MeiliSearchService>();

// 3. Configure JWT Authentication
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

// 7. Configure CORS for React Frontend
builder.Services.AddCors(options =>
{
    options.AddPolicy("ReactApp", policy =>
    {
        policy.WithOrigins(
                "http://localhost:3000",
                "http://localhost:3001",
                "http://localhost:5173",
                "https://your-frontend.onrender.com"
            )
            .AllowAnyHeader()
            .AllowAnyMethod()
            .AllowCredentials();
    });
});

// 8. Register HttpClient for Keep-Alive pings
builder.Services.AddHttpClient("KeepAlive");

var app = builder.Build();

// 9. Apply Database Migrations on Startup
using (var scope = app.Services.CreateScope())
{
    var dbContext = scope.ServiceProvider.GetRequiredService<AppDbContext>();
    try
    {
        await dbContext.Database.MigrateAsync();
        Console.WriteLine("Database migrated successfully!");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Database error: {ex.Message}");
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
app.UseMiddleware<LanguageMiddleware>();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();

// 11. Health Check Endpoint
app.MapGet("/health", () => Results.Ok(new
{
    status = "healthy",
    timestamp = DateTime.UtcNow,
    service = "MathWorld-Backend"
}));

// 12. Keep-Alive Background Task
_ = Task.Run(async () =>
{
    var logger = app.Services.GetRequiredService<ILogger<Program>>();
    var factory = app.Services.GetRequiredService<IHttpClientFactory>();

    var targets = new[]
    {
        "https://mathwordbackend.onrender.com/health",
        "https://mathworld-search.onrender.com/health"
    };

    logger.LogInformation("Keep-alive task started - pinging every 10 minutes");

    while (true)
    {
        await Task.Delay(TimeSpan.FromMinutes(10));

        foreach (var url in targets)
        {
            try
            {
                var client = factory.CreateClient("KeepAlive");
                client.Timeout = TimeSpan.FromSeconds(30);

                var response = await client.GetAsync(url);
                var content = await response.Content.ReadAsStringAsync();

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