using System.IO.Compression;
using System.Xml.Linq;
using MathWorldAPI.Controllers;
using MathWorldAPI.Models;
using System.Text.Json;
using MathWorldAPI.Services;
using MathWorldAPI.Middleware;

static void Assert(bool condition, string message)
{
    if (!condition) throw new InvalidOperationException(message);
}

var categories = new[]
{
    new Category { Id = 4, StageId = 1, Order = 3 },
    new Category { Id = 2, StageId = 1, Order = 1 },
    new Category { Id = 3, StageId = 1, Order = 2 }
};
var defaults = CategoryAccessPolicy.ResolveFreeCategoryIds(categories);
Assert(defaults.SequenceEqual(new[] { 2, 3 }), "Default Free categories must follow editorial order.");
var configured = CategoryAccessPolicy.ResolveFreeCategoryIds(categories, new[] { 4, 2 });
Assert(configured.SequenceEqual(new[] { 4, 2 }), "Configured Free categories must be respected.");

try
{
    CategoryAccessPolicy.ResolveFreeCategoryIds(categories, new[] { 2, 999 });
    throw new InvalidOperationException("Invalid category configuration was accepted.");
}
catch (ArgumentException) { }

try
{
    CategoryAccessPolicy.ResolveFreeCategoryIds(
        categories.Concat(new[] { new Category { Id = 8, StageId = 2 } }));
    throw new InvalidOperationException("Mixed educational stages were accepted.");
}
catch (ArgumentException) { }

foreach (var invalid in new[] { Array.Empty<int>(), new[] { 2, 2 }, new[] { 2 } })
{
    try
    {
        CategoryAccessPolicy.ResolveFreeCategoryIds(categories, invalid);
        throw new InvalidOperationException("Malformed explicit Free configuration was accepted.");
    }
    catch (ArgumentException) { }
}

Assert(CategoryAccessPolicy.ResolveFreeCategoryIds(Array.Empty<Category>()).Count == 0,
    "Empty stage must have no unlocked categories.");
Assert(CategoryAccessPolicy.IsValidGroupSize(10) &&
       CategoryAccessPolicy.IsValidGroupSize(20) &&
       !CategoryAccessPolicy.IsValidGroupSize(0) &&
       !CategoryAccessPolicy.IsValidGroupSize(-1),
       "Journey group size must be positive and configurable.");

var freeStudent = new AppUser { Role = "Student", IsActive = true, SubscriptionType = "Free" };
var premiumStudent = new AppUser { Role = "Student", IsActive = true, SubscriptionType = "Premium" };
var expiredPremium = new AppUser
{
    Role = "Student", IsActive = true, SubscriptionType = "Premium",
    PremiumExpiresAtUtc = DateTime.UtcNow.AddDays(-1)
};
var inactivePremium = new AppUser { Role = "Student", IsActive = false, SubscriptionType = "Premium" };
Assert(CategoryAccessPolicy.CanAccess(freeStudent, 1, 2, defaults),
    "Free student should access unlocked category.");
Assert(!CategoryAccessPolicy.CanAccess(freeStudent, 1, 4, defaults),
    "Free student should not access locked category.");
Assert(CategoryAccessPolicy.CanAccess(premiumStudent, 1, 4, defaults),
    "Active Premium student should access locked category.");
Assert(!CategoryAccessPolicy.CanAccess(expiredPremium, 1, 4, defaults),
    "Expired Premium should not access locked category.");
Assert(!CategoryAccessPolicy.CanAccess(inactivePremium, 1, 2, defaults),
    "Inactive student should not access even Free category.");

Console.WriteLine("PASS: Free category selection, invalid configuration journey group size, Free/Premium entitlement and inactive accounts.");

// A stored geometry scene must render consistently in Next.js and Flutter.
static string DiagramJson(string objects, string altAr = "رسم هندسي") =>
    "{\"schemaVersion\":1,\"viewport\":{\"width\":360,\"height\":260}," +
    "\"altTextAr\":" + JsonSerializer.Serialize(altAr) +
    ",\"altTextEn\":\"Geometry figure\",\"objects\":[" + objects + "]}";

var signedArc = """{"id":"arc","type":"angle","cx":100,"cy":100,"radius":30,"startDegrees":90,"endDegrees":0}""";
Assert(GeometrySceneValidator.TryParse(DiagramJson(signedArc), out _),
    "A valid negative angle sweep must be accepted.");
Assert(!GeometrySceneValidator.TryParse(DiagramJson(signedArc, ""), out _),
    "Bilingual geometry alt text must not be blank.");
Assert(!GeometrySceneValidator.TryParse(
        DiagramJson(signedArc.Replace("\"endDegrees\":0", "\"endDegrees\":90")), out _),
    "A zero-angle arc must be rejected.");
Assert(!GeometrySceneValidator.TryParse(
        DiagramJson(signedArc.Replace("\"startDegrees\":90", "\"startDegrees\":360")), out _),
    "A sweep of magnitude 360 must be rejected.");
Assert(!GeometrySceneValidator.TryParse(
        DiagramJson("""{"id":"out","type":"point","x":10001,"y":0}"""), out _),
    "Primitive coordinates must respect shared +/-10000 bounds.");
Console.WriteLine("PASS: geometry bilingual alt text, bounded coordinates and signed arc validation.");


var discountStart = new DateTime(2026, 12, 1, 0, 0, 0, DateTimeKind.Utc);
var discountEnd = discountStart.AddDays(30);
var discountPolicy = new PremiumDiscountEligibility.Policy(
    discountStart, discountEnd, true, 2, 0);
