using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations
{
    /// <summary>
    /// Nullable expiry preserves existing Premium grants as indefinite.
    /// No user, progress, or attempt rows are modified.
    /// </summary>
    [DbContext(typeof(AppDbContext))]
    [Migration("20261113180000_AddPremiumExpiry")]
    public partial class AddPremiumExpiry : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "PremiumExpiresAtUtc",
                table: "Users",
                type: "timestamp with time zone",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PremiumExpiresAtUtc",
                table: "Users");
        }
    }
}
