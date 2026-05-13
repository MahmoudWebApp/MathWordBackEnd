using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Models;

namespace MathWorldAPI.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<AppUser> Users => Set<AppUser>();
        public DbSet<Category> Categories => Set<Category>();
        public DbSet<MathProblem> Problems => Set<MathProblem>();
        public DbSet<QuestionOption> QuestionOptions => Set<QuestionOption>();
        public DbSet<SearchTag> SearchTags => Set<SearchTag>();
        public DbSet<ProblemTag> ProblemTags => Set<ProblemTag>();
        public DbSet<UserProgress> UserProgresses => Set<UserProgress>();
        public DbSet<SocialLogin> SocialLogins => Set<SocialLogin>();
        public DbSet<EducationalStage> EducationalStages => Set<EducationalStage>();

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<MathProblem>()
                .HasOne(p => p.Category)
                .WithMany(c => c.Problems)
                .HasForeignKey(p => p.CategoryId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<QuestionOption>()
                .HasOne(o => o.Problem)
                .WithMany(p => p.Options)
                .HasForeignKey(o => o.ProblemId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<ProblemTag>()
                .HasOne(pt => pt.Problem)
                .WithMany(p => p.ProblemTags)
                .HasForeignKey(pt => pt.ProblemId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<ProblemTag>()
                .HasOne(pt => pt.Tag)
                .WithMany(t => t.ProblemTags)
                .HasForeignKey(pt => pt.TagId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<UserProgress>()
                .HasOne(up => up.User)
                .WithMany(u => u.UserProgresses)
                .HasForeignKey(up => up.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<UserProgress>()
                .HasOne(up => up.Problem)
                .WithMany(p => p.UserProgresses)
                .HasForeignKey(up => up.ProblemId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<UserProgress>()
                .HasIndex(up => new { up.UserId, up.ProblemId })
                .IsUnique();

            modelBuilder.Entity<Category>().HasData(
                new Category { Id = 1, NameAr = "جبر", NameEn = "Algebra", Icon = "🔢", Order = 1 },
                new Category { Id = 2, NameAr = "هندسة", NameEn = "Geometry", Icon = "📐", Order = 2 },
                new Category { Id = 3, NameAr = "تفاضل وتكامل", NameEn = "Calculus", Icon = "📈", Order = 3 },
                new Category { Id = 4, NameAr = "إحصاء", NameEn = "Statistics", Icon = "📊", Order = 4 },
                new Category { Id = 5, NameAr = "قدرات كمي", NameEn = "Quantitative Aptitude", Icon = "💡", Order = 5 }
            );
        }
    }
}