Assert(PremiumDiscountEligibility.Evaluate(discountPolicy, discountStart.AddTicks(-1)) ==
       PremiumDiscountEligibility.Status.Scheduled,
    "Discount must not be usable before its UTC start.");
Assert(PremiumDiscountEligibility.Evaluate(discountPolicy, discountStart) ==
       PremiumDiscountEligibility.Status.Active,
    "Discount must activate at the UTC start instant.");
Assert(PremiumDiscountEligibility.Evaluate(discountPolicy, discountEnd.AddTicks(-1)) ==
       PremiumDiscountEligibility.Status.Active,
    "Discount must remain valid before its UTC end.");
Assert(PremiumDiscountEligibility.Evaluate(discountPolicy, discountEnd) ==
       PremiumDiscountEligibility.Status.Expired,
    "Discount must expire at the exact UTC end instant.");
Assert(PremiumDiscountEligibility.Evaluate(discountPolicy with { Enabled = false }, discountStart) ==
       PremiumDiscountEligibility.Status.Disabled,
    "Disabled discount must never be active.");
Assert(PremiumDiscountEligibility.Evaluate(discountPolicy with { RedemptionCount = 2 }, discountStart) ==
       PremiumDiscountEligibility.Status.Exhausted,
    "Discount must stop after reaching its usage cap.");
Assert(PremiumDiscountEligibility.Evaluate(discountPolicy with { MaxRedemptions = null }, discountStart) ==
       PremiumDiscountEligibility.Status.Active,
    "Discount without a total usage cap should remain eligible within its window.");
try
{
    PremiumDiscountEligibility.Validate(discountPolicy with { EndsAtUtc = discountStart });
    throw new InvalidOperationException("Invalid discount date window was accepted.");
}
catch (ArgumentException) { }

var percentageQuote = PremiumDiscountCalculator.Calculate(
    PremiumDiscountCalculator.AnnualPriceUsd,
    PremiumDiscountCalculator.DiscountKind.Percentage, 20m);
Assert(percentageQuote.SubtotalUsd == 5m && percentageQuote.DiscountUsd == 1m &&
       percentageQuote.TotalUsd == 4m, "20% discount must produce USD 4.00.");
var fixedQuote = PremiumDiscountCalculator.Calculate(
    5m, PremiumDiscountCalculator.DiscountKind.FixedUsd, 10m);
Assert(fixedQuote.DiscountUsd == 5m && fixedQuote.TotalUsd == 0m,
    "Discounts must never produce negative totals.");
try
{
    PremiumDiscountCalculator.Calculate(5m, PremiumDiscountCalculator.DiscountKind.Percentage, 101m);
    throw new InvalidOperationException("Over-100% discount was accepted.");
}
catch (ArgumentOutOfRangeException) { }
Console.WriteLine("PASS: scheduled discount UTC boundaries, disabling, usage caps and safe monetary calculations.");


var workbookReport = new StudentPremiumAnalyticsController.StudentAnalyticsReport(
    DateTime.UtcNow, 1, 1, 2, 1, 1, 1, 10, 42,
    new[]
    {
        new StudentPremiumAnalyticsController.CategoryStatistics(
            1, 1, "المرحلة الأولى", "Stage one",
            "=1+2", "Arithmetic", 1, 1, 0, 2, 1, 1, 1, 10, 42)
    });
var xlsx = PremiumAnalyticsXlsxExporter.Create(workbookReport, true);
using (var archive = new ZipArchive(new MemoryStream(xlsx), ZipArchiveMode.Read))
{
    foreach (var name in new[] {
        "[Content_Types].xml", "_rels/.rels", "xl/workbook.xml",
        "xl/_rels/workbook.xml.rels", "xl/worksheets/sheet1.xml"
    })
        Assert(archive.GetEntry(name) is not null, "XLSX archive is missing " + name);

    var sheet = XDocument.Load(archive.GetEntry("xl/worksheets/sheet1.xml")!.Open());
    XNamespace ns = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";
    var userTextCell = sheet.Descendants(ns + "c")
        .Single(x => (string?)x.Attribute("r") == "E2");
    Assert((string?)userTextCell.Attribute("t") == "inlineStr" &&
           (string?)userTextCell.Descendants(ns + "t").Single() == "=1+2",
        "Untrusted category names must be Excel literal strings, never formulas.");
    var totalSeconds = sheet.Descendants(ns + "c")
        .Single(x => (string?)x.Attribute("r") == "O3");
    Assert((string?)totalSeconds.Element(ns + "v") == "42",
        "Premium Excel totals must be exported as numeric cells.");
    var rtlView = sheet.Descendants(ns + "sheetView").Single();
    Assert((string?)rtlView.Attribute("rightToLeft") == "1",
        "Arabic Excel workbook must use the RTL worksheet direction.");
}
Console.WriteLine("PASS: native Premium XLSX ZIP structure, RTL, typed totals and formula-injection protection.");

foreach (var (method, route, action) in new[]
{
    ("POST", "api/admin/curriculum/drafts/{id}/publish", "Publish"),
    ("PUT", "api/admin/premium-codes/{id}/revoke", "Revoke"),
    ("PUT", "api/admin/premium-discounts/{id}/disable", "Disable"),
    ("POST", "api/admin/notifications/learners/{learnerId}", "Notify"),
    ("DELETE", "api/categories/{id}", "Delete"),
    ("POST", "api/categories", "CreateOrSubmit")
})
{
    Assert(PlatformActivityAuditMiddleware.ClassifyAction(method, route) == action,
        $"Wrong audit action label for {method} {route}.");
}
Console.WriteLine("PASS: admin audit labels for publishing, revocation, disable, messaging and legacy category CRUD.");
