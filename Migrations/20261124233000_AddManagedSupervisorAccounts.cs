using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MathWorldAPI.Migrations;

[DbContext(typeof(AppDbContext))]
[Migration("20261124233000_AddManagedSupervisorAccounts")]
public sealed class AddManagedSupervisorAccounts : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.AddColumn<int>("StaffPermissions", "Users", type: "integer", nullable: false, defaultValue: 0);
        m.AddColumn<bool>("StaffSetupPending", "Users", type: "boolean", nullable: false, defaultValue: false);
        m.AddColumn<bool>("IsInvitation", "PasswordResetGrants", type: "boolean", nullable: false, defaultValue: false);
    }
    protected override void Down(MigrationBuilder m) =>
        throw new NotSupportedException("Staff security state must not be automatically removed.");
}
