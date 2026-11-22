using System.Globalization;
using System.IO.Compression;
using System.Text;
using System.Xml;
using MathWorldAPI.Controllers;

namespace MathWorldAPI.Services;

/// <summary>
/// Small, dependency-free OOXML spreadsheet generator. Strings are written as
/// inline strings (never formulas), preventing Excel formula injection from
/// stage/category names. All values come from the authorized server report.
/// </summary>
public static class PremiumAnalyticsXlsxExporter
{
    private const string Spreadsheet = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";
    private const string OfficeRelations = "http://schemas.openxmlformats.org/officeDocument/2006/relationships";
    private const string PackageRelations = "http://schemas.openxmlformats.org/package/2006/relationships";
    private const string ContentTypes = "http://schemas.openxmlformats.org/package/2006/content-types";
    private const string WorkbookMime = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml";
    private const string WorksheetMime = "application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml";

    private static readonly string[] Headers =
    [
        "Stage ID / رقم المرحلة", "Category ID / رقم الفئة",
        "Stage AR / المرحلة", "Stage EN",
        "Category AR / الفئة", "Category EN",
        "Attempted / جرى حلها", "Solved / المحلولة",
        "Notebook errors / دفتر الأخطاء", "Attempts / المحاولات",
        "Correct / الصحيحة", "Incorrect / الخاطئة",
        "First try correct / صحيح أول مرة", "Points / النقاط",
        "Time seconds / الوقت بالثواني"
    ];

