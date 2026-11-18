using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations
{
    [DbContext(typeof(AppDbContext))]
    [Migration("20261113181000_AddSubscriptionGrantAudit")]
    public partial class AddSubscriptionGrantAudit : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "SubscriptionGrants",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy",
                            Npgsql.EntityFrameworkCore.PostgreSQL.Metadata.NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    LearnerId = table.Column<int>(type: "integer", nullable: false),
                    AdminId = table.Column<int>(type: "integer", nullable: false),
                    PreviousType = table.Column<string>(type: "text", nullable: false),
                    NewType = table.Column<string>(type: "text", nullable: false),
                    PreviousExpiresAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                    NewExpiresAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                    Reason = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: false),
                    ChangedAtUtc = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SubscriptionGrants", x => x.Id);
                    table.ForeignKey("FK_SubscriptionGrants_Users_AdminId",
                        x => x.AdminId, "Users", "Id", onDelete: ReferentialAction.Restrict);
                    table.ForeignKey("FK_SubscriptionGrants_Users_LearnerId",
                        x => x.LearnerId, "Users", "Id", onDelete: ReferentialAction.Restrict);
                });
            migrationBuilder.CreateIndex("IX_SubscriptionGrants_AdminId",
                "SubscriptionGrants", "AdminId");
            migrationBuilder.CreateIndex("IX_SubscriptionGrants_LearnerId_ChangedAtUtc",
                "SubscriptionGrants", new[] { "LearnerId", "ChangedAtUtc" });
        }

        protected override void Down(MigrationBuilder migrationBuilder) =>
            migrationBuilder.DropTable(name: "SubscriptionGrants");
    }
}
