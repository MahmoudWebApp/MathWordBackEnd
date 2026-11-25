using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125130000_AddLeaderboardNamePreference")]
public sealed class AddLeaderboardNamePreference : Migration
{
    protected override void Up(MigrationBuilder m)=>m.AddColumn<bool>(name:"ShareLeaderboardFullName",table:"Users",type:"boolean",nullable:false,defaultValue:false);
    protected override void Down(MigrationBuilder m)=>m.DropColumn(name:"ShareLeaderboardFullName",table:"Users");
}
