// File: MathWorldAPI/Data/AppDbContext.cs

using MathWorldAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace MathWorldAPI.Data
{
    /// <summary>
    /// Application database context for MathWorldAPI.
    /// Configures entity relationships, constraints, indexes,
    /// and seed data for educational stages and categories.
    /// </summary>
    public class AppDbContext : DbContext
    {
        /// <summary>
        /// Initializes a new instance of the AppDbContext.
        /// </summary>
        public AppDbContext(
            DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        /// <summary>
        /// Users table.
        /// </summary>
        public DbSet<AppUser> Users =>
            Set<AppUser>();

        /// <summary>
        /// Categories table.
        /// </summary>
        public DbSet<Category> Categories =>
            Set<Category>();

        /// <summary>
        /// Math problems table.
        /// </summary>
        public DbSet<MathProblem> Problems =>
            Set<MathProblem>();

        /// <summary>
        /// Question options table.
        /// </summary>
        public DbSet<QuestionOption> QuestionOptions =>
            Set<QuestionOption>();

        /// <summary>
        /// User progress tracking table.
        /// </summary>
        public DbSet<UserProgress> UserProgresses =>
            Set<UserProgress>();

        /// <summary>
        /// Social login providers table.
        /// </summary>
        public DbSet<SocialLogin> SocialLogins =>
            Set<SocialLogin>();

        /// <summary>
        /// Educational stages table.
        /// </summary>
        public DbSet<EducationalStage> EducationalStages =>
            Set<EducationalStage>();

        /// <summary>
        /// Configures relationships, constraints, indexes, and seed data.
        /// </summary>
        protected override void OnModelCreating(
            ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // =================================================================
            // USER CONFIGURATION
            // =================================================================

            modelBuilder.Entity<AppUser>()
                .HasIndex(user => user.Email)
                .IsUnique();

            modelBuilder.Entity<AppUser>()
                .Property(user => user.Email)
                .HasMaxLength(256)
                .IsRequired();

            modelBuilder.Entity<AppUser>()
                .Property(user => user.FullName)
                .HasMaxLength(150)
                .IsRequired();

            modelBuilder.Entity<AppUser>()
                .Property(user => user.Role)
                .HasMaxLength(32)
                .IsRequired();

            modelBuilder.Entity<AppUser>()
                .Property(user => user.SubscriptionType)
                .HasMaxLength(32)
                .IsRequired();

            // =================================================================
            // ENTITY RELATIONSHIPS
            // =================================================================

            modelBuilder.Entity<Category>()
                .HasOne(category => category.Stage)
                .WithMany(stage => stage.Categories)
                .HasForeignKey(category => category.StageId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<MathProblem>()
                .HasOne(problem => problem.Category)
                .WithMany(category => category.Problems)
                .HasForeignKey(problem => problem.CategoryId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<MathProblem>()
                .HasOne(problem => problem.Stage)
                .WithMany(stage => stage.Problems)
                .HasForeignKey(problem => problem.StageId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<QuestionOption>()
                .HasOne(option => option.Problem)
                .WithMany(problem => problem.Options)
                .HasForeignKey(option => option.ProblemId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<UserProgress>()
                .HasOne(progress => progress.User)
                .WithMany(user => user.UserProgresses)
                .HasForeignKey(progress => progress.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<UserProgress>()
                .HasOne(progress => progress.Problem)
                .WithMany(problem => problem.UserProgresses)
                .HasForeignKey(progress => progress.ProblemId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<SocialLogin>()
                .HasOne(login => login.User)
                .WithMany(user => user.SocialLogins)
                .HasForeignKey(login => login.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            // =================================================================
            // UNIQUE INDEXES
            // =================================================================

            modelBuilder.Entity<UserProgress>()
                .HasIndex(progress => new
                {
                    progress.UserId,
                    progress.ProblemId
                })
                .IsUnique();

            modelBuilder.Entity<QuestionOption>()
                .HasIndex(option => new
                {
                    option.ProblemId,
                    option.Order
                })
                .IsUnique();

            modelBuilder.Entity<SocialLogin>()
                .HasIndex(login => new
                {
                    login.Provider,
                    login.ProviderId
                })
                .IsUnique();

            // =================================================================
            // SEED DATA - Educational Stages
            // =================================================================

            modelBuilder.Entity<EducationalStage>().HasData(
                new EducationalStage
                {
                    Id = 1,
                    NameAr = "المرحلة الابتدائية",
                    NameEn = "Elementary School",
                    Order = 1
                },
                new EducationalStage
                {
                    Id = 2,
                    NameAr = "المرحلة الإعدادية",
                    NameEn = "Middle School",
                    Order = 2
                },
                new EducationalStage
                {
                    Id = 3,
                    NameAr = "المرحلة الثانوية",
                    NameEn = "High School",
                    Order = 3
                },
                new EducationalStage
                {
                    Id = 4,
                    NameAr = "المرحلة الجامعية",
                    NameEn = "University",
                    Order = 4
                });

            // =================================================================
            // SEED DATA - Categories
            // =================================================================

            modelBuilder.Entity<Category>().HasData(
                new Category
                {
                    Id = 1,
                    NameAr = "الأعداد والعمليات الحسابية",
                    NameEn = "Numbers & Operations",
                    Icon = "🔢",
                    Order = 1,
                    StageId = 1
                },
                new Category
                {
                    Id = 2,
                    NameAr = "التفكير الجبري المبكر",
                    NameEn = "Early Algebraic Thinking",
                    Icon = "🧩",
                    Order = 2,
                    StageId = 1
                },
                new Category
                {
                    Id = 3,
                    NameAr = "الهندسة والقياس",
                    NameEn = "Geometry & Measurement",
                    Icon = "📏",
                    Order = 3,
                    StageId = 1
                },
                new Category
                {
                    Id = 4,
                    NameAr = "البيانات والاحتمالات",
                    NameEn = "Data & Basic Probability",
                    Icon = "📊",
                    Order = 4,
                    StageId = 1
                },
                new Category
                {
                    Id = 5,
                    NameAr = "نظرية الأعداد والأسس",
                    NameEn = "Number Theory & Exponents",
                    Icon = "🔬",
                    Order = 1,
                    StageId = 2
                },
                new Category
                {
                    Id = 6,
                    NameAr = "الجبر والدوال",
                    NameEn = "Algebra & Functions",
                    Icon = "⚖️",
                    Order = 2,
                    StageId = 2
                },
                new Category
                {
                    Id = 7,
                    NameAr = "النسب والتناسب",
                    NameEn = "Ratios & Proportions",
                    Icon = "💹",
                    Order = 3,
                    StageId = 2
                },
                new Category
                {
                    Id = 8,
                    NameAr = "الهندسة والبراهين",
                    NameEn = "Geometry & Proofs",
                    Icon = "📐",
                    Order = 4,
                    StageId = 2
                },
                new Category
                {
                    Id = 9,
                    NameAr = "الجبر المتقدم",
                    NameEn = "Advanced Algebra",
                    Icon = "📈",
                    Order = 1,
                    StageId = 3
                },
                new Category
                {
                    Id = 10,
                    NameAr = "حساب المثلثات",
                    NameEn = "Trigonometry",
                    Icon = "📐",
                    Order = 2,
                    StageId = 3
                },
                new Category
                {
                    Id = 11,
                    NameAr = "التفاضل والتكامل",
                    NameEn = "Calculus",
                    Icon = "∫",
                    Order = 3,
                    StageId = 3
                },
                new Category
                {
                    Id = 12,
                    NameAr = "الإحصاء والاحتمالات المتقدم",
                    NameEn = "Advanced Statistics",
                    Icon = "🎲",
                    Order = 4,
                    StageId = 3
                },
                new Category
                {
                    Id = 13,
                    NameAr = "التفاضل متعدد المتغيرات",
                    NameEn = "Multivariable Calculus",
                    Icon = "🌌",
                    Order = 1,
                    StageId = 4
                },
                new Category
                {
                    Id = 14,
                    NameAr = "الجبر الخطي",
                    NameEn = "Linear Algebra",
                    Icon = "🧮",
                    Order = 2,
                    StageId = 4
                },
                new Category
                {
                    Id = 15,
                    NameAr = "المعادلات التفاضلية",
                    NameEn = "Differential Equations",
                    Icon = "🌀",
                    Order = 3,
                    StageId = 4
                },
                new Category
                {
                    Id = 16,
                    NameAr = "التحليل الحقيقي",
                    NameEn = "Real Analysis",
                    Icon = "∞",
                    Order = 4,
                    StageId = 4
                });

            // =================================================================
            // ADMIN USER
            // =================================================================
            // The administrator is no longer seeded with a hard-coded password.
            // AdminBootstrapper creates the first administrator from environment
            // variables when BootstrapAdmin:Enabled is true.
        }
    }
}