    public static byte[] Create(
        StudentPremiumAnalyticsController.StudentAnalyticsReport report, bool rightToLeft)
    {
        ArgumentNullException.ThrowIfNull(report);
        using var memory = new MemoryStream();

        using (var archive = new ZipArchive(memory, ZipArchiveMode.Create, leaveOpen: true))
        {
            XmlPart(archive, "[Content_Types].xml", w =>
            {
                w.WriteStartElement("Types", ContentTypes);
                w.WriteStartElement("Default", ContentTypes);
                w.WriteAttributeString("Extension", "rels");
                w.WriteAttributeString("ContentType",
                    "application/vnd.openxmlformats-package.relationships+xml");
                w.WriteEndElement();
                w.WriteStartElement("Default", ContentTypes);
                w.WriteAttributeString("Extension", "xml");
                w.WriteAttributeString("ContentType", "application/xml");
                w.WriteEndElement();
                Override(w, "/xl/workbook.xml", WorkbookMime);
                Override(w, "/xl/worksheets/sheet1.xml", WorksheetMime);
                Override(w, "/xl/styles.xml", "application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml");
                w.WriteEndElement();
            });

            XmlPart(archive, "_rels/.rels", w =>
            {
                w.WriteStartElement("Relationships", PackageRelations);
                Relationship(w, "rId1", OfficeRelations + "/officeDocument", "xl/workbook.xml");
                w.WriteEndElement();
            });

            XmlPart(archive, "xl/workbook.xml", w =>
            {
                w.WriteStartElement("workbook", Spreadsheet);
                w.WriteAttributeString("xmlns", "r", null, OfficeRelations);
                w.WriteStartElement("sheets", Spreadsheet);
                w.WriteStartElement("sheet", Spreadsheet);
                w.WriteAttributeString("name", rightToLeft ? "MathWorld تقدمي" : "MathWorld Progress");
                w.WriteAttributeString("sheetId", "1");
                w.WriteAttributeString("r", "id", OfficeRelations, "rId1");
                w.WriteEndElement();
                w.WriteEndElement();
                w.WriteEndElement();
            });

            XmlPart(archive, "xl/_rels/workbook.xml.rels", w =>
            {
                w.WriteStartElement("Relationships", PackageRelations);
                Relationship(w, "rId1", OfficeRelations + "/worksheet",
                    "worksheets/sheet1.xml");
                Relationship(w, "rId2", OfficeRelations + "/styles", "styles.xml");
                w.WriteEndElement();
            });

            XmlPart(archive, "xl/styles.xml", w =>
            {
                w.WriteStartElement("styleSheet", Spreadsheet);
                w.WriteStartElement("fonts", Spreadsheet);
                w.WriteAttributeString("count", "3");
                for (var i = 0; i < 3; i++)
                {
                    w.WriteStartElement("font", Spreadsheet);
                    if (i > 0) { w.WriteStartElement("b", Spreadsheet); w.WriteEndElement(); }
                    w.WriteStartElement("sz", Spreadsheet);
                    w.WriteAttributeString("val", i == 1 ? "11" : "10");
                    w.WriteEndElement();
                    w.WriteStartElement("color", Spreadsheet);
                    w.WriteAttributeString("rgb", i == 1 ? "FFFFFFFF" :
                        i == 2 ? "FF6D28D9" : "FF1F2937");
                    w.WriteEndElement();
                    w.WriteStartElement("name", Spreadsheet);
                    w.WriteAttributeString("val", "Aptos");
                    w.WriteEndElement();
                    w.WriteEndElement();
                }
                w.WriteEndElement();
                w.WriteStartElement("fills", Spreadsheet);
                w.WriteAttributeString("count", "4");
                for (var index = 0; index < 4; index++)
                {
                    var pattern = index == 0 ? "none" : index == 1 ? "gray125" : "solid";
                    w.WriteStartElement("fill", Spreadsheet);
                    w.WriteStartElement("patternFill", Spreadsheet);
                    w.WriteAttributeString("patternType", pattern);
                    if (pattern == "solid")
                    {
                        w.WriteStartElement("fgColor", Spreadsheet);
                        w.WriteAttributeString("rgb", index == 2 ? "FF6D28D9" : "FFF8F3FF");
                        w.WriteEndElement();
                    }
                    w.WriteEndElement();
                    w.WriteEndElement();
                }
                w.WriteEndElement();
                w.WriteStartElement("borders", Spreadsheet);
                w.WriteAttributeString("count", "1");
                w.WriteStartElement("border", Spreadsheet);
                foreach (var side in new[] { "left", "right", "top", "bottom", "diagonal" })
                { w.WriteStartElement(side, Spreadsheet); w.WriteEndElement(); }
                w.WriteEndElement();
                w.WriteEndElement();

                w.WriteStartElement("cellStyleXfs", Spreadsheet);
                w.WriteAttributeString("count", "1");
                WriteStyleXf(w, 0, 0);
                w.WriteEndElement();
                w.WriteStartElement("cellXfs", Spreadsheet);
                w.WriteAttributeString("count", "4");
                WriteStyleXf(w, 0, 0);
                WriteStyleXf(w, 1, 2); // brand purple heading
                WriteStyleXf(w, 0, 3); // alternating lavender rows
                WriteStyleXf(w, 2, 3); // totals highlighted
                w.WriteEndElement();
                w.WriteStartElement("cellStyles", Spreadsheet);
                w.WriteAttributeString("count", "1");
                w.WriteStartElement("cellStyle", Spreadsheet);
                w.WriteAttributeString("name", "Normal");
                w.WriteAttributeString("xfId", "0");
                w.WriteAttributeString("builtinId", "0");
                w.WriteEndElement();
                w.WriteEndElement();
                w.WriteEndElement();
            });

            XmlPart(archive, "xl/worksheets/sheet1.xml", w =>
            {
                w.WriteStartElement("worksheet", Spreadsheet);
                w.WriteStartElement("sheetViews", Spreadsheet);
                w.WriteStartElement("sheetView", Spreadsheet);
                w.WriteAttributeString("workbookViewId", "0");
                if (rightToLeft) w.WriteAttributeString("rightToLeft", "1");
                w.WriteStartElement("pane", Spreadsheet);
                w.WriteAttributeString("ySplit", "1");
                w.WriteAttributeString("topLeftCell", "A2");
                w.WriteAttributeString("state", "frozen");
                w.WriteEndElement();
                w.WriteEndElement();
                w.WriteEndElement();

                w.WriteStartElement("cols", Spreadsheet);
                for (var i = 1; i <= Headers.Length; i++)
                {
                    w.WriteStartElement("col", Spreadsheet);
                    w.WriteAttributeString("min", i.ToString(CultureInfo.InvariantCulture));
                    w.WriteAttributeString("max", i.ToString(CultureInfo.InvariantCulture));
                    w.WriteAttributeString("width", i is 3 or 4 or 5 or 6 ? "31" : "23");
                    w.WriteAttributeString("customWidth", "1");
                    w.WriteEndElement();
                }
                w.WriteEndElement();

                w.WriteStartElement("sheetData", Spreadsheet);
                WriteRow(w, 1, Headers.Cast<object>().ToArray(), style: 1);
                var rowNumber = 2;
                foreach (var category in report.Categories)
                {
                    WriteRow(w, rowNumber++,
                    [
                        category.StageId, category.CategoryId,
                        category.StageNameAr, category.StageNameEn,
                        category.CategoryNameAr, category.CategoryNameEn,
                        category.AttemptedProblems, category.SolvedProblems,
                        category.ErrorNotebookProblems, category.Attempts,
                        category.CorrectAttempts, category.IncorrectAttempts,
                        category.FirstTryCorrect, category.AwardedPoints,
                        category.TimeSpentSeconds
                    ], style: rowNumber % 2 == 0 ? 2 : 0);
                }
                WriteRow(w, rowNumber,
                [
                    rightToLeft ? "الإجمالي / TOTAL" : "TOTAL / الإجمالي",
                    "", "", "", "", "",
                    report.AttemptedProblems, report.SolvedProblems,
                    report.Categories.Sum(x => x.ErrorNotebookProblems),
                    report.Attempts, report.CorrectAttempts,
                    report.IncorrectAttempts, report.FirstTryCorrect,
                    report.AwardedPoints, report.TimeSpentSeconds
                ], style: 3);
                w.WriteEndElement();

                w.WriteStartElement("autoFilter", Spreadsheet);
                w.WriteAttributeString("ref", "A1:O" + (rowNumber - 1).ToString(CultureInfo.InvariantCulture));
                w.WriteEndElement();
                if (report.Categories.Count > 0)
                {
                    // Genuine Excel in-cell bar charts: solved by category,
                    // and correct answers by category. Native formatting,
                    // not hard-coded screenshots or browser-only decoration.
                    WriteDataBar(w, "H2:H" + (rowNumber - 1), 1, "FF7C3AED");
                    WriteDataBar(w, "K2:K" + (rowNumber - 1), 2, "FFEC4899");
                }
                w.WriteEndElement();
            });
        }

        return memory.ToArray();
    }

