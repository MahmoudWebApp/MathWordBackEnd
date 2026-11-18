using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services
{
    /// <summary>
    /// Resolves the curriculum-defined Elementary stage for legacy students
    /// without an explicit stage. Does not assume seeded numeric IDs.
    /// </summary>
    public static class LegacyLearningStage
    {
        public static Task<int?> ElementaryIdAsync(
            AppDbContext db,
            CancellationToken cancellationToken = default) =>
            db.EducationalStages.AsNoTracking()
                .Where(stage =>
                    stage.NameEn == "Elementary School" ||
                    stage.NameAr == "المرحلة الابتدائية")
                .OrderBy(stage => stage.Order)
                .ThenBy(stage => stage.Id)
                .Select(stage => (int?)stage.Id)
                .FirstOrDefaultAsync(cancellationToken);

        public static async Task<int?> EffectiveIdAsync(
            AppDbContext db,
            int? selectedStageId,
            CancellationToken cancellationToken = default) =>
            selectedStageId ?? await ElementaryIdAsync(db, cancellationToken);
    }
}
