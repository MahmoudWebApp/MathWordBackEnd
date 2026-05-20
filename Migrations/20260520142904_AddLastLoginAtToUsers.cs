using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations
{
    /// <inheritdoc />
    public partial class AddLastLoginAtToUsers : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "LastLoginAt",
                table: "Users",
                type: "timestamp with time zone",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ProfilePicture",
                table: "Users",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "AccessToken",
                table: "SocialLogins",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "LastLoginAt",
                table: "SocialLogins",
                type: "timestamp with time zone",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ProfilePicture",
                table: "SocialLogins",
                type: "text",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LastLoginAt",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "ProfilePicture",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "AccessToken",
                table: "SocialLogins");

            migrationBuilder.DropColumn(
                name: "LastLoginAt",
                table: "SocialLogins");

            migrationBuilder.DropColumn(
                name: "ProfilePicture",
                table: "SocialLogins");
        }
    }
}
