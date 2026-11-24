using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125120000_AddEmailVerificationGrants")]
public sealed class AddEmailVerificationGrants:Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.CreateTable("EmailVerificationGrants",columns:t=>new {
            Id=t.Column<Guid>(type:"uuid",nullable:false),
            UserId=t.Column<int>(type:"integer",nullable:false),
            Email=t.Column<string>(type:"text",nullable:false),
            TokenHash=t.Column<string>(type:"text",nullable:false),
            TokenVersion=t.Column<int>(type:"integer",nullable:false),
            CreatedAtUtc=t.Column<DateTime>(type:"timestamp with time zone",nullable:false),
            ExpiresAtUtc=t.Column<DateTime>(type:"timestamp with time zone",nullable:false),
            ConsumedAtUtc=t.Column<DateTime>(type:"timestamp with time zone",nullable:true)
        },constraints:t=>{
            t.PrimaryKey("PK_EmailVerificationGrants",x=>x.Id);
            t.ForeignKey("FK_EmailVerificationGrants_Users_UserId",x=>x.UserId,"Users","Id",onDelete:ReferentialAction.Cascade);
        });
        m.CreateIndex("IX_EmailVerificationGrants_TokenHash","EmailVerificationGrants","TokenHash",unique:true);
        m.CreateIndex("IX_EmailVerificationGrants_UserId_CreatedAtUtc","EmailVerificationGrants",new[]{"UserId","CreatedAtUtc"});
        m.CreateIndex("IX_EmailVerificationGrants_CreatedAtUtc","EmailVerificationGrants","CreatedAtUtc");
        m.Sql("""
            ALTER TABLE public."EmailVerificationGrants" ENABLE ROW LEVEL SECURITY;
            REVOKE ALL ON TABLE public."EmailVerificationGrants" FROM PUBLIC;
            DO $security$
            DECLARE api_role text;
            BEGIN
                FOREACH api_role IN ARRAY ARRAY['anon','authenticated'] LOOP
                    IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname=api_role) THEN
                        EXECUTE format('REVOKE ALL ON TABLE public."EmailVerificationGrants" FROM %I',api_role);
                    END IF;
                END LOOP;
            END $security$;
            """);
    }
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Do not discard email verification audit records.");
}
