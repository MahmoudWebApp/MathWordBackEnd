using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations
{
    /// <inheritdoc />
    public partial class RemoveSocialLoginAccessToken : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Problems_EducationalStages_StageId",
                table: "Problems");

            migrationBuilder.DropIndex(
                name: "IX_QuestionOptions_ProblemId",
                table: "QuestionOptions");

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DropColumn(
                name: "AccessToken",
                table: "SocialLogins");

            migrationBuilder.AlterColumn<string>(
                name: "SubscriptionType",
                table: "Users",
                type: "character varying(32)",
                maxLength: 32,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "Role",
                table: "Users",
                type: "character varying(32)",
                maxLength: 32,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "FullName",
                table: "Users",
                type: "character varying(150)",
                maxLength: 150,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "Users",
                type: "character varying(256)",
                maxLength: 256,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "ProviderId",
                table: "SocialLogins",
                type: "character varying(255)",
                maxLength: 255,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "Provider",
                table: "SocialLogins",
                type: "character varying(50)",
                maxLength: 50,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "ProfilePicture",
                table: "SocialLogins",
                type: "character varying(1000)",
                maxLength: 1000,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "text",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Users_Email",
                table: "Users",
                column: "Email",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_SocialLogins_Provider_ProviderId",
                table: "SocialLogins",
                columns: new[] { "Provider", "ProviderId" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_QuestionOptions_ProblemId_Order",
                table: "QuestionOptions",
                columns: new[] { "ProblemId", "Order" },
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Problems_EducationalStages_StageId",
                table: "Problems",
                column: "StageId",
                principalTable: "EducationalStages",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Problems_EducationalStages_StageId",
                table: "Problems");

            migrationBuilder.DropIndex(
                name: "IX_Users_Email",
                table: "Users");

            migrationBuilder.DropIndex(
                name: "IX_SocialLogins_Provider_ProviderId",
                table: "SocialLogins");

            migrationBuilder.DropIndex(
                name: "IX_QuestionOptions_ProblemId_Order",
                table: "QuestionOptions");

            migrationBuilder.AlterColumn<string>(
                name: "SubscriptionType",
                table: "Users",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character varying(32)",
                oldMaxLength: 32);

            migrationBuilder.AlterColumn<string>(
                name: "Role",
                table: "Users",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character varying(32)",
                oldMaxLength: 32);

            migrationBuilder.AlterColumn<string>(
                name: "FullName",
                table: "Users",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character varying(150)",
                oldMaxLength: 150);

            migrationBuilder.AlterColumn<string>(
                name: "Email",
                table: "Users",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character varying(256)",
                oldMaxLength: 256);

            migrationBuilder.AlterColumn<string>(
                name: "ProviderId",
                table: "SocialLogins",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character varying(255)",
                oldMaxLength: 255);

            migrationBuilder.AlterColumn<string>(
                name: "Provider",
                table: "SocialLogins",
                type: "text",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character varying(50)",
                oldMaxLength: 50);

            migrationBuilder.AlterColumn<string>(
                name: "ProfilePicture",
                table: "SocialLogins",
                type: "text",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "character varying(1000)",
                oldMaxLength: 1000,
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "AccessToken",
                table: "SocialLogins",
                type: "text",
                nullable: true);

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "CreatedAt", "Email", "FullName", "IsActive", "LastLoginAt", "PasswordHash", "ProfilePicture", "Role", "SubscriptionType" },
                values: new object[] { 1, new DateTime(2024, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc), "admin@mathworld.com", "System Admin", true, null, "$2a$11$R2CufcoHWuidNl3Rtapp6OBFpTuugZNk/NG82.dYNj8USv99s.4YC", null, "Admin", "Premium" });

            migrationBuilder.CreateIndex(
                name: "IX_QuestionOptions_ProblemId",
                table: "QuestionOptions",
                column: "ProblemId");

            migrationBuilder.AddForeignKey(
                name: "FK_Problems_EducationalStages_StageId",
                table: "Problems",
                column: "StageId",
                principalTable: "EducationalStages",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
