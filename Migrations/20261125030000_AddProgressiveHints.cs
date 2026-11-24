using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125030000_AddProgressiveHints")]
public sealed class AddProgressiveHints : Migration
{
    protected override void Up(MigrationBuilder m)=>m.AddColumn<int>("HintsRevealed","UserProgresses",type:"integer",nullable:false,defaultValue:0);
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Hint usage state must not be dropped automatically.");
}
