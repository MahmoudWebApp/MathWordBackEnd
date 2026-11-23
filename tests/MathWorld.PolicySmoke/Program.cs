using System.IO.Compression;
using System.Security.Cryptography;
using System.Text;
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

// A different numeric substitution must trigger review as the same
// template family, while stage and topic boundaries remain distinct.
var familyOne = CurriculumContentQuality.FamilyKey(
    1, 2, "حل س + 7 = 15", "Solve x + 7 = 15");
var familyTwo = CurriculumContentQuality.FamilyKey(
    1, 2, "حل س + 9 = 18", "Solve x + 9 = 18");
var otherCategory = CurriculumContentQuality.FamilyKey(
    1, 3, "حل س + 9 = 18", "Solve x + 9 = 18");
Assert(familyOne == familyTwo, "Numeric-only variants must be reviewed together.");
Assert(familyOne != otherCategory,
    "Distinct primary mathematics topics must not share family identities.");
Assert(CurriculumContentQuality.TemplateSignature("  نَظَرية 21  ").Contains("#"),
    "Unicode-compatible numeral recognition must be preserved.");
Console.WriteLine("PASS: editorial template signatures flag numeric variants and keep category scope.");

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
Assert(PremiumEntitlement.IsActive(premiumStudent),
    "An active indefinite Premium grant must stay valid.");
Assert(!PremiumEntitlement.IsActive(expiredPremium),
    "An expired Premium grant must not access pre-answer solutions or reports.");
Assert(!PremiumEntitlement.IsActive(inactivePremium),
    "Disabled accounts must never retain Premium entitlements.");


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
var sampleWorkbookPath = Environment.GetEnvironmentVariable("MATHWORLD_XLSX_SAMPLE_PATH");
if (!string.IsNullOrWhiteSpace(sampleWorkbookPath))
    File.WriteAllBytes(sampleWorkbookPath, xlsx);
Assert(xlsx.Length > 1000 && xlsx[0] == 0x50 && xlsx[1] == 0x4B,
    "The branded student report must be a real XLSX ZIP.");
using (var archive = new ZipArchive(new MemoryStream(xlsx), ZipArchiveMode.Read))
{
    Assert(archive.Entries.Any(e => e.FullName == "xl/workbook.xml"),
        "The Excel workbook must contain a workbook XML part.");
    // No floating chart frames: WPS previously rendered them as a giant
    // white overlay, making the data sheet appear empty.
    Assert(!archive.Entries.Any(e => e.FullName.StartsWith("xl/charts/", StringComparison.Ordinal)),
        "Progress charting must use editable in-cell data bars, not floating WPS-incompatible charts.");
    foreach (var entry in archive.Entries.Where(e => e.FullName.EndsWith(".xml") ||
                                                       e.FullName.EndsWith(".rels")))
        using (var xml = entry.Open()) XDocument.Load(xml);
    var images = archive.Entries.Where(e => e.FullName.StartsWith("xl/media/") &&
                                            e.FullName.EndsWith(".png")).ToArray();
    Assert(images.Length >= 1, "Excel should embed the approved MathWorld logo.");
    foreach (var image in images)
    {
        using var input = image.Open();
        using var output = new MemoryStream();
        input.CopyTo(output);
        var pixels = output.ToArray();
        var header = Encoding.UTF8.GetBytes($"blob {pixels.Length}\0");
        var hash = Convert.ToHexString(
            SHA1.HashData(header.Concat(pixels).ToArray())).ToLowerInvariant();
        Assert(hash == "c87b96ee1fe1b93d959a53ad1e171cd9b7db209c",
            "Only the exact approved MathWorld logo may be embedded in Excel.");
    }
}
using (var reopened = new ClosedXML.Excel.XLWorkbook(new MemoryStream(xlsx)))
{
    Assert(reopened.Worksheets.Count == 2, "Exactly two editable reporting sheets.");
    var sheet = reopened.Worksheet(1);
    var bars = reopened.Worksheet(2);
    Assert(sheet.RightToLeft && bars.RightToLeft, "Both Arabic tabs must be RTL.");
    Assert(sheet.Cell("A12").GetString() == "المرحلة" &&
           sheet.Cell("B12").GetString() == "الفئة" &&
           sheet.Cell("K12").GetString() == "الوقت بالثواني",
        "Data must have 11 readable Arabic columns, with no IDs.");
    Assert(!Enumerable.Range(1,11).Any(c =>
            sheet.Cell(12,c).GetString().Contains("ID", StringComparison.OrdinalIgnoreCase)),
        "Internal numeric IDs must not appear in student report headers.");
    Assert(sheet.Cell("B13").GetString() == "=1+2" && !sheet.Cell("B13").HasFormula,
        "Untrusted category labels must remain literal text, not Excel formulas.");
    Assert(sheet.Cell("K14").GetDouble() == 42 &&
           sheet.Cell("D14").GetDouble() == 1,
        "Real report totals must remain numeric and accurately typed.");
    Assert(sheet.Cell("B1").GetString().Contains("MathWorld") &&
           sheet.Cell("A6").GetDouble() == 1,
        "Visible report header and metric cards should contain real data.");
    Assert(sheet.Cell("B1").Style.Alignment.Horizontal == ClosedXML.Excel.XLAlignmentHorizontalValues.Right &&
           reopened.Worksheet(2).Cell("B1").Style.Alignment.Horizontal == ClosedXML.Excel.XLAlignmentHorizontalValues.Right,
        "Arabic Excel report headers must be right-aligned.");
    Assert(sheet.Cell("A4").Style.Fill.BackgroundColor == ClosedXML.Excel.XLColor.FromHtml("#0F766E") &&
           sheet.Cell("B1").Style.Fill.BackgroundColor == ClosedXML.Excel.XLColor.FromHtml("#223047"),
        "The workbook should use restrained navy/teal report headings while retaining the official logo.");
    Assert(sheet.Cell("A5").Style.Font.FontColor == ClosedXML.Excel.XLColor.FromHtml("#15803D") &&
           sheet.Cell("G5").Style.Font.FontColor == ClosedXML.Excel.XLColor.FromHtml("#A16207") &&
           sheet.Cell("I5").Style.Font.FontColor == ClosedXML.Excel.XLColor.FromHtml("#B91C1C"),
        "Solved results must be green, points amber, and errors red.");
    Assert(sheet.Cell("D13").Style.Font.FontColor == ClosedXML.Excel.XLColor.FromHtml("#15803D") &&
           sheet.Cell("J13").Style.Font.FontColor == ClosedXML.Excel.XLColor.FromHtml("#A16207"),
        "Actual category metrics must use semantic colors; row 14 is the navy total row.");
    Assert(sheet.ConditionalFormats.Count() >= 2 && bars.ConditionalFormats.Count() >= 2,
        "Summary and statistics tabs must have real cell-based progress bars.");
    Assert(bars.Cell("B9").GetDouble() == 1 && bars.Cell("F9").GetDouble() == 1,
        "The visual statistics must be tied to actual counts.");
}
var englishWorkbook = PremiumAnalyticsXlsxExporter.Create(workbookReport, false);
using (var reopened = new ClosedXML.Excel.XLWorkbook(new MemoryStream(englishWorkbook)))
{
    var sheet = reopened.Worksheet(1);
    Assert(!sheet.RightToLeft &&
           sheet.Cell("A12").GetString() == "Stage" &&
           sheet.Cell("B12").GetString() == "Category",
        "English workbook must use an English-language LTR layout.");
    Assert(sheet.Cell("A13").GetString() == "Stage one" &&
           sheet.Cell("B13").GetString() == "Arithmetic",
        "English workbook must use English stage/category names.");
}
Console.WriteLine("PASS: WPS-safe styled Arabic/English XLSX, logo, numeric metrics and in-cell statistics.");

