namespace MathWorldAPI.Models;

public sealed class PlatformBrandSettings
{
    public int Id { get; set; } = 1;
    public int Revision { get; set; }
    public string SettingsJson { get; set; } = "{}";
}
