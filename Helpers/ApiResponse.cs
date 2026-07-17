// File: MathWorldAPI/Helpers/ApiResponse.cs

using System.Text.Json.Serialization;

namespace MathWorldAPI.Helpers
{
    /// <summary>
    /// Standardized API response wrapper for consistent client communication.
    /// Provides a uniform structure for success and error responses.
    /// </summary>
    /// <typeparam name="T">
    /// The type of data returned in successful responses.
    /// </typeparam>
    public class ApiResponse<T>
    {
        /// <summary>
        /// Indicates whether the operation succeeded.
        /// </summary>
        public bool Success { get; set; }

        /// <summary>
        /// Human-readable localized response message.
        /// </summary>
        public string Message { get; set; } = string.Empty;

        /// <summary>
        /// HTTP status code represented by the response.
        /// </summary>
        public int StatusCode { get; set; }

        /// <summary>
        /// The returned data payload.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public T? Data { get; set; }

        /// <summary>
        /// Validation or field-specific errors.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public Dictionary<string, List<string>>? Errors { get; set; }

        /// <summary>
        /// Pagination or search metadata.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public MetaData? Meta { get; set; }

        /// <summary>
        /// Unique request identifier used for log correlation.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public string? CorrelationId { get; set; }

        /// <summary>
        /// UTC timestamp indicating when the response was generated.
        /// </summary>
        public DateTime Timestamp { get; set; } =
            DateTime.UtcNow;

        /// <summary>
        /// Initializes a successful API response.
        /// </summary>
        public ApiResponse(
            T? data,
            string message,
            int statusCode = 200,
            MetaData? meta = null)
        {
            Success = true;
            Data = data;
            Message = message;
            StatusCode = statusCode;
            Meta = meta;
        }

        /// <summary>
        /// Initializes an error API response.
        /// </summary>
        public ApiResponse(
            string message,
            int statusCode,
            Dictionary<string, List<string>>? errors = null)
        {
            Success = false;
            Message = message;
            StatusCode = statusCode;
            Errors = errors;
        }

        /// <summary>
        /// Parameterless constructor required for serialization.
        /// </summary>
        public ApiResponse()
        {
        }
    }

    /// <summary>
    /// Metadata container for paginated or filtered responses.
    /// </summary>
    public class MetaData
    {
        /// <summary>
        /// Total number of available items.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public int? Total { get; set; }

        /// <summary>
        /// Current one-based page number.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public int? Page { get; set; }

        /// <summary>
        /// Number of returned items per page.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public int? PageSize { get; set; }

        /// <summary>
        /// Total number of pages.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public int? TotalPages { get; set; }

        /// <summary>
        /// Search engine used to process the request.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public string? SearchType { get; set; }

        /// <summary>
        /// Original search query.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public string? Query { get; set; }
    }
}