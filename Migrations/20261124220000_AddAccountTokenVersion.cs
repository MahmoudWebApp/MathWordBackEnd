using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261124220000_AddAccountTokenVersion")]
public partial class AddAccountTokenVersion : Migration
{
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<int>(
            name: "TokenVersion",
            table: "Users",
            type: "integer",
            nullable: false,
            defaultValue: 0);
    }

    protected override void Down(MigrationBuilder migrationBuilder)
    {
        // Dropping the version can revive revoked tokens. Roll back application
        // code only after a security review; do not remove revocation state.
        throw new System.NotSupportedException(
            "Account session revocation state must not be automatically removed.");
    }
}
