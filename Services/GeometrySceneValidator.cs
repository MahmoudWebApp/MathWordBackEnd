using System.Text.Json;

namespace MathWorldAPI.Services
{
    /// <summary>Validates a strictly bounded, declarative geometry scene; never accepts SVG markup.</summary>
    public static class GeometrySceneValidator
    {
        private static bool Finite(JsonElement element, string name, bool positive = false)
        {
            if (!element.TryGetProperty(name, out var value) ||
                value.ValueKind != JsonValueKind.Number ||
                !value.TryGetDouble(out var number) ||
                !double.IsFinite(number) || Math.Abs(number) > 10000)
                return false;
            return !positive || number > 0;
        }

        private static bool Label(JsonElement obj)
        {
            return !obj.TryGetProperty("label", out var label) ||
                (label.ValueKind == JsonValueKind.String &&
                 label.GetString()!.Length <= 80);
        }

        private static bool Coordinates(JsonElement obj, params string[] names) =>
            names.All(name => Finite(obj, name));

        public static bool TryParse(string json, out JsonElement scene)
        {
            scene = default;
            if (string.IsNullOrWhiteSpace(json) || json.Length > 30000) return false;
            try
            {
                using var doc = JsonDocument.Parse(json, new JsonDocumentOptions
                {
                    MaxDepth = 12,
                    AllowTrailingCommas = false,
                    CommentHandling = JsonCommentHandling.Disallow
                });
                var root = doc.RootElement;
                if (root.ValueKind != JsonValueKind.Object ||
                    !root.TryGetProperty("schemaVersion", out var version) ||
                    version.ValueKind != JsonValueKind.Number ||
                    !version.TryGetInt32(out var v) || v != 1 ||
                    !root.TryGetProperty("viewport", out var viewport) ||
                    viewport.ValueKind != JsonValueKind.Object ||
                    !Finite(viewport, "width", true) ||
                    !Finite(viewport, "height", true) ||
                    !root.TryGetProperty("objects", out var objects) ||
                    objects.ValueKind != JsonValueKind.Array ||
                    objects.GetArrayLength() > 100) return false;

                var ids = new HashSet<string>(StringComparer.Ordinal);
                foreach (var obj in objects.EnumerateArray())
                {
                    if (obj.ValueKind != JsonValueKind.Object ||
                        !obj.TryGetProperty("id", out var idValue) ||
                        idValue.ValueKind != JsonValueKind.String ||
                        !ValidId(idValue.GetString()!) ||
                        !ids.Add(idValue.GetString()!) ||
                        !Label(obj) ||
                        !obj.TryGetProperty("type", out var typeValue) ||
                        typeValue.ValueKind != JsonValueKind.String) return false;

                    var type = typeValue.GetString();
                    switch (type)
                    {
                        case "point":
                            if (!Coordinates(obj, "x", "y")) return false;
                            break;
                        case "segment":
                        case "ray":
                        case "vector":
                        case "line":
                            if (!Coordinates(obj, "x1", "y1", "x2", "y2")) return false;
                            if (obj.GetProperty("x1").GetDouble() == obj.GetProperty("x2").GetDouble() &&
                                obj.GetProperty("y1").GetDouble() == obj.GetProperty("y2").GetDouble()) return false;
                            break;
                        case "circle":
                            if (!Coordinates(obj, "cx", "cy") || !Finite(obj, "r", true)) return false;
                            break;
                        case "polygon":
                            if (!obj.TryGetProperty("points", out var points) ||
                                points.ValueKind != JsonValueKind.Array ||
                                points.GetArrayLength() < 3 || points.GetArrayLength() > 30 ||
                                points.EnumerateArray().Any(point =>
                                    point.ValueKind != JsonValueKind.Object ||
                                    !Coordinates(point, "x", "y"))) return false;
                            break;
                        case "angle":
                            if (!Coordinates(obj, "cx", "cy", "startDegrees", "endDegrees") ||
                                !Finite(obj, "radius", true)) return false;
                            break;
                        case "axes":
                            if (!Coordinates(obj, "originX", "originY") ||
                                !Finite(obj, "xLength", true) ||
                                !Finite(obj, "yLength", true)) return false;
                            break;
                        default:
                            return false;
                    }
                }

                scene = root.Clone();
                return true;
            }
            catch (JsonException) { return false; }
            catch (InvalidOperationException) { return false; }
        }

        private static bool ValidId(string id) =>
            id.Length is >= 1 and <= 40 &&
            id.All(c => char.IsAsciiLetterOrDigit(c) || c == '-' || c == '_');
    }
}
