// File: MathWorldAPI/Helpers/ApiResponse.cs

using System.Text.Json.Serialization;

namespace MathWorldAPI.Helpers
{
    /// <summary>
    /// Standardized API response wrapper for consistent client communication.
    /// Provides a uniform structure for success and error responses across all endpoints.
    /// </summary>
    /// <typeparam name="T">The type of data being returned in successful responses</typeparam>
    public class ApiResponse<T>
    {
        /// <summary>
        /// Indicates whether the operation was successful (true) or failed (false)
        /// </summary>
        public bool Success { get; set; }

        /// <summary>
        /// Human-readable message describing the result of the operation.
        /// This message is localized based on the requested language.
        /// </summary>
        public string Message { get; set; } = string.Empty;

        /// <summary>
        /// HTTP status code representing the outcome of the request.
        /// Examples: 200 (OK), 201 (Created), 400 (Bad Request), 404 (Not Found), 500 (Server Error)
        /// </summary>
        public int StatusCode { get; set; }

        /// <summary>
        /// The actual data payload returned on successful operations.
        /// This property is null for error responses.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public T? Data { get; set; }

        /// <summary>
        /// Dictionary containing validation errors or field-specific error messages.
        /// Used primarily for Bad Request (400) responses with model validation failures.
        /// Format: { "fieldName": ["error1", "error2"] }
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public Dictionary<string, List<string>>? Errors { get; set; }

        /// <summary>
        /// Additional metadata for paginated or filtered responses.
        /// Contains information like total count, current page, page size, etc.
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public MetaData? Meta { get; set; }

        /// <summary>
        /// UTC timestamp indicating when the response was generated.
        /// Useful for debugging and caching strategies.
        /// </summary>
        public DateTime Timestamp { get; set; } = DateTime.UtcNow;

        /// <summary>
        /// Constructor for successful API responses.
        /// </summary>
        /// <param name="data">The data payload to return</param>
        /// <param name="message">Success message (will be localized)</param>
        /// <param name="statusCode">HTTP status code (default: 200)</param>
        /// <param name="meta">Optional pagination or search metadata</param>
        public ApiResponse(T? data, string message, int statusCode = 200, MetaData? meta = null)
        {
            Success = true;
            Data = data;
            Message = message;
            StatusCode = statusCode;
            Meta = meta;
        }

        /// <summary>
        /// Constructor for error API responses.
        /// </summary>
        /// <param name="message">Error message (will be localized)</param>
        /// <param name="statusCode">HTTP error status code</param>
        /// <param name="errors">Optional field-specific validation errors</param>
        public ApiResponse(string message, int statusCode, Dictionary<string, List<string>>? errors = null)
        {
            Success = false;
            Message = message;
            StatusCode = statusCode;
            Errors = errors;
        }

        /// <summary>
        /// Parameterless constructor required for JSON serialization/deserialization.
        /// </summary>
        public ApiResponse() { }
    }

    /// <summary>
    /// Metadata container for paginated, filtered, or search responses.
    /// Provides additional context about the returned data collection.
    /// </summary>
    public class MetaData
    {
        /// <summary>
        /// Total number of items available across all pages
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public int? Total { get; set; }

        /// <summary>
        /// Current page number (1-based index)
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public int? Page { get; set; }

        /// <summary>
        /// Number of items returned per page
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public int? PageSize { get; set; }

        /// <summary>
        /// Total number of pages available based on total items and page size
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public int? TotalPages { get; set; }

        /// <summary>
        /// Type of search engine used (e.g., "Meilisearch", "PostgreSQL")
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public string? SearchType { get; set; }

        /// <summary>
        /// The original search query string
        /// </summary>
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
        public string? Query { get; set; }
    }
}