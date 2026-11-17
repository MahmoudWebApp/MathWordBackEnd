using System.ComponentModel.DataAnnotations;

namespace MathWorldAPI.DTOs
{
    public sealed class StudentNotificationDto
    {
        public long Id { get; set; }
        public string Type { get; set; } = string.Empty;
        public string Title { get; set; } = string.Empty;
        public string Body { get; set; } = string.Empty;
        public string? ActionPath { get; set; }
        public DateTime CreatedAt { get; set; }
        public bool IsRead { get; set; }
    }

    public sealed class StudentNotificationPageDto
    {
        public IReadOnlyList<StudentNotificationDto> Notifications { get; set; }
            = Array.Empty<StudentNotificationDto>();
        public int Page { get; set; }
        public int PageSize { get; set; }
        public int Total { get; set; }
        public int UnreadCount { get; set; }
        public bool HasMore { get; set; }
    }

    /// <summary>
    /// Staff announcement request; no recipient IDs are accepted from students.
    /// </summary>
    public sealed class SendStudentAnnouncementDto
    {
        [Required, StringLength(140, MinimumLength = 1)]
        public string TitleAr { get; set; } = string.Empty;

        [Required, StringLength(140, MinimumLength = 1)]
        public string TitleEn { get; set; } = string.Empty;

        [Required, StringLength(1000, MinimumLength = 1)]
        public string BodyAr { get; set; } = string.Empty;

        [Required, StringLength(1000, MinimumLength = 1)]
        public string BodyEn { get; set; } = string.Empty;

        public int? StageId { get; set; }

        [StringLength(200)]
        public string? ActionPath { get; set; }
    }
}