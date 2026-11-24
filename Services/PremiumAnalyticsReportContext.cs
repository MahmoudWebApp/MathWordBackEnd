using System.Globalization;
using MathWorldAPI.Controllers;

namespace MathWorldAPI.Services;

/// <summary>Shared localized interpretation of the report's actual filters and measurement basis.</summary>
public static class PremiumAnalyticsReportContext
{
    public static IReadOnlyList<string> Lines(StudentPremiumAnalyticsController.StudentAnalyticsReport report,bool ar)
    {
        string Name(string? name,bool selected)=>!string.IsNullOrWhiteSpace(name)?name:
            selected?(ar?"اختيار محدد":"Selected filter"):(ar?"الكل":"All");
        string Day(DateTime date)=>date.ToString("yyyy-MM-dd",CultureInfo.InvariantCulture);
        var lines=new List<string>{
            (ar?"المرحلة: ":"Stage: ")+Name(ar?report.FilterStageNameAr:report.FilterStageNameEn,report.FilterStageId.HasValue),
            (ar?"الصف / المساق: ":"Grade / course: ")+Name(ar?report.FilterTrackNameAr:report.FilterTrackNameEn,report.FilterTrackId.HasValue),
            (ar?"الفئة: ":"Category: ")+Name(ar?report.FilterCategoryNameAr:report.FilterCategoryNameEn,report.FilterCategoryId.HasValue),
            (ar?"الفترة (UTC): ":"Period (UTC): ")+(report.WindowStartUtc.HasValue?
                Day(report.WindowStartUtc.Value)+" — "+Day(report.GeneratedAtUtc):
                (ar?"كل السجل حتى ":"All records through ")+Day(report.GeneratedAtUtc))};
        if(report.ScoreBasis=="PermanentAchievements")
        {
            lines.Add(ar?"المحلولة والنقاط: إنجازات فريدة دائمة وفق الفترة؛ تُنسب للمساق الذي حصل فيه الإنجاز الأول عند التصفية.":"Solved and points: unique permanent credits within the period; a track filter attributes the credit to its original earning track.");
            lines.Add(ar?"دفتر الأخطاء: الحالة الحالية، وليس سجلاً تاريخياً للفترة.":"Review errors: current state, not historical errors within the period.");
            lines.Add((ar?"المحاولات في الجلسات الموجهة: ":"Guided-session attempts: ")+report.GuidedAttempts.ToString(CultureInfo.InvariantCulture)+
                (ar?"؛ الوقت المسجل للتدريب العادي فقط.":"; measured time covers ordinary practice only."));
        }
        else lines.Add(ar?"المحلولة: التقدم الحالي؛ المحاولات: السجل المسجل.":"Solved: active progress; attempts: recorded history.");
        return lines;
    }
}
