using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable
namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261124223000_AddPlatformBrandSettings")]
public partial class AddPlatformBrandSettings : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "PlatformBrandSettings",
            columns: table => new
            {
                Id = table.Column<int>(type: "integer", nullable: false),
                Revision = table.Column<int>(type: "integer", nullable: false),
                SettingsJson = table.Column<string>(type: "jsonb", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_PlatformBrandSettings", x => x.Id);
                table.CheckConstraint("CK_PlatformBrandSettings_Singleton", "\"Id\" = 1");
            });
        migrationBuilder.Sql("""
            INSERT INTO public."PlatformBrandSettings" ("Id","Revision","SettingsJson")
            VALUES (1,0,'{}'::jsonb);
            ALTER TABLE public."PlatformBrandSettings" ENABLE ROW LEVEL SECURITY;
            REVOKE ALL ON TABLE public."PlatformBrandSettings" FROM PUBLIC;
            DO $brand_security$
            DECLARE api_role text;
            BEGIN
                FOREACH api_role IN ARRAY ARRAY['anon','authenticated']
                LOOP
                    IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname=api_role) THEN
                        EXECUTE format('REVOKE ALL ON TABLE public."PlatformBrandSettings" FROM %I',api_role);
                    END IF;
                END LOOP;
            END $brand_security$;
            """);
    }

    protected override void Down(MigrationBuilder migrationBuilder) =>
        throw new System.NotSupportedException("Export brand settings before any destructive schema rollback.");
}
