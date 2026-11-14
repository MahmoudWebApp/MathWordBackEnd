using MathWorldAPI.Models;
using System.Text.Json;
using MathWorldAPI.Services;

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

