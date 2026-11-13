using MathWorldAPI.Models;
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

Assert(CategoryAccessPolicy.ResolveFreeCategoryIds(Array.Empty<Category>()).Count == 0,
    "Empty stage must have no unlocked categories.");
Assert(CategoryAccessPolicy.IsValidGroupSize(10) &&
       CategoryAccessPolicy.IsValidGroupSize(20) &&
       !CategoryAccessPolicy.IsValidGroupSize(0) &&
       !CategoryAccessPolicy.IsValidGroupSize(-1),
       "Journey group size must be positive and configurable.");

Console.WriteLine("PASS: Free category selection, invalid configuration and journey group size.");