// Render both languages as real PDF binaries with synthetic-only data,
// verifying the direct-download format independently of a user session.
foreach (var (ar, code) in new[] { (true, "ar"), (false, "en") })
{
    var pdf = PremiumAnalyticsPdfExporter.Create(workbookReport, ar);
    Assert(pdf.Length > 1500 &&
           System.Text.Encoding.ASCII.GetString(pdf, 0, 5) == "%PDF-",
        "PDF must have real document bytes, not HTML or a renamed file.");
    var outputDirectory = Environment.GetEnvironmentVariable("MATHWORLD_REPORT_SAMPLE_DIR");
    if (!string.IsNullOrWhiteSpace(outputDirectory))
    {
        Directory.CreateDirectory(outputDirectory);
        File.WriteAllBytes(Path.Combine(outputDirectory,
            "mathworld-synthetic-premium-report-" + code + ".pdf"), pdf);
    }
}
Console.WriteLine("PASS: native Arabic/English branded Premium PDF generation.");

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

var realtime = new NotificationStreamBroker();
using var firstInbox = realtime.Subscribe(101);
using var secondInbox = realtime.Subscribe(202);
realtime.Notify(101);
Assert(firstInbox.Reader.TryRead(out _), "Recipient must receive an inbox refresh signal.");
Assert(!secondInbox.Reader.TryRead(out _), "A private notification cannot refresh another user's inbox.");
realtime.Notify(202);
Assert(secondInbox.Reader.TryRead(out _), "Second recipient must receive their own signal.");
firstInbox.Dispose();
realtime.Notify(101);
Assert(!firstInbox.Reader.TryRead(out _), "Disposed SSE listener must no longer receive signals.");
Console.WriteLine("PASS: user-scoped SSE invalidation, no cross-user signals, subscriber disposal.");


var streamBroker = new NotificationStreamBroker();
using var streamOne = streamBroker.TrySubscribe(1042);
using var streamTwo = streamBroker.TrySubscribe(1042);
using var streamThree = streamBroker.TrySubscribe(1042);
using var otherStream = streamBroker.TrySubscribe(1043);
Assert(streamOne is not null && streamTwo is not null &&
       streamThree is not null && otherStream is not null,
    "Three streams per learner plus an independent learner must be allowed.");
Assert(streamBroker.TrySubscribe(1042) is null,
    "A fourth simultaneous SSE connection for one learner must be rejected.");
streamBroker.Notify(1042);
Assert(streamOne!.Reader.TryRead(out _) && streamTwo!.Reader.TryRead(out _) &&
       streamThree!.Reader.TryRead(out _),
    "Authenticated listener tabs must receive their own refresh hints.");
Assert(!otherStream!.Reader.TryRead(out _),
    "A notice must never be delivered to a different user's SSE channel.");
streamThree.Dispose();
using var reopenedStream = streamBroker.TrySubscribe(1042);
Assert(reopenedStream is not null,
    "Disposing a listener must release the concurrent connection slot.");
Console.WriteLine("PASS: notification stream isolation, per-account connection caps and release.");
