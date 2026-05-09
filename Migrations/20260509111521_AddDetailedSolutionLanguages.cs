using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MathWorldAPI.Migrations
{
    /// <inheritdoc />
    public partial class AddDetailedSolutionLanguages : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "DetailedSolution",
                table: "Problems",
                newName: "DetailedSolutionEn");

            migrationBuilder.AddColumn<string>(
                name: "DetailedSolutionAr",
                table: "Problems",
                type: "text",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DetailedSolutionAr",
                table: "Problems");

            migrationBuilder.RenameColumn(
                name: "DetailedSolutionEn",
                table: "Problems",
                newName: "DetailedSolution");
        }
    }
}