    private static void XmlPart(ZipArchive archive, string name, Action<XmlWriter> write)
    {
        var entry = archive.CreateEntry(name, CompressionLevel.Optimal);
        using var stream = entry.Open();
        using var writer = XmlWriter.Create(stream, new XmlWriterSettings
        {
            Encoding = new UTF8Encoding(false), CloseOutput = false,
            ConformanceLevel = ConformanceLevel.Document
        });
        writer.WriteStartDocument();
        write(writer);
        writer.WriteEndDocument();
    }

    private static void Override(XmlWriter writer, string name, string contentType)
    {
        writer.WriteStartElement("Override", ContentTypes);
        writer.WriteAttributeString("PartName", name);
        writer.WriteAttributeString("ContentType", contentType);
        writer.WriteEndElement();
    }

    private static void Relationship(XmlWriter writer, string id, string type, string target)
    {
        writer.WriteStartElement("Relationship", PackageRelations);
        writer.WriteAttributeString("Id", id);
        writer.WriteAttributeString("Type", type);
        writer.WriteAttributeString("Target", target);
        writer.WriteEndElement();
    }

    private static void WriteRow(XmlWriter writer, int number, IReadOnlyList<object> values,
        int style = 0)
    {
        writer.WriteStartElement("row", Spreadsheet);
        writer.WriteAttributeString("r", number.ToString(CultureInfo.InvariantCulture));
        if (style == 1 || style == 3)
        {
            writer.WriteAttributeString("ht", style == 1 ? "32" : "28");
            writer.WriteAttributeString("customHeight", "1");
        }
        for (var index = 0; index < values.Count; index++)
        {
            var value = values[index];
            writer.WriteStartElement("c", Spreadsheet);
            writer.WriteAttributeString("r", Column(index) + number.ToString(CultureInfo.InvariantCulture));
            if (style != 0) writer.WriteAttributeString("s", style.ToString(CultureInfo.InvariantCulture));
            if (value is string text)
            {
                writer.WriteAttributeString("t", "inlineStr");
                writer.WriteStartElement("is", Spreadsheet);
                writer.WriteStartElement("t", Spreadsheet);
                writer.WriteAttributeString("xml", "space",
                    "http://www.w3.org/XML/1998/namespace", "preserve");
                // Excel cannot represent XML 1.0 control characters in cells.
                writer.WriteString(new string(text.Where(XmlConvert.IsXmlChar).ToArray()));
                writer.WriteEndElement();
                writer.WriteEndElement();
            }
            else if (value is IFormattable numeric)
            {
                writer.WriteStartElement("v", Spreadsheet);
                writer.WriteString(numeric.ToString(null, CultureInfo.InvariantCulture));
                writer.WriteEndElement();
            }
            writer.WriteEndElement();
        }
        writer.WriteEndElement();
    }

