# See https://aka.ms/customizecontainer to learn how to customize your debug container
# and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# ============================================================================
# Stage 1: Base runtime image (Production)
# ============================================================================
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

# ✅ FIX: Set WebRootPath explicitly for Docker/Linux environments
ENV ASPNETCORE_WEBROOTPATH=/app/wwwroot

# ============================================================================
# Stage 2: Build stage (SDK)
# ============================================================================
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["MathWorldAPI.csproj", "."]
RUN dotnet restore "./MathWorldAPI.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "./MathWorldAPI.csproj" -c $BUILD_CONFIGURATION -o /app/build

# ============================================================================
# Stage 3: Publish stage
# ============================================================================
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./MathWorldAPI.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# ============================================================================
# Stage 4: Final production image
# ============================================================================
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# ✅ FIX: Create wwwroot directories and set permissions as root user, then switch back to app user
USER root
RUN mkdir -p /app/wwwroot/uploads/categories \
    && chmod -R 777 /app/wwwroot \
    && chown -R $APP_UID:$APP_UID /app/wwwroot

USER $APP_UID

# ✅ FIX: Add health check for orchestration platforms (Render, Kubernetes, etc.)
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

ENTRYPOINT ["dotnet", "MathWorldAPI.dll"]