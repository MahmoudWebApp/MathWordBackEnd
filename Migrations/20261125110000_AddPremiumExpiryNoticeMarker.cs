using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125110000_AddPremiumExpiryNoticeMarker")]
public sealed class AddPremiumExpiryNoticeMarker : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.AddColumn<DateTime>("PremiumExpiryNotifiedAtUtc","Users",type:"timestamp with time zone",nullable:true);
    }
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Do not discard expiry notice deduplication evidence.");
}