    private static void WriteStyleXf(XmlWriter writer, int fontId, int fillId)
    {
        writer.WriteStartElement("xf", Spreadsheet);
        writer.WriteAttributeString("numFmtId", "0");
        writer.WriteAttributeString("fontId", fontId.ToString(CultureInfo.InvariantCulture));
        writer.WriteAttributeString("fillId", fillId.ToString(CultureInfo.InvariantCulture));
        writer.WriteAttributeString("borderId", "0");
        writer.WriteAttributeString("xfId", "0");
        if (fillId != 0) writer.WriteAttributeString("applyFill", "1");
        if (fontId != 0) writer.WriteAttributeString("applyFont", "1");
        writer.WriteEndElement();
    }

    private static void WriteDataBar(XmlWriter writer, string range, int priority, string color)
    {
        writer.WriteStartElement("conditionalFormatting", Spreadsheet);
        writer.WriteAttributeString("sqref", range);
        writer.WriteStartElement("cfRule", Spreadsheet);
        writer.WriteAttributeString("type", "dataBar");
        writer.WriteAttributeString("priority", priority.ToString(CultureInfo.InvariantCulture));
        writer.WriteStartElement("dataBar", Spreadsheet);
        writer.WriteAttributeString("minLength", "8");
        writer.WriteAttributeString("maxLength", "90");
        foreach (var type in new[] { "min", "max" })
        {
            writer.WriteStartElement("cfvo", Spreadsheet);
            writer.WriteAttributeString("type", type);
            writer.WriteEndElement();
        }
        writer.WriteStartElement("color", Spreadsheet);
        writer.WriteAttributeString("rgb", color);
        writer.WriteEndElement();
        writer.WriteEndElement();
        writer.WriteEndElement();
        writer.WriteEndElement();
    }

    private static string Column(int index)
    {
        var name = "";
        for (var value = index + 1; value > 0; value = (value - 1) / 26)
            name = (char)('A' + (value - 1) % 26) + name;
        return name;
    }
}
