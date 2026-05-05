// File: MathWorldAPI/Helpers/LanguageHelper.cs

using Microsoft.AspNetCore.Http;
using System.Globalization;

namespace MathWorldAPI.Helpers
{
    /// <summary>
    /// Helper class for managing multilingual messages and standardized API responses.
    /// Centralizes all user-facing messages and provides consistent response formatting.
    /// </summary>
    public static class LanguageHelper
    {
        /// <summary>
        /// Centralized dictionary containing all application messages in Arabic and English.
        /// Format: { "MessageKey", ("Arabic text", "English text") }
        /// Supports string formatting with placeholders using string.Format().
        /// </summary>
        private static readonly Dictionary<string, (string Ar, string En)> Messages = new()
        {
            // ==================== Authentication Messages ====================
            { "EmailAlreadyExists", ("البريد الإلكتروني مستخدم بالفعل", "Email already exists") },
            { "InvalidCredentials", ("البريد الإلكتروني أو كلمة المرور غير صحيحة", "Invalid email or password") },
            { "RegistrationSuccess", ("تم التسجيل بنجاح", "Registration successful") },
            { "LoginSuccess", ("تم تسجيل الدخول بنجاح", "Login successful") },
            { "AccountDeactivated", ("الحساب معطل. يرجى التواصل مع الدعم.", "Account deactivated. Please contact support.") },
            { "InvalidGoogleToken", ("رمز Google غير صالح", "Invalid Google token") },
            { "InvalidFacebookToken", ("رمز Facebook غير صالح", "Invalid Facebook token") },
            { "Unauthorized", ("غير مصرح لك بالوصول", "Unauthorized access") },

            // ==================== Problem Messages ====================
            { "ProblemNotFound", ("المسألة غير موجودة", "Problem not found") },
            { "ProblemCreated", ("تمت إضافة المسألة بنجاح", "Problem created successfully") },
            { "ProblemUpdated", ("تم تحديث المسألة بنجاح", "Problem updated successfully") },
            { "ProblemDeleted", ("تم حذف المسألة بنجاح", "Problem deleted successfully") },
            { "OptionsCountError", ("يجب إدخال 4 خيارات بالضبط", "You must enter exactly 4 options") },
            { "CorrectOptionError", ("يجب وجود إجابة صحيحة واحدة فقط", "There must be exactly one correct answer") },
            { "AnswerCorrect", ("✅ أحسنت! إجابتك صحيحة", "✅ Excellent! Your answer is correct") },
            { "AnswerWrong", ("❌ إجابتك غير صحيحة. الإجابة الصحيحة هي: {0}", "❌ Your answer is incorrect. The correct answer is: {0}") },
            { "AlreadySolved", ("لقد قمت بحل هذه المسألة مسبقاً", "You have already solved this problem") },
            { "RequiresLogin", ("🔐 سجل دخولك أو أنشئ حساباً مجاناً لحل هذه المسألة", "🔐 Please login or create a free account to solve this problem") },
            { "OptionNotFound", ("الخيار المحدد غير موجود", "Selected option not found") },

            // ==================== Category Messages ====================
            { "CategoryNotFound", ("التصنيف غير موجود", "Category not found") },
            { "CategoryCreated", ("تمت إضافة التصنيف بنجاح", "Category created successfully") },
            { "CategoryUpdated", ("تم تحديث التصنيف بنجاح", "Category updated successfully") },
            { "CategoryDeleted", ("تم حذف التصنيف بنجاح", "Category deleted successfully") },
            { "CategoryHasProblems", ("لا يمكن حذف التصنيف لوجود مسائل تابعة له", "Cannot delete category because it has associated problems") },

            // ==================== Tag Messages ====================
            { "TagNotFound", ("التاغ غير موجود", "Tag not found") },
            { "TagCreated", ("تمت إضافة التاغ بنجاح", "Tag created successfully") },
            { "TagUpdated", ("تم تحديث التاغ بنجاح", "Tag updated successfully") },
            { "TagDeleted", ("تم حذف التاغ بنجاح", "Tag deleted successfully") },

            // ==================== User Messages ====================
            { "UserNotFound", ("المستخدم غير موجود", "User not found") },
            { "UserUpdated", ("تم تحديث المستخدم بنجاح", "User updated successfully") },
            { "UserDeleted", ("تم حذف المستخدم بنجاح", "User deleted successfully") },
            { "UserActivated", ("تم تفعيل المستخدم بنجاح", "User activated successfully") },
            { "UserDeactivated", ("تم تعطيل المستخدم بنجاح", "User deactivated successfully") },
            { "CannotDeleteAdmin", ("لا يمكن حذف المستخدم الرئيسي", "Cannot delete the main admin user") },

            // ==================== Favorite Messages ====================
            { "AddedToFavorites", ("تمت الإضافة إلى المفضلة", "Added to favorites") },
            { "RemovedFromFavorites", ("تمت الإزالة من المفضلة", "Removed from favorites") },

            // ==================== Search Messages ====================
            { "SearchQueryEmpty", ("الرجاء إدخال نص البحث", "Please enter search text") },
            { "NoResultsFound", ("لا توجد نتائج مطابقة لبحثك", "No results found for your search") },

            // ==================== General Messages ====================
            { "Success", ("تمت العملية بنجاح", "Operation completed successfully") },
            { "ServerError", ("حدث خطأ في الخادم", "Internal server error") },
            { "BadRequest", ("طلب غير صالح", "Bad request") },
            { "NotFound", ("المورد غير موجود", "Resource not found") },
            { "ValidationError", ("خطأ في التحقق من البيانات", "Validation error") }
        };

