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
using (var archive = new ZipArchive(new MemoryStream(xlsx), ZipArchiveMode.Read))
{
    foreach (var name in new[] {
        "[Content_Types].xml", "_rels/.rels", "xl/workbook.xml",
        "xl/_rels/workbook.xml.rels", "xl/worksheets/sheet1.xml", "xl/styles.xml"
    })
        Assert(archive.GetEntry(name) is not null, "XLSX archive is missing " + name);

    var sheet = XDocument.Load(archive.GetEntry("xl/worksheets/sheet1.xml")!.Open());
    XNamespace ns = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";
    var userTextCell = sheet.Descendants(ns + "c")
        .Single(x => (string?)x.Attribute("r") == "E7");
    Assert((string?)userTextCell.Attribute("t") == "inlineStr" &&
           (string?)userTextCell.Descendants(ns + "t").Single() == "=1+2",
        "Untrusted category names must be Excel literal strings, never formulas.");
    var totalSeconds = sheet.Descendants(ns + "c")
        .Single(x => (string?)x.Attribute("r") == "O8");
    Assert((string?)totalSeconds.Element(ns + "v") == "42",
        "Premium Excel totals must be exported as numeric cells.");
    var branded = sheet.Descendants(ns + "c")
        .Single(x => (string?)x.Attribute("r") == "A1");
    Assert(((string?)branded.Descendants(ns + "t").Single())?.Contains("MathWorld") == true,
        "Premium Excel report should prominently identify MathWorld.");
    Assert(sheet.Descendants(ns + "conditionalFormatting").Count() >= 2,
        "The worksheet must include editable Excel-native progress data bars.");
    // A real editable Excel chart is an OOXML chart part with a drawing,
    // relationships, series data references and cached numeric values.
    foreach (var name in new[] {
        "xl/worksheets/sheet2.xml",
        "xl/worksheets/_rels/sheet2.xml.rels",
        "xl/drawings/drawing1.xml",
        "xl/drawings/_rels/drawing1.xml.rels",
        "xl/charts/chart1.xml", "xl/charts/chart2.xml"
    })
        Assert(archive.GetEntry(name) is not null,
            "Excel-native charting is missing " + name);
    var dashboard = XDocument.Load(archive.GetEntry("xl/worksheets/sheet2.xml")!.Open());
    Assert(dashboard.Descendants(ns + "drawing").Count() == 1,
        "Charts must be anchored in their own editable worksheet.");
    Assert(dashboard.Descendants(ns + "c")
        .Any(c => (string?)c.Attribute("r") == "B5" &&
                  (string?)c.Element(ns + "v") == "1"),
        "Charts must use the real solved-count data, not invented examples.");
    XNamespace chartNs = "http://schemas.openxmlformats.org/drawingml/2006/chart";
    foreach (var name in new[] { "xl/charts/chart1.xml", "xl/charts/chart2.xml" })
    {
        var chartXml = XDocument.Load(archive.GetEntry(name)!.Open());
        Assert(chartXml.Descendants(chartNs + "barChart").Count() == 1 &&
               chartXml.Descendants(chartNs + "ser").Count() == 2,
            "The report must contain two native data-linked series per chart.");
        Assert(chartXml.Descendants(chartNs + "f").Any() &&
               chartXml.Descendants(chartNs + "numCache").Count() == 2,
            "Chart values must retain editable sheet references and cached real data.");
    }
    var drawingXml = XDocument.Load(archive.GetEntry("xl/drawings/drawing1.xml")!.Open());
    XNamespace drawingNs =
        "http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing";
    Assert(drawingXml.Descendants(drawingNs + "twoCellAnchor").Count() == 2,
        "Both charts must have visible nonoverlapping anchors.");
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
