using System.Globalization;

namespace MathWorldAPI.Services;

/// <summary>Versioned JWT contract. A missing legacy claim represents version zero.</summary>
public static class SessionVersionPolicy
{
    public const string ClaimName = "mw_token_version";

    public static string FormatVersion(int version)
    {
        ArgumentOutOfRangeException.ThrowIfNegative(version);
        return version.ToString(CultureInfo.InvariantCulture);
    }

    public static bool TryReadVersion(IEnumerable<string> claims, out int version)
    {
        version = 0;
        using var enumerator = claims.GetEnumerator();
        if (!enumerator.MoveNext())
            return true;
        var raw = enumerator.Current;
        if (enumerator.MoveNext() ||
            !int.TryParse(raw, NumberStyles.None, CultureInfo.InvariantCulture, out var parsed) ||
            parsed < 0 || !string.Equals(raw, FormatVersion(parsed), StringComparison.Ordinal))
            return false;
        version = parsed;
        return true;
    }
}
