namespace MathWorldAPI.Services;

/// <summary>Fixed, bilingual, non-sensitive previews and allowlisted test messages.
/// Never generates a live authentication token or claims a real event occurred.
/// All variants use the shared platform layout and official-origin CTA.</summary>
public static class EmailTemplateSamples
{
    public static readonly IReadOnlyList<string> Keys=Array.AsReadOnly(new[]{
        "test","password-reset","password-changed","supervisor-invite","welcome",
        "premium-granted","premium-renewed","premium-expired","announcement","certificate-issued"
    });
    public static bool Contains(string? key)=>key!=null&&Keys.Contains(key,StringComparer.Ordinal);
    public static TransactionalEmail Render(PlatformBrandView brand,string language,string key,bool test)
    {
        if(language is not ("ar" or "en")||!Contains(key))throw new ArgumentException("Unknown email sample.");
        var ar=language=="ar";
        var (title,body,path)=key switch
        {
            "password-reset"=>(ar?"استعادة كلمة المرور":"Reset your password",ar?"استخدم الرابط خلال 20 دقيقة. تجاهل الرسالة إذا لم تطلب الاستعادة.":"Use the link within 20 minutes. Ignore this email if you did not request a reset.","/reset-password"),
            "password-changed"=>(ar?"تم تغيير كلمة المرور":"Password changed",ar?"تم تغيير كلمة مرور حسابك. إذا لم تكن أنت، تواصل مع الدعم.":"Your account password changed. If this was not you, contact support.","/contact"),
            "supervisor-invite"=>(ar?"دعوة للانضمام كمشرف":"Supervisor invitation",ar?"دعاك مسؤول المنصة لتعيين كلمة مرور حساب المشرف. استخدم الرابط خلال 20 دقيقة.":"The platform administrator invited you to set your supervisor password. Use the link within 20 minutes.","/reset-password"),
            "welcome"=>(ar?"أهلاً بك في MathWorld":"Welcome to MathWorld",ar?"ابدأ رحلتك التعليمية واختر المرحلة المناسبة.":"Start your learning journey and choose your educational stage.","/"),
            "premium-granted"=>(ar?"تم تفعيل Premium":"Premium activated",ar?"يمكنك الاطلاع على مزايا اشتراكك وتاريخ انتهائه من حسابك.":"See your subscription benefits and expiry date in your account.","/dashboard"),
            "premium-renewed"=>(ar?"تم تجديد Premium":"Premium renewed",ar?"راجع تاريخ انتهاء اشتراكك الجديد في حسابك.":"Check the updated subscription expiry in your account.","/dashboard"),
            "premium-expired"=>(ar?"انتهى اشتراك Premium":"Premium expired",ar?"تبقى إنجازاتك محفوظة. راجع تفاصيل خطتك الحالية من حسابك.":"Your achievements remain saved. Review your current plan in your account.","/dashboard"),
            "announcement"=>(ar?"إشعار من المنصة":"Platform announcement",ar?"راجع صندوق الإشعارات داخل حسابك.":"Open the notification inbox in your account.","/dashboard"),
            "certificate-issued"=>(ar?"شهادتك التعليمية جاهزة":"Your learning certificate is ready",ar?"يمكنك فتح شهاداتك وتنزيلها من حسابك.":"Open your certificates and download them from your account.","/dashboard/certificates"),
            _=>(ar?"رسالة اختبار MathWorld":"MathWorld test email",ar?"هذه رسالة تجريبية من إعدادات الإدارة.":"This is a test email from administration settings.","/")
        };
        // Sample messages are always marked, including previews. No reset
        // fragment, live identity, verification code or student data.
        var prefix=test?(ar?"[اختبار] ":"[TEST] "):(ar?"[معاينة] ":"[PREVIEW] ");
        var disclaimer=ar?"هذه رسالة تجريبية لا تمثل حدثاً حقيقياً، ولا تحتوي رمزاً صالحاً لاستعادة الحساب.":"This sample does not represent a real event and contains no valid account recovery token.";
        return MathWorldEmailLayout.Render(brand,language,prefix+title,disclaimer+"\n\n"+body,
            ar?"زيارة المنصة":"Visit MathWorld",brand.WebsiteUrl+"/"+language+(path=="/"?"":path));
    }
}
