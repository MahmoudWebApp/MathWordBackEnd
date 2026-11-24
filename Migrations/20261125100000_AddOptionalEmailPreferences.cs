using MathWorldAPI.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MathWorldAPI.Migrations;
[DbContext(typeof(AppDbContext))]
[Migration("20261125100000_AddOptionalEmailPreferences")]
public sealed class AddOptionalEmailPreferences : Migration
{
    protected override void Up(MigrationBuilder m)
    {
        m.AddColumn<string>("VerifiedNotificationEmail","Users",type:"character varying(256)",maxLength:256,nullable:true);
        m.AddColumn<string>("EmailNotificationLocale","Users",type:"character varying(2)",maxLength:2,nullable:true);
        foreach(var name in new[]{"EmailLearningUpdates","EmailSubscriptionUpdates","EmailImportantAnnouncements"})
            m.AddColumn<bool>(name,"Users",type:"boolean",nullable:false,defaultValue:false);
    }
    protected override void Down(MigrationBuilder m)=>throw new NotSupportedException("Do not discard recorded email choices.");
}