        /// <summary>
        /// Retrieves a localized message by its key identifier.
        /// Falls back to the message key itself if the key is not found.
        /// Supports string formatting with optional arguments.
        /// </summary>
        /// <param name="key">The unique message key identifier</param>
        /// <param name="language">Language code: "ar" for Arabic, "en" for English (default: "ar")</param>
        /// <param name="args">Optional format arguments for placeholder substitution</param>
        /// <returns>Localized message string with placeholders replaced if arguments provided</returns>
        public static string GetMessage(string key, string language = "ar", params object[] args)
        {
            if (!Messages.TryGetValue(key, out var message))
                return key; // Fallback: return the key itself if not found

            var text = language == "en" ? message.En : message.Ar;
            return args.Length > 0 ? string.Format(CultureInfo.InvariantCulture, text, args) : text;
        }

        /// <summary>
        /// Creates a standardized success response wrapped in ApiResponse{T}.
        /// </summary>
        /// <typeparam name="T">The type of the data payload</typeparam>
        /// <param name="data">The actual data to return to the client</param>
        /// <param name="messageKey">Message key for localization lookup</param>
        /// <param name="language">Language code for message localization</param>
        /// <param name="statusCode">HTTP status code (default: 200)</param>
        /// <param name="meta">Optional metadata for pagination or search context</param>
        /// <param name="args">Optional format arguments for the message</param>
        /// <returns>ApiResponse object with Success=true and populated data</returns>
        public static ApiResponse<T> SuccessResponse<T>(
            T? data,
            string messageKey,
            string language = "ar",
            int statusCode = 200,
            MetaData? meta = null,
            params object[] args)
        {
            var message = GetMessage(messageKey, language, args);
            return new ApiResponse<T>(data, message, statusCode, meta);
        }

        /// <summary>
        /// Creates a standardized error response wrapped in ApiResponse{T}.
        /// </summary>
        /// <typeparam name="T">Type parameter (usually object for error responses)</typeparam>
        /// <param name="messageKey">Message key for localization lookup</param>
        /// <param name="language">Language code for message localization</param>
        /// <param name="statusCode">HTTP error status code (default: 400)</param>
        /// <param name="errors">Optional dictionary of field-specific validation errors</param>
        /// <param name="args">Optional format arguments for the message</param>
        /// <returns>ApiResponse object with Success=false and error details</returns>
        public static ApiResponse<T> ErrorResponse<T>(
            string messageKey,
            string language = "ar",
            int statusCode = 400,
            Dictionary<string, List<string>>? errors = null,
            params object[] args)
        {
            var message = GetMessage(messageKey, language, args);
            return new ApiResponse<T>(message, statusCode, errors);
        }

        /// <summary>
        /// Extracts the user's preferred language from the HTTP request's Accept-Language header.
        /// Defaults to Arabic ("ar") if no preference is specified or if the language is unsupported.
        /// </summary>
        /// <param name="request">The incoming HTTP request containing headers</param>
        /// <returns>Language code: "ar" for Arabic or "en" for English</returns>
        public static string GetLanguageFromRequest(HttpRequest request)
        {
            var acceptLanguage = request.Headers["Accept-Language"].FirstOrDefault();

            if (string.IsNullOrWhiteSpace(acceptLanguage))
                return "ar";

            // Extract primary language code (e.g., "en-US" -> "en")
            var primaryLang = acceptLanguage.Split(',').FirstOrDefault()?.Split(';').FirstOrDefault()?.Trim();

            return string.Equals(primaryLang, "en", StringComparison.OrdinalIgnoreCase) ||
                   (primaryLang?.StartsWith("en-", StringComparison.OrdinalIgnoreCase) == true)
                ? "en"
                : "ar";
        }
    }
}