using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125210000_AddEmailVerificationCodeAttempts")]
public sealed class AddEmailVerificationCodeAttempts:Migration
{
    protected override void Up(MigrationBuilder m)=>m.AddColumn<int>("FailedCodeAttempts","EmailVerificationGrants",type:"integer",nullable:false,defaultValue:0);
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Do not discard verification attempt limits.");
}
