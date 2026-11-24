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
        public DbSet<CurriculumDraftItem> CurriculumDraftItems => Set<CurriculumDraftItem>();
        public DbSet<CurriculumTopicProposal> CurriculumTopicProposals => Set<CurriculumTopicProposal>();
        public DbSet<CurriculumDomain> CurriculumDomains => Set<CurriculumDomain>();
        public DbSet<CurriculumSkill> CurriculumSkills => Set<CurriculumSkill>();
        public DbSet<CurriculumSkillStandard> CurriculumSkillStandards => Set<CurriculumSkillStandard>();
        public DbSet<CurriculumSkillPrerequisite> CurriculumSkillPrerequisites => Set<CurriculumSkillPrerequisite>();
        public DbSet<CurriculumProblemSkill> CurriculumProblemSkills => Set<CurriculumProblemSkill>();

        public DbSet<SubscriptionGrant> SubscriptionGrants => Set<SubscriptionGrant>();

        public DbSet<StageFreeCategorySelection> StageFreeCategorySelections => Set<StageFreeCategorySelection>();

        public DbSet<UserNotification> UserNotifications => Set<UserNotification>();
        public DbSet<CurriculumDraftBatch> CurriculumDraftBatches => Set<CurriculumDraftBatch>();
        public DbSet<PremiumAccessCode> PremiumAccessCodes => Set<PremiumAccessCode>();
        public DbSet<PremiumDiscountCode> PremiumDiscountCodes => Set<PremiumDiscountCode>();
        public DbSet<PremiumCheckoutOrder> PremiumCheckoutOrders => Set<PremiumCheckoutOrder>();
        public DbSet<PlatformActivityEvent> PlatformActivityEvents => Set<PlatformActivityEvent>();
        public DbSet<LearnerPresence> LearnerPresences => Set<LearnerPresence>();

        public DbSet<PlatformBrandSettings> PlatformBrandSettings => Set<PlatformBrandSettings>();

        public DbSet<PasswordResetGrant> PasswordResetGrants => Set<PasswordResetGrant>();
        public DbSet<EmailOutboxItem> EmailOutbox => Set<EmailOutboxItem>();

        public DbSet<LearningSession> LearningSessions => Set<LearningSession>();
        public DbSet<LearningSessionAttempt> LearningSessionAttempts => Set<LearningSessionAttempt>();
        public DbSet<LearningTrack> LearningTracks => Set<LearningTrack>();
        public DbSet<LearningTrackCategory> LearningTrackCategories => Set<LearningTrackCategory>();
        public DbSet<LearningTrackSkill> LearningTrackSkills => Set<LearningTrackSkill>();
        public DbSet<LearningTrackProblem> LearningTrackProblems => Set<LearningTrackProblem>();

        public DbSet<AppUser> Users =>
            Set<AppUser>();

        /// <summary>
        /// Categories table.
        /// </summary>
        public DbSet<ProblemDiagram> ProblemDiagrams => Set<ProblemDiagram>();

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
        /// Immutable problem attempt history table.
        /// جدول سجل محاولات المسائل غير القابل للاستبدال.
        /// </summary>
        public DbSet<ProblemAttempt> ProblemAttempts =>
            Set<ProblemAttempt>();

        /// <summary>
        /// Social login providers table.
        /// </summary>
        public DbSet<SocialLogin> SocialLogins =>
            Set<SocialLogin>();

        /// <summary>Private notifications scoped to one student.</summary>
        public DbSet<StudentNotification> StudentNotifications =>
            Set<StudentNotification>();

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

            modelBuilder.Entity<LearningSession>(e =>
            {
                e.Property(x => x.Id).ValueGeneratedNever();
                e.Property(x => x.Kind).HasMaxLength(12).IsRequired();
                e.Property(x => x.ScopeKey).HasMaxLength(100).IsRequired();
                e.Property(x => x.QuestionsJson).IsRequired();
                e.HasIndex(x => new { x.UserId, x.StartRequestId }).IsUnique();
                e.HasIndex(x => new { x.UserId, x.ScopeKey }).IsUnique()
                    .HasFilter("\"Kind\" = 'daily' OR \"CompletedAtUtc\" IS NULL");
                e.HasOne<AppUser>().WithMany().HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Cascade);
                e.ToTable(t =>
                {
                    t.HasCheckConstraint("CK_LearningSessions_Kind", "\"Kind\" IN ('practice','daily')");
                    t.HasCheckConstraint("CK_LearningSessions_Progress", "\"Total\" BETWEEN 5 AND 10 AND \"Completed\" BETWEEN 0 AND \"Total\" AND ((\"Completed\" = \"Total\") = (\"CompletedAtUtc\" IS NOT NULL)) AND (\"Kind\" <> 'daily' OR (\"Total\" = 5 AND \"CategoryId\" IS NULL))");
                });
            });
            modelBuilder.Entity<LearningSessionAttempt>(e =>
            {
                e.HasKey(x => new { x.SessionId, x.RequestId });
                e.HasIndex(x => new { x.SessionId, x.Position, x.AttemptNumber }).IsUnique();
                e.HasIndex(x => new { x.SessionId, x.Position }).IsUnique().HasFilter("\"IsCorrect\"");
                e.HasOne<LearningSession>().WithMany().HasForeignKey(x => x.SessionId).OnDelete(DeleteBehavior.Cascade);
                e.ToTable(t => t.HasCheckConstraint("CK_LearningSessionAttempts_Position", "\"Position\" BETWEEN 0 AND 9 AND \"AttemptNumber\" > 0 AND \"ProblemId\" > 0 AND \"SelectedOptionId\" > 0"));
            });


            modelBuilder.Entity<LearningTrack>(e =>
            {
                e.HasIndex(x => new { x.StageId, x.Code }).IsUnique();
                e.HasIndex(x => new { x.StageId, x.IsPublished, x.SortOrder });
                e.Property(x => x.Code).HasMaxLength(80).IsRequired();
                e.Property(x => x.Kind).HasMaxLength(12).IsRequired();
                e.HasOne<EducationalStage>().WithMany().HasForeignKey(x => x.StageId).OnDelete(DeleteBehavior.Restrict);
                e.ToTable(t => t.HasCheckConstraint("CK_LearningTracks_Kind", "\"Kind\" IN ('grade','course')"));
            });
            modelBuilder.Entity<LearningTrackCategory>(e =>
            {
                e.HasKey(x => new { x.TrackId, x.CategoryId });
                e.HasOne<LearningTrack>().WithMany().HasForeignKey(x => x.TrackId).OnDelete(DeleteBehavior.Cascade);
                e.HasOne<Category>().WithMany().HasForeignKey(x => x.CategoryId).OnDelete(DeleteBehavior.Cascade);
            });
            modelBuilder.Entity<LearningTrackSkill>(e =>
            {
                e.HasKey(x => new { x.TrackId, x.SkillId });
                e.HasOne<LearningTrack>().WithMany().HasForeignKey(x => x.TrackId).OnDelete(DeleteBehavior.Cascade);
                e.HasOne<CurriculumSkill>().WithMany().HasForeignKey(x => x.SkillId).OnDelete(DeleteBehavior.Cascade);
            });
            modelBuilder.Entity<LearningTrackProblem>(e =>
            {
                e.HasKey(x => new { x.TrackId, x.ProblemId });
                e.HasOne<LearningTrack>().WithMany().HasForeignKey(x => x.TrackId).OnDelete(DeleteBehavior.Cascade);
                e.HasOne<MathProblem>().WithMany().HasForeignKey(x => x.ProblemId).OnDelete(DeleteBehavior.Cascade);
            });
            modelBuilder.Entity<AppUser>().HasOne<LearningTrack>().WithMany()
                .HasForeignKey(x => x.CurrentTrackId).OnDelete(DeleteBehavior.Restrict);
            modelBuilder.Entity<AppUser>().Property(x => x.StaffPermissions).HasDefaultValue(0);
            modelBuilder.Entity<AppUser>().Property(x => x.StaffSetupPending).HasDefaultValue(false);
            modelBuilder.Entity<PasswordResetGrant>().Property(x => x.IsInvitation).HasDefaultValue(false);

            modelBuilder.Entity<PasswordResetGrant>(e =>
            {
                e.Property(x => x.Id).ValueGeneratedNever();
                e.HasIndex(x => x.TokenHash).IsUnique();
                e.HasIndex(x => new { x.UserId, x.CreatedAtUtc });
                e.HasOne<AppUser>().WithMany().HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Cascade);
            });
            modelBuilder.Entity<EmailOutboxItem>(e =>
            {
                e.Property(x => x.Id).ValueGeneratedNever();
                e.HasIndex(x => new { x.State, x.NextRetryAtUtc });
                e.HasIndex(x => x.CreatedAtUtc);
                e.HasOne<AppUser>().WithMany().HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Cascade);
            });

            modelBuilder.Entity<PlatformBrandSettings>(entity =>
            {
                entity.HasKey(x => x.Id);
                entity.Property(x => x.Id).ValueGeneratedNever();
                entity.Property(x => x.SettingsJson).HasColumnType("jsonb").IsRequired();
                entity.ToTable(t => t.HasCheckConstraint("CK_PlatformBrandSettings_Singleton", "\"Id\" = 1"));
            });

            modelBuilder.Entity<CurriculumDraftItem>(e =>
            {
                e.HasIndex(x => x.ContentKey).IsUnique();
                e.HasIndex(x => new { x.OwnerUserId, x.EditorialStatus });
                e.Property(x => x.Revision).HasDefaultValue(0);
                e.HasIndex(x => new { x.TopicProposalId, x.EditorialStatus });
                e.HasIndex(x => new { x.TopicProposalId, x.TemplateFamilyKey });
                e.Property(x => x.ContentKey).HasMaxLength(120).IsRequired();
                e.Property(x => x.PrimarySkillKey).HasMaxLength(120).IsRequired();
                e.Property(x => x.TemplateFamilyKey).HasMaxLength(160).IsRequired();
                e.Property(x => x.PisaProcess).HasMaxLength(32).IsRequired();
                e.Property(x => x.EditorialStatus).HasMaxLength(24).IsRequired();
                e.Property(x => x.OptionsJson).HasColumnType("jsonb").IsRequired();
                e.HasOne(x => x.TopicProposal).WithMany().HasForeignKey(x => x.TopicProposalId).OnDelete(DeleteBehavior.Cascade);
                e.ToTable(t => t.HasCheckConstraint("CK_CurriculumDraftItems_Difficulty", "\"DifficultyLevel\" BETWEEN 1 AND 5"));
            });

            modelBuilder.Entity<CurriculumTopicProposal>(e =>
            {
                e.HasIndex(x => x.StableKey).IsUnique();
                e.HasIndex(x => new { x.StageId, x.SortOrder });
                e.HasIndex(x => x.DomainId);
                e.Property(x => x.StableKey).HasMaxLength(120).IsRequired();
                e.Property(x => x.NameAr).IsRequired();
                e.Property(x => x.NameEn).IsRequired();
                e.Property(x => x.IconKey).HasMaxLength(80).IsRequired();
                e.Property(x => x.EditorialStatus).HasMaxLength(24).IsRequired();
                e.HasOne(x => x.Stage).WithMany().HasForeignKey(x => x.StageId).OnDelete(DeleteBehavior.Restrict);
                e.HasOne(x => x.Domain).WithMany().HasForeignKey(x => x.DomainId).OnDelete(DeleteBehavior.Restrict);
                e.ToTable(t => t.HasCheckConstraint("CK_CurriculumTopicProposals_QuestionCount", "\"ProposedQuestionCount\" >= 0"));
            });

            modelBuilder.Entity<CurriculumDomain>(e =>
            {
                e.HasIndex(x => x.StableKey).IsUnique();
                e.Property(x => x.StableKey).HasMaxLength(120).IsRequired();
                e.Property(x => x.NameAr).IsRequired();
                e.Property(x => x.NameEn).IsRequired();
            });
            modelBuilder.Entity<CurriculumSkill>(e =>
            {
                e.HasIndex(x => x.StableKey).IsUnique();
                e.HasIndex(x => new { x.StageId, x.CategoryId, x.SortOrder });
                e.HasIndex(x => x.CategoryId);
                e.Property(x => x.StableKey).HasMaxLength(160).IsRequired();
                e.Property(x => x.NameAr).IsRequired();
                e.Property(x => x.NameEn).IsRequired();
                e.HasOne(x => x.Domain).WithMany().HasForeignKey(x => x.DomainId).OnDelete(DeleteBehavior.Restrict);
                e.HasOne(x => x.Stage).WithMany().HasForeignKey(x => x.StageId).OnDelete(DeleteBehavior.Restrict);
                e.HasOne(x => x.Category).WithMany().HasForeignKey(x => x.CategoryId).OnDelete(DeleteBehavior.Restrict);
            });
            modelBuilder.Entity<CurriculumSkillStandard>(e =>
            {
                e.HasIndex(x => new { x.SkillId, x.Framework, x.StandardCode }).IsUnique();
                e.Property(x => x.Framework).HasMaxLength(32).IsRequired();
                e.Property(x => x.StandardCode).HasMaxLength(100).IsRequired();
                e.Property(x => x.MappingType).HasMaxLength(20).IsRequired();
                e.HasOne(x => x.Skill).WithMany().HasForeignKey(x => x.SkillId).OnDelete(DeleteBehavior.Cascade);
            });
            modelBuilder.Entity<CurriculumSkillPrerequisite>(e =>
            {
                e.HasKey(x => new { x.SkillId, x.PrerequisiteSkillId });
                e.HasOne(x => x.Skill).WithMany().HasForeignKey(x => x.SkillId).OnDelete(DeleteBehavior.Cascade);
                e.HasOne(x => x.PrerequisiteSkill).WithMany().HasForeignKey(x => x.PrerequisiteSkillId).OnDelete(DeleteBehavior.Restrict);
                e.ToTable(t => t.HasCheckConstraint("CK_CurriculumPrerequisite_NotSelf", "\"SkillId\" <> \"PrerequisiteSkillId\""));
            });
            modelBuilder.Entity<CurriculumProblemSkill>(e =>
            {
                e.HasKey(x => new { x.ProblemId, x.SkillId });
                e.HasIndex(x => x.ProblemId).IsUnique().HasFilter("\"IsPrimary\" = TRUE");
                e.HasOne(x => x.Skill).WithMany().HasForeignKey(x => x.SkillId).OnDelete(DeleteBehavior.Cascade);
                e.HasOne(x => x.Problem).WithMany().HasForeignKey(x => x.ProblemId).OnDelete(DeleteBehavior.Cascade);
            });

            modelBuilder.Entity<LearnerPresence>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.SessionId });
                entity.Property(e => e.LastSeenAtUtc).IsRequired();
                entity.HasIndex(e => e.LastSeenAtUtc);
                entity.HasOne<AppUser>().WithMany()
                    .HasForeignKey(e => e.UserId)
                    .OnDelete(DeleteBehavior.Cascade);
            });

            modelBuilder.Entity<PlatformActivityEvent>(entity =>
            {
                entity.Property(e => e.ActorRole).HasMaxLength(32).IsRequired();
                entity.Property(e => e.Action).HasMaxLength(64).IsRequired();
                entity.Property(e => e.Resource).HasMaxLength(140).IsRequired();
                entity.Property(e => e.ResourceId).HasMaxLength(64);
                entity.Property(e => e.Origin).HasMaxLength(24).IsRequired();
                entity.HasIndex(e => new { e.ActorUserId, e.CreatedAtUtc });
                entity.HasIndex(e => new { e.ActorRole, e.CreatedAtUtc });
                entity.HasIndex(e => new { e.CreatedAtUtc, e.Id });
                entity.HasOne<AppUser>().WithMany()
                    .HasForeignKey(e => e.ActorUserId)
                    .OnDelete(DeleteBehavior.Restrict);
            });

            modelBuilder.Entity<StageFreeCategorySelection>().HasKey(x => x.StageId);
            modelBuilder.Entity<StageFreeCategorySelection>()
                .ToTable(t => t.HasCheckConstraint("CK_StageFreeCategorySelections_Distinct",
                    "\"FirstCategoryId\" <> \"SecondCategoryId\""));
            modelBuilder.Entity<StageFreeCategorySelection>()
                .HasOne<EducationalStage>().WithOne()
                .HasForeignKey<StageFreeCategorySelection>(x => x.StageId)
                .OnDelete(DeleteBehavior.Cascade);
            modelBuilder.Entity<StageFreeCategorySelection>()
                .HasOne<AppUser>().WithMany()
                .HasForeignKey(x => x.UpdatedByAdminId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<PremiumCheckoutOrder>()
                .HasOne<AppUser>().WithMany()
                .HasForeignKey(x => x.StudentId).OnDelete(DeleteBehavior.Restrict);
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .HasOne<PremiumDiscountCode>().WithMany()
                .HasForeignKey(x => x.DiscountCodeId).OnDelete(DeleteBehavior.Restrict);
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .Property(x => x.OrderReference).HasMaxLength(64).IsRequired();
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .HasIndex(x => x.OrderReference).IsUnique();
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .Property(x => x.Status).HasMaxLength(24).IsRequired();
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .Property(x => x.Currency).HasMaxLength(3).IsRequired();
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .Property(x => x.Provider).HasMaxLength(40);
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .Property(x => x.ProviderPaymentId).HasMaxLength(160);
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .HasIndex(x => new { x.Provider, x.ProviderPaymentId })
                .IsUnique()
                .HasFilter("\"Provider\" IS NOT NULL AND \"ProviderPaymentId\" IS NOT NULL");
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .HasIndex(x => new { x.StudentId, x.CreatedAtUtc });
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .Property(x => x.SubtotalUsd).HasPrecision(10, 2);
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .Property(x => x.DiscountUsd).HasPrecision(10, 2);
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .Property(x => x.TotalUsd).HasPrecision(10, 2);
            modelBuilder.Entity<PremiumCheckoutOrder>()
                .ToTable(t =>
                {
                    t.HasCheckConstraint("CK_PremiumCheckoutOrders_Amounts",
                        "\"SubtotalUsd\" >= 0 AND \"DiscountUsd\" >= 0 AND \"TotalUsd\" >= 0 AND \"SubtotalUsd\" = \"DiscountUsd\" + \"TotalUsd\"");
                    t.HasCheckConstraint("CK_PremiumCheckoutOrders_Currency",
                        "\"Currency\" = 'USD'");
                    t.HasCheckConstraint("CK_PremiumCheckoutOrders_Status",
                        "\"Status\" IN ('Pending', 'Paid', 'Failed', 'Cancelled', 'Refunded')");
                    t.HasCheckConstraint("CK_PremiumCheckoutOrders_PaidVerification",
                        "\"Status\" <> 'Paid' OR \"VerifiedPaidAtUtc\" IS NOT NULL");
                    t.HasCheckConstraint("CK_PremiumCheckoutOrders_DiscountRedemption",
                        "\"DiscountRedeemedAtUtc\" IS NULL OR (\"DiscountCodeId\" IS NOT NULL AND \"VerifiedPaidAtUtc\" IS NOT NULL)");
                });

            modelBuilder.Entity<PremiumDiscountCode>()
                .HasOne<AppUser>().WithMany()
                .HasForeignKey(x => x.CreatedByAdminId)
                .OnDelete(DeleteBehavior.Restrict);
            modelBuilder.Entity<PremiumDiscountCode>()
                .Property(x => x.CodeHash).HasMaxLength(64).IsRequired();
            modelBuilder.Entity<PremiumDiscountCode>()
                .HasIndex(x => x.CodeHash).IsUnique();
            modelBuilder.Entity<PremiumDiscountCode>()
                .Property(x => x.Label).HasMaxLength(80).IsRequired();
            modelBuilder.Entity<PremiumDiscountCode>()
                .Property(x => x.DiscountKind).HasMaxLength(20).IsRequired();
            modelBuilder.Entity<PremiumDiscountCode>()
                .Property(x => x.Amount).HasPrecision(10, 2);
            modelBuilder.Entity<PremiumDiscountCode>()
                .Property(x => x.MaxRedemptionsPerStudent).HasDefaultValue(1);
            modelBuilder.Entity<PremiumDiscountCode>()
                .HasIndex(x => new { x.Enabled, x.StartsAtUtc, x.EndsAtUtc });
            modelBuilder.Entity<PremiumDiscountCode>()
                .ToTable(t =>
                {
                    t.HasCheckConstraint("CK_PremiumDiscountCodes_Window",
                        "\"EndsAtUtc\" > \"StartsAtUtc\"");
                    t.HasCheckConstraint("CK_PremiumDiscountCodes_Usage",
                        "\"RedemptionCount\" >= 0 AND (\"MaxRedemptions\" IS NULL OR \"MaxRedemptions\" > 0) AND (\"MaxRedemptionsPerStudent\" IS NULL OR \"MaxRedemptionsPerStudent\" > 0)");
                    t.HasCheckConstraint("CK_PremiumDiscountCodes_Amount",
                        "\"Amount\" >= 0 AND ((\"DiscountKind\" = 'Percentage' AND \"Amount\" <= 100) OR (\"DiscountKind\" = 'FixedUsd' AND \"Amount\" <= 5.00))");
                });

            modelBuilder.Entity<PremiumAccessCode>()
                .HasOne<AppUser>().WithMany()
                .HasForeignKey(x => x.CreatedByAdminId)
                .OnDelete(DeleteBehavior.Restrict);
            modelBuilder.Entity<PremiumAccessCode>()
                .HasOne<AppUser>().WithMany()
                .HasForeignKey(x => x.RedeemedByUserId)
                .OnDelete(DeleteBehavior.Restrict);
            modelBuilder.Entity<PremiumAccessCode>()
                .Property(x => x.CodeHash).HasMaxLength(64).IsRequired();
            modelBuilder.Entity<PremiumAccessCode>()
                .HasIndex(x => x.CodeHash).IsUnique();
            modelBuilder.Entity<PremiumAccessCode>()
                .Property(x => x.Label).HasMaxLength(80).IsRequired();
            modelBuilder.Entity<PremiumAccessCode>()
                .HasIndex(x => x.ExpiresAtUtc);

            modelBuilder.Entity<CurriculumDraftBatch>()
                .HasOne<AppUser>().WithMany()
                .HasForeignKey(x => x.SubmittedByAdminId)
                .OnDelete(DeleteBehavior.Restrict);
            modelBuilder.Entity<CurriculumDraftBatch>()
                .HasOne<AppUser>().WithMany()
                .HasForeignKey(x => x.ReviewedByAdminId)
                .OnDelete(DeleteBehavior.Restrict);
            modelBuilder.Entity<CurriculumDraftBatch>()
                .Property(x => x.Status).HasMaxLength(30).IsRequired();
            modelBuilder.Entity<CurriculumDraftBatch>()
                .Property(x => x.ProblemsJson).IsRequired();
            modelBuilder.Entity<CurriculumDraftBatch>()
                .Property(x => x.ReviewNote).HasMaxLength(1000);
            modelBuilder.Entity<CurriculumDraftBatch>()
                .HasIndex(x => new { x.Status, x.SubmittedAtUtc });

            modelBuilder.Entity<UserNotification>()
                .HasOne<AppUser>().WithMany()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);
            modelBuilder.Entity<UserNotification>()
                .Property(x => x.Type).HasMaxLength(40).IsRequired();
            modelBuilder.Entity<UserNotification>()
                .Property(x => x.TitleAr).HasMaxLength(160).IsRequired();
            modelBuilder.Entity<UserNotification>()
                .Property(x => x.TitleEn).HasMaxLength(160).IsRequired();
            modelBuilder.Entity<UserNotification>()
                .Property(x => x.BodyAr).HasMaxLength(1000).IsRequired();
            modelBuilder.Entity<UserNotification>()
                .Property(x => x.BodyEn).HasMaxLength(1000).IsRequired();
            modelBuilder.Entity<UserNotification>()
                .Property(x => x.TargetPath).HasMaxLength(300);
            modelBuilder.Entity<UserNotification>()
                .HasIndex(x => new { x.UserId, x.CreatedAtUtc });
            modelBuilder.Entity<UserNotification>()
                .HasIndex(x => new { x.UserId, x.ReadAtUtc });

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
                .Property(user => user.TokenVersion)
                .IsConcurrencyToken()
                .HasDefaultValue(0);

            modelBuilder.Entity<AppUser>()
                .Property(user => user.Role)
                .HasMaxLength(32)
                .IsRequired();

            modelBuilder.Entity<AppUser>()
                .Property(user => user.SubscriptionType)
                .HasMaxLength(32)
                .IsRequired();

            modelBuilder.Entity<SubscriptionGrant>()
                .HasIndex(x => new { x.LearnerId, x.ChangedAtUtc });

            modelBuilder.Entity<SubscriptionGrant>()
                .Property(x => x.Reason).HasMaxLength(500).IsRequired();

            modelBuilder.Entity<SubscriptionGrant>()
                .HasOne<AppUser>().WithMany().HasForeignKey(x => x.LearnerId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<SubscriptionGrant>()
                .HasOne<AppUser>().WithMany().HasForeignKey(x => x.AdminId)
                .OnDelete(DeleteBehavior.Restrict);

            // Stage preference never changes or deletes historical learning data.
            modelBuilder.Entity<AppUser>()
                .HasOne<EducationalStage>()
                .WithMany()
                .HasForeignKey(user => user.CurrentStageId)
                .OnDelete(DeleteBehavior.Restrict);

            // =================================================================
            // ENTITY RELATIONSHIPS
            // =================================================================

            modelBuilder.Entity<Category>()
                .HasOne(category => category.Stage)
                .WithMany(stage => stage.Categories)
                .HasForeignKey(category => category.StageId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<ProblemDiagram>()
                .HasKey(diagram => diagram.ProblemId);

            modelBuilder.Entity<ProblemDiagram>()
                .HasOne(diagram => diagram.Problem)
                .WithOne()
                .HasForeignKey<ProblemDiagram>(diagram => diagram.ProblemId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<ProblemDiagram>()
                .Property(diagram => diagram.DiagramJson)
                .HasMaxLength(30000).IsRequired();

            modelBuilder.Entity<ProblemDiagram>()
                .Property(diagram => diagram.AltTextAr)
                .HasMaxLength(500).IsRequired();

            modelBuilder.Entity<ProblemDiagram>()
                .Property(diagram => diagram.AltTextEn)
                .HasMaxLength(500).IsRequired();

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

            modelBuilder.Entity<UserProgress>().Property(p=>p.HintsRevealed).HasDefaultValue(0);
            modelBuilder.Entity<UserProgress>()
                .Property(progress => progress.MasteryStatus)
                .HasMaxLength(32)
                .HasDefaultValue(MasteryStatuses.New)
                .IsRequired();

            modelBuilder.Entity<ProblemAttempt>()
                .HasOne(attempt => attempt.User)
                .WithMany(user => user.ProblemAttempts)
                .HasForeignKey(attempt => attempt.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<ProblemAttempt>()
                .HasOne(attempt => attempt.Problem)
                .WithMany(problem => problem.ProblemAttempts)
                .HasForeignKey(attempt => attempt.ProblemId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<ProblemAttempt>()
                .Property(attempt => attempt.SelectedOptionText)
                .IsRequired();

            modelBuilder.Entity<ProblemAttempt>()
                .Property(attempt => attempt.CorrectOptionText)
                .IsRequired();

            modelBuilder.Entity<StudentNotification>()
                .HasOne(notification => notification.User)
                .WithMany()
                .HasForeignKey(notification => notification.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<StudentNotification>()
                .Property(notification => notification.Type)
                .HasMaxLength(40).IsRequired();

            modelBuilder.Entity<StudentNotification>()
                .Property(notification => notification.TitleAr)
                .HasMaxLength(140).IsRequired();

            modelBuilder.Entity<StudentNotification>()
                .Property(notification => notification.TitleEn)
                .HasMaxLength(140).IsRequired();

            modelBuilder.Entity<StudentNotification>()
                .Property(notification => notification.BodyAr)
                .HasMaxLength(1000).IsRequired();

            modelBuilder.Entity<StudentNotification>()
                .Property(notification => notification.BodyEn)
                .HasMaxLength(1000).IsRequired();

            modelBuilder.Entity<StudentNotification>()
                .Property(notification => notification.ActionPath)
                .HasMaxLength(200);

            modelBuilder.Entity<StudentNotification>()
                .HasIndex(notification => new {
                    notification.UserId,
                    notification.CreatedAt
                });

            modelBuilder.Entity<StudentNotification>()
                .HasIndex(notification => new {
                    notification.UserId,
                    notification.ReadAt
                });

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

            modelBuilder.Entity<UserProgress>()
                .HasIndex(progress => new
                {
                    progress.UserId,
                    progress.IsInErrorNotebook,
                    progress.IsErrorNotebookArchived
                });

            modelBuilder.Entity<UserProgress>()
                .HasIndex(progress => new
                {
                    progress.UserId,
                    progress.NextReviewAt
                });

            modelBuilder.Entity<ProblemAttempt>()
                .HasIndex(attempt => new
                {
                    attempt.UserId,
                    attempt.ProblemId,
                    attempt.AttemptNumber
                })
                .IsUnique();

            modelBuilder.Entity<ProblemAttempt>()
                .HasIndex(attempt => new
                {
                    attempt.UserId,
                    attempt.SubmittedAt
                });

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