using Microsoft.EntityFrameworkCore;
using MathWorldAPI.Models;

namespace MathWorldAPI.Data
{
    /// <summary>
    /// Application database context for MathWorldAPI.
    /// Configures entity relationships and seeds initial data for stages, categories, and admin user.
    /// </summary>
    public class AppDbContext : DbContext
    {
        /// <summary>
        /// Initializes a new instance of the AppDbContext.
        /// </summary>
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        /// <summary>
        /// Users table.
        /// </summary>
        public DbSet<AppUser> Users => Set<AppUser>();

        /// <summary>
        /// Categories table.
        /// </summary>
        public DbSet<Category> Categories => Set<Category>();

        /// <summary>
        /// Math problems table.
        /// </summary>
        public DbSet<MathProblem> Problems => Set<MathProblem>();

        /// <summary>
        /// Question options table.
        /// </summary>
        public DbSet<QuestionOption> QuestionOptions => Set<QuestionOption>();

        /// <summary>
        /// User progress tracking table.
        /// </summary>
        public DbSet<UserProgress> UserProgresses => Set<UserProgress>();

        /// <summary>
        /// Social login providers table.
        /// </summary>
        public DbSet<SocialLogin> SocialLogins => Set<SocialLogin>();

        /// <summary>
        /// Educational stages table.
        /// </summary>
        public DbSet<EducationalStage> EducationalStages => Set<EducationalStage>();

        /// <summary>
        /// Configures entity relationships, constraints, and seed data.
        /// </summary>
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // ============================================
            // ENTITY RELATIONSHIPS
            // ============================================

            modelBuilder.Entity<Category>()
                .HasOne(c => c.Stage)
                .WithMany(s => s.Categories)
                .HasForeignKey(c => c.StageId)
                .OnDelete(DeleteBehavior.Restrict);

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

            // ============================================
            // SEED DATA - Educational Stages
            // ============================================

            modelBuilder.Entity<EducationalStage>().HasData(
                new EducationalStage { Id = 1, NameAr = "المرحلة الابتدائية", NameEn = "Elementary School", Order = 1 },
                new EducationalStage { Id = 2, NameAr = "المرحلة الإعدادية", NameEn = "Middle School", Order = 2 },
                new EducationalStage { Id = 3, NameAr = "المرحلة الثانوية", NameEn = "High School", Order = 3 },
                new EducationalStage { Id = 4, NameAr = "المرحلة الجامعية", NameEn = "University", Order = 4 }
            );

            // ============================================
            // SEED DATA - Categories
            // ============================================

            modelBuilder.Entity<Category>().HasData(
                new Category { Id = 1, NameAr = "الأعداد والعمليات الحسابية", NameEn = "Numbers & Operations", Icon = "🔢", Order = 1, StageId = 1 },
                new Category { Id = 2, NameAr = "التفكير الجبري المبكر", NameEn = "Early Algebraic Thinking", Icon = "🧩", Order = 2, StageId = 1 },
                new Category { Id = 3, NameAr = "الهندسة والقياس", NameEn = "Geometry & Measurement", Icon = "📏", Order = 3, StageId = 1 },
                new Category { Id = 4, NameAr = "البيانات والاحتمالات", NameEn = "Data & Basic Probability", Icon = "📊", Order = 4, StageId = 1 },

                new Category { Id = 5, NameAr = "نظرية الأعداد والأسس", NameEn = "Number Theory & Exponents", Icon = "🔬", Order = 1, StageId = 2 },
                new Category { Id = 6, NameAr = "الجبر والدوال", NameEn = "Algebra & Functions", Icon = "⚖️", Order = 2, StageId = 2 },
                new Category { Id = 7, NameAr = "النسب والتناسب", NameEn = "Ratios & Proportions", Icon = "💹", Order = 3, StageId = 2 },
                new Category { Id = 8, NameAr = "الهندسة والبراهين", NameEn = "Geometry & Proofs", Icon = "📐", Order = 4, StageId = 2 },

                new Category { Id = 9, NameAr = "الجبر المتقدم", NameEn = "Advanced Algebra", Icon = "📈", Order = 1, StageId = 3 },
                new Category { Id = 10, NameAr = "حساب المثلثات", NameEn = "Trigonometry", Icon = "📐", Order = 2, StageId = 3 },
                new Category { Id = 11, NameAr = "التفاضل والتكامل", NameEn = "Calculus", Icon = "∫", Order = 3, StageId = 3 },
                new Category { Id = 12, NameAr = "الإحصاء والاحتمالات المتقدم", NameEn = "Advanced Statistics", Icon = "🎲", Order = 4, StageId = 3 },

                new Category { Id = 13, NameAr = "التفاضل متعدد المتغيرات", NameEn = "Multivariable Calculus", Icon = "🌌", Order = 1, StageId = 4 },
                new Category { Id = 14, NameAr = "الجبر الخطي", NameEn = "Linear Algebra", Icon = "🧮", Order = 2, StageId = 4 },
                new Category { Id = 15, NameAr = "المعادلات التفاضلية", NameEn = "Differential Equations", Icon = "🌀", Order = 3, StageId = 4 },
                new Category { Id = 16, NameAr = "التحليل الحقيقي", NameEn = "Real Analysis", Icon = "∞", Order = 4, StageId = 4 }
            );

            // ============================================
            // SEED DATA - Admin User
            // ============================================
            // Password: Admin@123
            // IMPORTANT: Replace the hash below with a real BCrypt hash

            modelBuilder.Entity<AppUser>().HasData(
                new AppUser
                {
                    Id = 1,
                    FullName = "System Admin",
                    Email = "admin@mathworld.com",
                    PasswordHash = "$2a$11$R2CufcoHWuidNl3Rtapp6OBFpTuugZNk/NG82.dYNj8USv99s.4YC",
                    Role = "Admin",
                    SubscriptionType = "Premium",
                    CreatedAt = new DateTime(2024, 1, 1, 0, 0, 0, DateTimeKind.Utc),
                    IsActive = true
                }
            );
        }
    }
}