using System;
using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261126190000_AddCustomExams")]
public partial class AddCustomExams : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "CustomExams",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                StartRequestId = table.Column<Guid>(type: "uuid", nullable: false),
                UserId = table.Column<int>(type: "integer", nullable: false),
                StageId = table.Column<int>(type: "integer", nullable: false),
                TrackId = table.Column<int>(type: "integer", nullable: false),
                CategoryId = table.Column<int>(type: "integer", nullable: true),
                TitleAr = table.Column<string>(type: "text", nullable: false),
                TitleEn = table.Column<string>(type: "text", nullable: false),
                QuestionsJson = table.Column<string>(type: "text", nullable: false),
                AnswersJson = table.Column<string>(type: "text", nullable: false),
                Total = table.Column<int>(type: "integer", nullable: false),
                PassPercent = table.Column<int>(type: "integer", nullable: false),
                PolicyVersion = table.Column<int>(type: "integer", nullable: false),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                FinishedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                AbandonedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                Score = table.Column<int>(type: "integer", nullable: true),
                CertificateStudentName = table.Column<string>(type: "character varying(300)", maxLength: 300, nullable: true),
                VerificationCode = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_CustomExams", x => x.Id);
                table.ForeignKey("FK_CustomExams_Users_UserId", x => x.UserId, "Users", "Id", onDelete: ReferentialAction.Cascade);
                table.CheckConstraint("CK_CustomExams_Total", "\"Total\" IN (5,10,15,20) AND \"PassPercent\" BETWEEN 1 AND 100 AND \"PolicyVersion\" > 0");
                table.CheckConstraint("CK_CustomExams_State", "(\"FinishedAtUtc\" IS NULL AND \"Score\" IS NULL AND \"VerificationCode\" IS NULL AND \"CertificateStudentName\" IS NULL) OR (\"FinishedAtUtc\" IS NOT NULL AND \"AbandonedAtUtc\" IS NULL AND \"Score\" IS NOT NULL AND \"Score\" BETWEEN 0 AND \"Total\" AND ((\"Score\" * 100 >= \"PassPercent\" * \"Total\" AND \"VerificationCode\" IS NOT NULL AND \"CertificateStudentName\" IS NOT NULL) OR (\"Score\" * 100 < \"PassPercent\" * \"Total\" AND \"VerificationCode\" IS NULL AND \"CertificateStudentName\" IS NULL)))");
            });
        // Exam snapshots include answer keys and must not be exposed through Supabase Data API.
        migrationBuilder.Sql("ALTER TABLE \"CustomExams\" ENABLE ROW LEVEL SECURITY; REVOKE ALL ON TABLE \"CustomExams\" FROM PUBLIC;");
        migrationBuilder.Sql("DO $$ BEGIN IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'anon') THEN REVOKE ALL ON TABLE \"CustomExams\" FROM anon; END IF; IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'authenticated') THEN REVOKE ALL ON TABLE \"CustomExams\" FROM authenticated; END IF; END $$;");
        migrationBuilder.CreateIndex(name:"IX_CustomExams_UserId",table:"CustomExams",column:"UserId",unique:true,filter:"\"FinishedAtUtc\" IS NULL AND \"AbandonedAtUtc\" IS NULL");
        migrationBuilder.CreateIndex(name:"IX_CustomExams_UserId_StartRequestId",table:"CustomExams",columns:new[]{"UserId","StartRequestId"},unique:true);
        migrationBuilder.CreateIndex(name:"IX_CustomExams_UserId_CreatedAtUtc",table:"CustomExams",columns:new[]{"UserId","CreatedAtUtc"});
        migrationBuilder.CreateIndex(name:"IX_CustomExams_VerificationCode",table:"CustomExams",column:"VerificationCode",unique:true);
    }

    protected override void Down(MigrationBuilder migrationBuilder) => migrationBuilder.DropTable("CustomExams");
}
