using MathWorldAPI.Data;
using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Services;

// Track IDs are stable catalog identities; zero is the untouched legacy cycle.
// No migration guesses which grade a historical stage solve belonged to.
public static class TrackPractice
{
    public static bool Enabled(IConfiguration config)=>config.GetValue<bool>("PracticeCycles:TrackIsolationEnabled")&&
        config.GetValue<bool>("LearningTracks:Enabled")&&config.GetValue<bool>("LearningSessions:Enabled");
    public static int Scope(IConfiguration config,int? trackId)=>Enabled(config)?trackId??0:0;
    public static IQueryable<UserProgress> For(AppDbContext db,int scopeId)=>
        db.UserProgresses.IgnoreQueryFilters().Where(p=>p.PracticeScopeId==scopeId);
    public static async Task<int> CurrentAsync(AppDbContext db,HttpContext http,CancellationToken ct)
    {
        var config=http.RequestServices.GetRequiredService<IConfiguration>();
        if(!Enabled(config))return 0;
        var track=await http.RequestServices.GetRequiredService<LearningTrackService>().ActiveForStudentAsync(http.User,ct);
        return track?.Id??0;
    }
}
