// File: MathWorldAPI/Services/ImgBbStorageService.cs

using System.Net.Http.Headers;
using System.Text.Json;

namespace MathWorldAPI.Services
{
    public interface IImgBbStorageService
    {
        Task<string> UploadFileAsync(IFormFile file);
        string? GetFullUrl(string? relativePath);
        Task DeleteFileAsync(string? relativePath);
    }

    public class ImgBbStorageService : IImgBbStorageService
    {
        private readonly HttpClient _httpClient;
        private readonly string? _apiKey;

        public ImgBbStorageService(IConfiguration config, HttpClient httpClient)
        {
            _apiKey = config["IMGBB_API_KEY"];
            _httpClient = httpClient;
        }

        /// <summary>
        /// Uploads an image to ImgBB and returns the full public URL.
        /// </summary>
        public async Task<string> UploadFileAsync(IFormFile file)
        {
            if (string.IsNullOrEmpty(_apiKey))
                throw new Exception("ImgBB API Key is missing in Environment Variables.");

            // Read file and convert to Base64 (ImgBB requirement)
            using var ms = new MemoryStream();
            await file.CopyToAsync(ms);
            var base64String = Convert.ToBase64String(ms.ToArray());

            // Prepare the API request
            var content = new MultipartFormDataContent();
            content.Add(new StringContent(_apiKey), "key");
            content.Add(new StringContent(base64String), "image");

            var response = await _httpClient.PostAsync("https://api.imgbb.com/1/upload", content);
            response.EnsureSuccessStatusCode();

            // Parse the response to get the URL
            var jsonResponse = await response.Content.ReadAsStringAsync();
            using var doc = JsonDocument.Parse(jsonResponse);
            var url = doc.RootElement.GetProperty("data").GetProperty("display_url").GetString();

            return url ?? string.Empty;
        }

        /// <summary>
        /// Returns the URL directly (ImgBB stores full URLs in DB).
        /// </summary>
        public string? GetFullUrl(string? relativePath)
        {
            if (string.IsNullOrEmpty(relativePath)) return string.Empty;
            if (relativePath.StartsWith("http")) return relativePath;
            return relativePath;
        }

        /// <summary>
        /// ImgBB free API does not support programmatic deletion.
        /// This method is a no-op to maintain interface compatibility.
        /// </summary>
        public Task DeleteFileAsync(string? relativePath)
        {
            // لا يمكن حذف الصور مجانياً عبر API في ImgBB، لذا نتجاهل الحذف
            return Task.CompletedTask;
        }
    }
}