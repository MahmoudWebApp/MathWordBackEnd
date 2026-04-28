namespace MathWorldAPI.Helpers
{
    public static class LanguageHelper
    {
        private static readonly Dictionary<string, (string Ar, string En)> Messages = new()
        {
            // Auth
            { "EmailAlreadyExists", ("البريد الإلكتروني مستخدم بالفعل", "Email already exists") },
            { "InvalidCredentials", ("البريد الإلكتروني أو كلمة المرور غير صحيحة", "Invalid email or password") },
            { "RegistrationSuccess", ("تم التسجيل بنجاح", "Registration successful") },
            { "LoginSuccess", ("تم تسجيل الدخول بنجاح", "Login successful") },
            { "AccountDeactivated", ("الحساب معطل. يرجى التواصل مع الدعم.", "Account deactivated. Please contact support.") },
            { "InvalidGoogleToken", ("رمز Google غير صالح", "Invalid Google token") },
            { "InvalidFacebookToken", ("رمز Facebook غير صالح", "Invalid Facebook token") },
            
            // Problems
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
            
            // Categories
            { "CategoryNotFound", ("التصنيف غير موجود", "Category not found") },
            { "CategoryCreated", ("تمت إضافة التصنيف بنجاح", "Category created successfully") },
            { "CategoryUpdated", ("تم تحديث التصنيف بنجاح", "Category updated successfully") },
            { "CategoryDeleted", ("تم حذف التصنيف بنجاح", "Category deleted successfully") },
            { "CategoryHasProblems", ("لا يمكن حذف التصنيف لوجود مسائل تابعة له", "Cannot delete category because it has associated problems") },
            
            // Tags
            { "TagNotFound", ("التاغ غير موجود", "Tag not found") },
            { "TagCreated", ("تمت إضافة التاغ بنجاح", "Tag created successfully") },
            { "TagUpdated", ("تم تحديث التاغ بنجاح", "Tag updated successfully") },
            { "TagDeleted", ("تم حذف التاغ بنجاح", "Tag deleted successfully") },
            
            // Favorites
            { "AddedToFavorites", ("تمت الإضافة إلى المفضلة", "Added to favorites") },
            { "RemovedFromFavorites", ("تمت الإزالة من المفضلة", "Removed from favorites") },
            
            // Users
            { "UserNotFound", ("المستخدم غير موجود", "User not found") },
            { "UserUpdated", ("تم تحديث المستخدم بنجاح", "User updated successfully") },
            { "UserDeleted", ("تم حذف المستخدم بنجاح", "User deleted successfully") },
            { "UserActivated", ("تم تفعيل المستخدم بنجاح", "User activated successfully") },
            { "UserDeactivated", ("تم تعطيل المستخدم بنجاح", "User deactivated successfully") },
            { "CannotDeleteAdmin", ("لا يمكن حذف المستخدم الرئيسي", "Cannot delete the main admin user") },
            
            // Search
            { "SearchQueryEmpty", ("الرجاء إدخال نص البحث", "Please enter search text") },
            { "NoResultsFound", ("لا توجد نتائج مطابقة لبحثك", "No results found for your search") },
            
            // General
            { "Unauthorized", ("غير مصرح لك بالوصول", "Unauthorized access") },
            { "ServerError", ("حدث خطأ في الخادم", "Internal server error") }
        };

        public static string GetMessage(string key, string language = "ar", params object[] args)
        {
            if (!Messages.TryGetValue(key, out var message))
                return key;

            var text = language == "en" ? message.En : message.Ar;
            return args.Length > 0 ? string.Format(text, args) : text;
        }

        public static object SuccessResponse(string key, string language = "ar", object? data = null, params object[] args)
        {
            return new
            {
                Success = true,
                Message = string.IsNullOrEmpty(key) ? "" : GetMessage(key, language, args),
                Data = data,
                Timestamp = DateTime.UtcNow
            };
        }

        public static object ErrorResponse(string key, string language = "ar", int statusCode = 400, params object[] args)
        {
            return new
            {
                Success = false,
                Message = GetMessage(key, language, args),
                StatusCode = statusCode,
                Timestamp = DateTime.UtcNow
            };
        }

        public static string GetLanguageFromRequest(HttpRequest request)
        {
            var lang = request.Headers["Accept-Language"].ToString();
            return string.IsNullOrEmpty(lang) ? "ar" : (lang.StartsWith("en") ? "en" : "ar");
        }
    }
}