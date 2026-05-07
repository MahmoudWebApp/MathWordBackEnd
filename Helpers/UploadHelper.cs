// File: MathWorldAPI/Helpers/UploadHelper.cs

using Microsoft.AspNetCore.Http;

namespace MathWorldAPI.Helpers
{
    /// <summary>
    /// Shared helper methods for file uploads and URL generation.
    /// Used by multiple controllers to avoid code duplication.
    /// </summary>
    public static class UploadHelper
    {
        /// <summary>
        /// Returns the base wwwroot path, handles null WebRootPath on Render/Docker environments
        /// </summary>
        public static string GetBaseUploadPath(IWebHostEnvironment environment)
        {
            return !string.IsNullOrEmpty(environment.WebRootPath)
                ? environment.WebRootPath
                : Path.Combine(environment.ContentRootPath, "wwwroot");
        }

        /// <summary>
        /// Dynamically builds the full URL for an image path based on the current request context.
        /// </summary>
        public static string? GetFullImageUrl(HttpRequest request, string? relativePath)
        {
            if (string.IsNullOrEmpty(relativePath)) return null;
            if (relativePath.StartsWith("http")) return relativePath;

            // Handle Render/Cloudflare proxies which terminate SSL
            var scheme = request.Headers["X-Forwarded-Proto"].FirstOrDefault() ?? request.Scheme;
            var baseUrl = $"{scheme}://{request.Host}{request.PathBase}";

            return $"{baseUrl}{relativePath}";
        }

        /// <summary>
        /// Returns the uploads/categories folder path and creates it if it doesn't exist.
        /// </summary>
        public static string GetUploadsFolderPath(IWebHostEnvironment environment)
        {
            var basePath = GetBaseUploadPath(environment);
            var folder = Path.Combine(basePath, "uploads", "categories");
            Directory.CreateDirectory(folder);
            return folder;
        }

        /// <summary>
        /// Validates file extension against allowed types
        /// </summary>
        public static bool IsValidImageExtension(string fileName, out string extension)
        {
            var allowed = new[] { ".jpg", ".jpeg", ".png", ".svg", ".webp" };
            extension = Path.GetExtension(fileName).ToLowerInvariant();
            return allowed.Contains(extension);
        }

        /// <summary>
        /// Deletes a file if it exists, safely handling relative paths
        /// </summary>
        public static void DeleteFileIfExists(IWebHostEnvironment environment, string? relativePath)
        {
            if (string.IsNullOrEmpty(relativePath)) return;

            var fullPath = Path.Combine(GetBaseUploadPath(environment), relativePath.TrimStart('/'));
            if (System.IO.File.Exists(fullPath))
                System.IO.File.Delete(fullPath);
        }

        /// <summary>
        /// Saves an uploaded file with a unique GUID name and returns the relative path
        /// </summary>
        public static async Task<string> SaveFileAsync(IWebHostEnvironment environment, IFormFile file, string subFolder = "categories")
        {
            if (!IsValidImageExtension(file.FileName, out var ext))
                throw new ArgumentException($"Invalid file extension: {ext}");

            var folder = Path.Combine(GetBaseUploadPath(environment), "uploads", subFolder);
            Directory.CreateDirectory(folder);

            var fileName = $"{Guid.NewGuid()}{ext}";
            var filePath = Path.Combine(folder, fileName);

            using var stream = new FileStream(filePath, FileMode.Create);
            await file.CopyToAsync(stream);

            return $"/uploads/{subFolder}/{fileName}";
        }
    }
}