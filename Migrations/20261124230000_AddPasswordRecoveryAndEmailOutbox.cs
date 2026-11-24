using System;
using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable
namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261124230000_AddPasswordRecoveryAndEmailOutbox")]
public partial class AddPasswordRecoveryAndEmailOutbox : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "PasswordResetGrants",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                UserId = table.Column<int>(type: "integer", nullable: false),
                TokenHash = table.Column<string>(type: "text", nullable: false),
                Email = table.Column<string>(type: "text", nullable: false),
                Role = table.Column<string>(type: "text", nullable: false),
                TokenVersion = table.Column<int>(type: "integer", nullable: false),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                ExpiresAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                ConsumedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_PasswordResetGrants", x => x.Id);
                table.ForeignKey("FK_PasswordResetGrants_Users_UserId", x => x.UserId, "Users", "Id", onDelete: ReferentialAction.Cascade);
            });
        migrationBuilder.CreateTable(
            name: "EmailOutbox",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                UserId = table.Column<int>(type: "integer", nullable: false),
                ResetGrantId = table.Column<Guid>(type: "uuid", nullable: true),
                Recipient = table.Column<string>(type: "text", nullable: false),
                TemplateKey = table.Column<string>(type: "text", nullable: false),
                Locale = table.Column<string>(type: "text", nullable: false),
                State = table.Column<string>(type: "text", nullable: false),
                Attempts = table.Column<int>(type: "integer", nullable: false),
                CreatedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                ExpiresAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                NextRetryAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                LeaseId = table.Column<Guid>(type: "uuid", nullable: true),
                ProviderMessageId = table.Column<string>(type: "text", nullable: true),
                LastErrorCode = table.Column<string>(type: "text", nullable: true)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_EmailOutbox", x => x.Id);
                table.ForeignKey("FK_EmailOutbox_Users_UserId", x => x.UserId, "Users", "Id", onDelete: ReferentialAction.Cascade);
            });
        migrationBuilder.CreateIndex("IX_PasswordResetGrants_TokenHash", "PasswordResetGrants", "TokenHash", unique: true);
        migrationBuilder.CreateIndex("IX_PasswordResetGrants_UserId_CreatedAtUtc", "PasswordResetGrants", new[] { "UserId", "CreatedAtUtc" });
        migrationBuilder.CreateIndex("IX_EmailOutbox_UserId", "EmailOutbox", "UserId");
        migrationBuilder.CreateIndex("IX_EmailOutbox_CreatedAtUtc", "EmailOutbox", "CreatedAtUtc");
        migrationBuilder.CreateIndex("IX_EmailOutbox_State_NextRetryAtUtc", "EmailOutbox", new[] { "State", "NextRetryAtUtc" });
        migrationBuilder.Sql("""
            ALTER TABLE public."PasswordResetGrants" ENABLE ROW LEVEL SECURITY;
            ALTER TABLE public."EmailOutbox" ENABLE ROW LEVEL SECURITY;
            REVOKE ALL ON TABLE public."PasswordResetGrants", public."EmailOutbox" FROM PUBLIC;
            DO $security$
            DECLARE api_role text;
            BEGIN
                FOREACH api_role IN ARRAY ARRAY['anon','authenticated'] LOOP
                    IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname=api_role) THEN
                        EXECUTE format('REVOKE ALL ON TABLE public."PasswordResetGrants", public."EmailOutbox" FROM %I',api_role);
                    END IF;
                END LOOP;
            END $security$;
            """);
    }

    protected override void Down(MigrationBuilder migrationBuilder) =>
        throw new NotSupportedException("Recovery and delivery audit data must not be automatically dropped.");
}
