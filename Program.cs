using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using MathWorldAPI.Data;
using MathWorldAPI.Middleware;
using MathWorldAPI.Services;

var builder = WebApplication.CreateBuilder(args);

// 1. DbContext with PostgreSQL
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection")));

// 2. Services
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddScoped<IMeiliSearchService, MeiliSearchService>();

// 3. JWT Authentication
var jwtKey = Encoding.ASCII.GetBytes(builder.Configuration["Jwt:Key"] ?? "MathWorldSuperSecretKey2025!@#$%");
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
        IssuerSigningKey = new SymmetricSecurityKey(jwtKey),
        ValidateIssuer = false,
        ValidateAudience = false,
        ClockSkew = TimeSpan.Zero
    };
});

// 4. Authorization Policies
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("AdminOnly", policy => policy.RequireRole("Admin"));
    options.AddPolicy("StudentOnly", policy => policy.RequireRole("Student"));
});

// 5. Controllers
builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.ReferenceHandler = System.Text.Json.Serialization.ReferenceHandler.IgnoreCycles;
        options.JsonSerializerOptions.PropertyNamingPolicy = null;
    });

// 6. Swagger
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

// 7. CORS for React
builder.Services.AddCors(options =>
{
    options.AddPolicy("ReactApp", policy =>
    {
        policy.WithOrigins("http://localhost:3000", "http://localhost:3001", "http://localhost:5173")
              .AllowAnyHeader()
              .AllowAnyMethod()
              .AllowCredentials();
    });
});

var app = builder.Build();

// 8. Database Migration
using (var scope = app.Services.CreateScope())
{
    var dbContext = scope.ServiceProvider.GetRequiredService<AppDbContext>();
    try
    {
        await dbContext.Database.EnsureCreatedAsync();
        Console.WriteLine("✓ Database created successfully!");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"✗ Database error: {ex.Message}");
    }
}

// 9. Pipeline
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

Console.WriteLine("✓ MathWorld API is running!");
Console.WriteLine("✓ Swagger UI: https://localhost:7000/swagger");

app.Run();