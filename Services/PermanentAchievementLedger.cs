using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;
namespace MathWorldAPI.Services;

// Caller holds the shared learner transaction lock in both answer flows.
// Database primary key remains the final uniqueness guarantee.
public static class PermanentAchievementLedger
{
    public static async Task<int> AwardAsync(AppDbContext db,int userId,MathProblem problem,
        DateTime now,CancellationToken ct)
    {
        if(await db.PermanentProblemAchievements.AnyAsync(x=>x.UserId==userId&&x.ProblemId==problem.Id,ct))
            return 0;
        var points=Math.Max(0,problem.Points);
        db.PermanentProblemAchievements.Add(new PermanentProblemAchievement{UserId=userId,
            ProblemId=problem.Id,StageId=problem.StageId,CategoryId=problem.CategoryId,
            Points=points,EarnedAtUtc=now});
        return points;
    }
}
