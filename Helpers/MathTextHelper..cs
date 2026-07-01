using System.Text.RegularExpressions;

namespace MathWorldAPI.Helpers
{
    public static class MathTextHelper
    {
        /// <summary>
        /// Extracts a clean title from question text.
        /// Takes the first sentence or first 100 characters with LaTeX intact.
        /// </summary>
        public static string ExtractTitleFromQuestion(string? text)
        {
            if (string.IsNullOrWhiteSpace(text)) return string.Empty;

            // Try to get first sentence (up to . ! ؟ or newline)
            var firstSentenceMatch = Regex.Match(text, @"^[^\.!\?\n]+[\.!\?\n]?");
            string firstPart = firstSentenceMatch.Success
                ? firstSentenceMatch.Value.Trim()
                : text;

            // If still too long, truncate at 100 chars but keep LaTeX intact
            if (firstPart.Length > 100)
            {
                // Find last space before 100 chars
                int cutIndex = firstPart.LastIndexOf(' ', 100);
                if (cutIndex > 50)
                    firstPart = firstPart.Substring(0, cutIndex).Trim();
                else
                    firstPart = firstPart.Substring(0, 100).Trim();
            }

            return firstPart;
        }

        /// <summary>
        /// توحيد الرموز العربية للأرقام والرموز الرياضية.
        /// </summary>
        public static string StandardizeMathSymbols(string text)
        {
            if (string.IsNullOrWhiteSpace(text)) return text;

            text = text.Replace("٠", "0").Replace("١", "1").Replace("٢", "2")
                         .Replace("٣", "3").Replace("٤", "4").Replace("٥", "5")
                         .Replace("٦", "6").Replace("٧", "7").Replace("٨", "8")
                         .Replace("٩", "9");

            text = text.Replace("×", "x").Replace("÷", "/").Replace("−", "-").Replace("√", "sqrt");

            return text.Trim();
        }
    }
}