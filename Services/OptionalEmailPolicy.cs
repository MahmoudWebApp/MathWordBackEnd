using MathWorldAPI.Models;

namespace MathWorldAPI.Services;

public static class OptionalEmailPolicy
{
    public static bool HasVerifiedAddress(AppUser u)=>!string.IsNullOrWhiteSpace(u.Email)&&
        string.Equals(u.Email,u.VerifiedNotificationEmail,StringComparison.Ordinal);
    public static bool Allows(AppUser u,string key)=>u.IsActive&&u.Role=="Student"&&HasVerifiedAddress(u)&&
        (key switch {
            "certificate-issued"=>u.EmailLearningUpdates,
            "premium-granted" or "premium-renewed" or "premium-expired"=>u.EmailSubscriptionUpdates,
            "announcement"=>u.EmailImportantAnnouncements,
            _=>false
        });
    public static TransactionalEmail Render(PlatformBrandView brand,string locale,string key)
    {
        var ar=locale=="ar";
        var (title,body,path)=key switch {
            "certificate-issued"=>(ar?"شهادتك التعليمية جاهزة":"Your learning certificate is ready",ar?"يمكنك عرض شهادتك وتنزيلها من حسابك.":"View and download your certificate from your account.","/dashboard/certificates"),
            "premium-granted"=>(ar?"تم تفعيل Premium":"Premium activated",ar?"راجع تفاصيل اشتراكك من حسابك.":"Review your subscription details in your account.","/dashboard"),
            "premium-renewed"=>(ar?"تم تجديد Premium":"Premium renewed",ar?"راجع تاريخ انتهاء اشتراكك من حسابك.":"Review your updated subscription expiry in your account.","/dashboard"),
            "premium-expired"=>(ar?"انتهى اشتراك Premium":"Premium expired",ar?"تبقى إنجازاتك محفوظة. راجع خطتك الحالية.":"Your achievements remain saved. Review your current plan.","/dashboard"),
            "announcement"=>(ar?"إشعار من المنصة":"Platform notice",ar?"راجع صندوق الإشعارات داخل حسابك.":"Review the notification inbox in your account.","/dashboard"),
            _=>throw new ArgumentException("Unknown optional email template.")
        };
        return MathWorldEmailLayout.Render(brand,locale,title,body,ar?"فتح المنصة":"Open MathWorld",brand.WebsiteUrl+"/"+locale+path);
    }
}
