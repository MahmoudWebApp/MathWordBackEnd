namespace MathWorldAPI.Services;

// Read-only, deterministic achievement rules. A badge never grants points,
// unlocks Premium, or writes a separate claim record.
public sealed record StudentBadge(string Key,string TitleAr,string TitleEn,int RequiredSolved,
    bool IsAvailable,bool Earned,int CurrentProgress,string Unit,string Icon,string DescriptionAr,string DescriptionEn);

public static class StudentBadgeRules
{
    public static StudentBadge Create(string key,string ar,string en,int target,int progress,
        bool available,string unit,string icon,string descriptionAr,string descriptionEn)
    {
        target=Math.Max(1,target);
        progress=Math.Clamp(progress,0,target);
        return new(key,ar,en,target,available,available&&progress>=target,progress,unit,icon,descriptionAr,descriptionEn);
    }

    public static IReadOnlyList<StudentBadge> GradeBadges(string prefix,string gradeAr,string gradeEn,
        int total,int solved,int mastered,int completedCategories,int categoryCount,int independent,int streak,
        bool premium,bool isGrade)
    {
        var result=new List<StudentBadge>();
        void Add(string key,string ar,string en,int target,int progress,bool available,string unit,string icon,string descAr,string descEn)
            =>result.Add(Create(prefix+key,ar,en,target,progress,available,unit,icon,descAr,descEn));
        if(total>0)
        {
            Add("grade_scholar",isGrade?"طالب الصف المتميز":"طالب المرحلة المتميز",isGrade?"Grade Scholar":"Stage Scholar",
                (total+1)/2,solved,premium,"problems","graduation",
                $"أكمل 50% على الأقل من مسائل {gradeAr}.",$"Complete at least 50% of problems in {gradeEn}.");
            Add("grade_champion",isGrade?"بطل الصف":"بطل المرحلة",isGrade?"Grade Champion":"Stage Champion",
                total,solved,premium,"problems","trophy",$"أكمل جميع مسائل {gradeAr}.",$"Complete every problem in {gradeEn}.");
            Add("grade_master",isGrade?"أستاذ الصف":"أستاذ المرحلة",isGrade?"Grade Master":"Stage Master",
                total,mastered,premium,"mastered","crown",$"أتقن جميع مسائل {gradeAr}.",$"Master every problem in {gradeEn}.");
        }
        if(categoryCount>=1)
            Add("category_expert","خبير الفئة","Category Expert",1,completedCategories,premium,"categories","puzzle",
                "أكمل جميع مسائل فئة واحدة.","Complete every problem in one category.");
        if(categoryCount>=3)
            Add("multi_skilled","متعدد المهارات","Multi-skilled",3,completedCategories,premium,"categories","gem",
                "أكمل ثلاث فئات مختلفة.","Complete three different categories.");
        if(total>=10)
            Add("perfect_solver","الحل المثالي","Perfect Solver",10,independent,premium,"problems","target",
                "حل 10 مسائل مختلفة من أول محاولة دون تلميح.","Solve 10 distinct problems on the first attempt without hints.");
        Add("week_streak","الطالب المثابر","Dedicated Student",7,streak,true,"days","flame",
            "سجّل محاولة حقيقية في 7 أيام متتالية (UTC).","Record an actual attempt on 7 consecutive UTC days.");
        Add("month_streak","تحدي الشهر","Monthly Challenge",30,streak,premium,"days","bolt",
            "سجّل محاولة حقيقية في 30 يوماً متتالياً (UTC).","Record an actual attempt on 30 consecutive UTC days.");
        return result;
    }

    // Longest historical streak: taking a break does not erase a completed streak.
    public static int LongestStreak(IEnumerable<DateTime> dates)
    {
        var best=0;var current=0;DateTime? previous=null;
        foreach(var date in dates.Select(d=>d.Date).Distinct().OrderBy(d=>d))
        {
            current=previous.HasValue&&(date-previous.Value).Days==1?current+1:1;
            best=Math.Max(best,current);previous=date;
        }
        return best;
    }
}
