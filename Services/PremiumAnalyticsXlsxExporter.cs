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
    private const string StylesMime = "application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml";
    private const string ChartMime = "application/vnd.openxmlformats-officedocument.drawingml.chart+xml";
    private const string DrawingMime = "application/vnd.openxmlformats-officedocument.drawing+xml";
    private const string ChartNs = "http://schemas.openxmlformats.org/drawingml/2006/chart";
    private const string DrawingNs = "http://schemas.openxmlformats.org/drawingml/2006/main";
    private const string SpreadsheetDrawingNs = "http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing";

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
        // Show twelve real categories by practice volume. The complete data
        // remains on the first worksheet, without unverified chart numbers.
        var chartRows = report.Categories
            .OrderByDescending(x => x.AttemptedProblems)
            .ThenBy(x => x.StageId).ThenBy(x => x.CategoryId)
            .Take(12).ToArray();
        var showCharts = chartRows.Length > 0;
        var chartsSheetName = rightToLeft ? "مخططات التقدم" : "Progress charts";
        // The exact approved MathWorld mark is an embedded project resource,
        // not a third-party URL or a runtime network dependency.
        using var logoResource = typeof(PremiumAnalyticsXlsxExporter).Assembly
            .GetManifestResourceStream("MathWorld.Brand.Logo.png");
        if (logoResource is null)
            throw new InvalidOperationException("MathWorld report logo resource missing.");
        using var logoBuffer = new MemoryStream();
        logoResource.CopyTo(logoBuffer);
        var brandPng = logoBuffer.ToArray();
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
                w.WriteStartElement("Default", ContentTypes);
                w.WriteAttributeString("Extension", "png");
                w.WriteAttributeString("ContentType", "image/png");
                w.WriteEndElement();
                Override(w, "/xl/workbook.xml", WorkbookMime);
                Override(w, "/xl/worksheets/sheet1.xml", WorksheetMime);
                Override(w, "/xl/worksheets/sheet2.xml", WorksheetMime);
                Override(w, "/xl/styles.xml", StylesMime);
                Override(w, "/xl/drawings/drawing2.xml", DrawingMime);
                if (showCharts)
                {
                    Override(w, "/xl/drawings/drawing1.xml", DrawingMime);
                    Override(w, "/xl/charts/chart1.xml", ChartMime);
                    Override(w, "/xl/charts/chart2.xml", ChartMime);
                }
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
                w.WriteAttributeString("name", rightToLeft ? "تقدمي" : "My progress");
                w.WriteAttributeString("sheetId", "1");
                w.WriteAttributeString("r", "id", OfficeRelations, "rId1");
                w.WriteEndElement();
                w.WriteStartElement("sheet", Spreadsheet);
                w.WriteAttributeString("name", chartsSheetName);
                w.WriteAttributeString("sheetId", "2");
                w.WriteAttributeString("r", "id", OfficeRelations, "rId3");
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
                Relationship(w, "rId3", OfficeRelations + "/worksheet",
                    "worksheets/sheet2.xml");
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
                w.WriteAttributeString("ySplit", "6");
                w.WriteAttributeString("topLeftCell", "A7");
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
                WriteRow(w, 1, [ "", "", "MathWorld  ∑  |  Mathematics learning report" ], 1);
                WriteRow(w, 2, [ "", "", rightToLeft ? "تقرير التقدم الشخصي" : "Personal learning progress report" ], 4);
                WriteRow(w, 3, [ "", "", "Generated UTC: " + report.GeneratedAtUtc.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture) ], 0);
                WriteRow(w, 4, [
                    rightToLeft ? "محلولة" : "Solved", report.SolvedProblems,
                    rightToLeft ? "تمت تجربتها" : "Attempted", report.AttemptedProblems,
                    rightToLeft ? "تحتاج مراجعة" : "Needs review",
                    report.Categories.Sum(x => x.ErrorNotebookProblems),
                    rightToLeft ? "النقاط" : "Points", report.AwardedPoints
                ], 4);
                WriteRow(w, 5, [ "" ]);
                WriteRow(w, 6, Headers.Cast<object>().ToArray(), 2);
                var rowNumber = 7;
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
                    ], rowNumber % 2 == 0 ? 3 : 0);
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
                ], 4);
                w.WriteEndElement();

                // A branded heading without pretending the data rows are a chart.
                w.WriteStartElement("mergeCells", Spreadsheet);
                foreach (var span in new[] { "C1:O1", "C2:O2" })
                {
                    w.WriteStartElement("mergeCell", Spreadsheet);
                    w.WriteAttributeString("ref", span);
                    w.WriteEndElement();
                }
                w.WriteEndElement();

                w.WriteStartElement("autoFilter", Spreadsheet);
                w.WriteAttributeString("ref", "A6:O" + (rowNumber - 1).ToString(CultureInfo.InvariantCulture));
                w.WriteEndElement();

                // Excel-native visual bars keep the report filterable/editable
                // and directly reflect the solved and notebook counts.
                if (rowNumber > 7)
                {
                    DataBar(w, "H7:H" + (rowNumber - 1), "FF7C3AED", 1);
                    DataBar(w, "I7:I" + (rowNumber - 1), "FFE14EAC", 2);
                }
                w.WriteStartElement("drawing", Spreadsheet);
                w.WriteAttributeString("r", "id", OfficeRelations, "rId1");
                w.WriteEndElement();
                w.WriteEndElement();
            });

            // A separate, editable chart-data tab keeps the native Excel
            // chart objects away from the full-width report's filter table.
            XmlPart(archive, "xl/worksheets/sheet2.xml", w =>
            {
                w.WriteStartElement("worksheet", Spreadsheet);
                w.WriteAttributeString("xmlns", "r", null, OfficeRelations);
                w.WriteStartElement("sheetViews", Spreadsheet);
                w.WriteStartElement("sheetView", Spreadsheet);
                w.WriteAttributeString("workbookViewId", "0");
                if (rightToLeft) w.WriteAttributeString("rightToLeft", "1");
                w.WriteEndElement();
                w.WriteEndElement();
                w.WriteStartElement("cols", Spreadsheet);
                for (var i = 1; i <= 22; i++)
                {
                    w.WriteStartElement("col", Spreadsheet);
                    w.WriteAttributeString("min", i.ToString(CultureInfo.InvariantCulture));
                    w.WriteAttributeString("max", i.ToString(CultureInfo.InvariantCulture));
                    w.WriteAttributeString("width", i == 1 ? "38" : "16");
                    w.WriteAttributeString("customWidth", "1");
                    w.WriteEndElement();
                }
                w.WriteEndElement();
                w.WriteStartElement("sheetData", Spreadsheet);
                WriteRow(w, 1, [rightToLeft ? "MathWorld ∑ | مخططات التقدم"
                    : "MathWorld ∑ | Learning progress charts"], 1);
                WriteRow(w, 2, [rightToLeft ? "الفئات الاثنتا عشرة الأكثر تجربة، بيانات من حسابك الحقيقي"
                    : "Twelve most attempted categories, sourced from your account"], 4);
                WriteRow(w, 3, [""]);
                WriteRow(w, 4, [rightToLeft ? "الفئة" : "Category",
                    rightToLeft ? "محلولة" : "Solved",
                    rightToLeft ? "أخطاء للمراجعة" : "Notebook errors",
                    rightToLeft ? "محاولات صحيحة" : "Correct attempts",
                    rightToLeft ? "محاولات خاطئة" : "Incorrect attempts",
                    rightToLeft ? "تمت تجربتها" : "Attempted"], 2);
                var index = 5;
                foreach (var category in chartRows)
                {
                    WriteRow(w, index++, [
                        rightToLeft ? category.CategoryNameAr : category.CategoryNameEn,
                        category.SolvedProblems, category.ErrorNotebookProblems,
                        category.CorrectAttempts, category.IncorrectAttempts,
                        category.AttemptedProblems], index % 2 == 0 ? 3 : 0);
                }
                w.WriteEndElement();
                w.WriteStartElement("mergeCells", Spreadsheet);
                foreach (var range in new[] { "A1:F1", "A2:F2" })
                {
                    w.WriteStartElement("mergeCell", Spreadsheet);
                    w.WriteAttributeString("ref", range);
                    w.WriteEndElement();
                }
                w.WriteEndElement();
                if (showCharts)
                {
                    w.WriteStartElement("drawing", Spreadsheet);
                    w.WriteAttributeString("r", "id", OfficeRelations, "rId1");
                    w.WriteEndElement();
                }
                w.WriteEndElement();
            });
            if (showCharts)
            {
                XmlPart(archive, "xl/worksheets/_rels/sheet2.xml.rels", w =>
                {
                    w.WriteStartElement("Relationships", PackageRelations);
                    Relationship(w, "rId1", OfficeRelations + "/drawing",
                        "../drawings/drawing1.xml");
                    w.WriteEndElement();
                });
                XmlPart(archive, "xl/drawings/drawing1.xml", w =>
                {
                    w.WriteStartElement("xdr", "wsDr", SpreadsheetDrawingNs);
                    WriteChartAnchor(w, 2, "Solved and review", 7, 3, 21, 23, "rId1");
                    WriteChartAnchor(w, 3, "Correct and incorrect", 7, 25, 21, 45, "rId2");
                    WriteBrandImageAnchor(w, 4, 17, 0, 21, 3, "rId3");
                    w.WriteEndElement();
                });
                XmlPart(archive, "xl/drawings/_rels/drawing1.xml.rels", w =>
                {
                    w.WriteStartElement("Relationships", PackageRelations);
                    Relationship(w, "rId1", OfficeRelations + "/chart", "../charts/chart1.xml");
                    Relationship(w, "rId2", OfficeRelations + "/chart", "../charts/chart2.xml");
                    Relationship(w, "rId3", OfficeRelations + "/image", "../media/image1.png");
                    w.WriteEndElement();
                });
                XmlPart(archive, "xl/charts/chart1.xml", w => WriteCategoryChart(w,
                    rightToLeft ? "المسائل المحلولة والأخطاء" : "Solved problems and review errors",
                    chartsSheetName, chartRows, rightToLeft,
                    rightToLeft ? "محلولة" : "Solved", "B",
                    rightToLeft ? "تحتاج مراجعة" : "Needs review", "C",
                    "7C3AED", "EC4899", 104486, 104487));
                XmlPart(archive, "xl/charts/chart2.xml", w => WriteCategoryChart(w,
                    rightToLeft ? "المحاولات الصحيحة والخاطئة" : "Correct and incorrect attempts",
                    chartsSheetName, chartRows, rightToLeft,
                    rightToLeft ? "صحيحة" : "Correct", "D",
                    rightToLeft ? "خاطئة" : "Incorrect", "E",
                    "0D9488", "E59A1A", 204486, 204487));
            }
            XmlPart(archive, "xl/worksheets/_rels/sheet1.xml.rels", w =>
            {
                w.WriteStartElement("Relationships", PackageRelations);
                Relationship(w, "rId1", OfficeRelations + "/drawing", "../drawings/drawing2.xml");
                w.WriteEndElement();
            });
            XmlPart(archive, "xl/drawings/drawing2.xml", w =>
            {
                w.WriteStartElement("xdr", "wsDr", SpreadsheetDrawingNs);
                WriteBrandImageAnchor(w, 2, 0, 0, 2, 3, "rId1");
                w.WriteEndElement();
            });
            XmlPart(archive, "xl/drawings/_rels/drawing2.xml.rels", w =>
            {
                w.WriteStartElement("Relationships", PackageRelations);
                Relationship(w, "rId1", OfficeRelations + "/image", "../media/image1.png");
                w.WriteEndElement();
            });
            var imageEntry = archive.CreateEntry("xl/media/image1.png", CompressionLevel.Optimal);
            using (var stream = imageEntry.Open())
                stream.Write(brandPng, 0, brandPng.Length);
            XmlPart(archive, "xl/styles.xml", w => WriteStyles(w));
        }

        return memory.ToArray();
    }

    private static void WriteBrandImageAnchor(XmlWriter w, int shapeId,
        int startCol, int startRow, int endCol, int endRow, string relationshipId)
    {
        w.WriteStartElement("xdr", "twoCellAnchor", SpreadsheetDrawingNs);
        foreach (var (element, col, row) in new[]
            { ("from", startCol, startRow), ("to", endCol, endRow) })
        {
            w.WriteStartElement("xdr", element, SpreadsheetDrawingNs);
            foreach (var (part, number) in new[]
                { ("col", col), ("colOff", 0), ("row", row), ("rowOff", 0) })
                w.WriteElementString("xdr", part, SpreadsheetDrawingNs,
                    number.ToString(CultureInfo.InvariantCulture));
            w.WriteEndElement();
        }
        w.WriteStartElement("xdr", "pic", SpreadsheetDrawingNs);
        w.WriteStartElement("xdr", "nvPicPr", SpreadsheetDrawingNs);
        w.WriteStartElement("xdr", "cNvPr", SpreadsheetDrawingNs);
        w.WriteAttributeString("id", shapeId.ToString(CultureInfo.InvariantCulture));
        w.WriteAttributeString("name", "MathWorld approved logo");
        w.WriteAttributeString("descr", "MathWorld original brand mark");
        w.WriteEndElement();
        w.WriteStartElement("xdr", "cNvPicPr", SpreadsheetDrawingNs);
        w.WriteStartElement("a", "picLocks", DrawingNs);
        w.WriteAttributeString("noChangeAspect", "1");
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteStartElement("xdr", "blipFill", SpreadsheetDrawingNs);
        w.WriteStartElement("a", "blip", DrawingNs);
        w.WriteAttributeString("r", "embed", OfficeRelations, relationshipId);
        w.WriteEndElement();
        w.WriteStartElement("a", "stretch", DrawingNs);
        w.WriteStartElement("a", "fillRect", DrawingNs);
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteStartElement("xdr", "spPr", SpreadsheetDrawingNs);
        w.WriteStartElement("a", "prstGeom", DrawingNs);
        w.WriteAttributeString("prst", "rect");
        w.WriteStartElement("a", "avLst", DrawingNs);
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteStartElement("xdr", "clientData", SpreadsheetDrawingNs);
        w.WriteEndElement();
        w.WriteEndElement();
    }

    private static void WriteChartAnchor(XmlWriter w, int shapeId, string shapeName,
        int startCol, int startRow, int endCol, int endRow, string relationshipId)
    {
        w.WriteStartElement("xdr", "twoCellAnchor", SpreadsheetDrawingNs);
        foreach (var (element, col, row) in new[]
            { ("from", startCol, startRow), ("to", endCol, endRow) })
        {
            w.WriteStartElement("xdr", element, SpreadsheetDrawingNs);
            foreach (var (part, number) in new[]
                { ("col", col), ("colOff", 0), ("row", row), ("rowOff", 0) })
            {
                w.WriteElementString("xdr", part, SpreadsheetDrawingNs,
                    number.ToString(CultureInfo.InvariantCulture));
            }
            w.WriteEndElement();
        }
        w.WriteStartElement("xdr", "graphicFrame", SpreadsheetDrawingNs);
        w.WriteAttributeString("macro", "");
        w.WriteStartElement("xdr", "nvGraphicFramePr", SpreadsheetDrawingNs);
        w.WriteStartElement("xdr", "cNvPr", SpreadsheetDrawingNs);
        w.WriteAttributeString("id", shapeId.ToString(CultureInfo.InvariantCulture));
        w.WriteAttributeString("name", shapeName);
        w.WriteEndElement();
        w.WriteStartElement("xdr", "cNvGraphicFramePr", SpreadsheetDrawingNs);
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteStartElement("xdr", "xfrm", SpreadsheetDrawingNs);
        w.WriteStartElement("a", "off", DrawingNs);
        w.WriteAttributeString("x", "0"); w.WriteAttributeString("y", "0");
        w.WriteEndElement();
        w.WriteStartElement("a", "ext", DrawingNs);
        w.WriteAttributeString("cx", "0"); w.WriteAttributeString("cy", "0");
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteStartElement("a", "graphic", DrawingNs);
        w.WriteStartElement("a", "graphicData", DrawingNs);
        w.WriteAttributeString("uri", ChartNs);
        w.WriteStartElement("c", "chart", ChartNs);
        w.WriteAttributeString("xmlns", "r", null, OfficeRelations);
        w.WriteAttributeString("r", "id", OfficeRelations, relationshipId);
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteStartElement("xdr", "clientData", SpreadsheetDrawingNs);
        w.WriteEndElement();
        w.WriteEndElement();
    }

    private static void ChartValue(XmlWriter w, string name, string value)
    {
        w.WriteStartElement("c", name, ChartNs);
        w.WriteAttributeString("val", value);
        w.WriteEndElement();
    }

    private static void ChartText(XmlWriter w, string text)
    {
        w.WriteStartElement("c", "title", ChartNs);
        w.WriteStartElement("c", "tx", ChartNs);
        w.WriteStartElement("c", "rich", ChartNs);
        w.WriteStartElement("a", "bodyPr", DrawingNs); w.WriteEndElement();
        w.WriteStartElement("a", "lstStyle", DrawingNs); w.WriteEndElement();
        w.WriteStartElement("a", "p", DrawingNs);
        w.WriteStartElement("a", "r", DrawingNs);
        w.WriteStartElement("a", "t", DrawingNs);
        w.WriteString(text);
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
    }

    private static void WriteSeries(XmlWriter w, int index, string label,
        string color, string sheet, IReadOnlyList<string> categories,
        IReadOnlyList<int> numbers, string valueCol)
    {
        w.WriteStartElement("c", "ser", ChartNs);
        ChartValue(w, "idx", index.ToString(CultureInfo.InvariantCulture));
        ChartValue(w, "order", index.ToString(CultureInfo.InvariantCulture));
        w.WriteStartElement("c", "tx", ChartNs);
        w.WriteElementString("c", "v", ChartNs, label);
        w.WriteEndElement();
        w.WriteStartElement("c", "spPr", ChartNs);
        w.WriteStartElement("a", "solidFill", DrawingNs);
        w.WriteStartElement("a", "srgbClr", DrawingNs);
        w.WriteAttributeString("val", color);
        w.WriteEndElement(); w.WriteEndElement(); w.WriteEndElement();
        w.WriteStartElement("c", "cat", ChartNs);
        w.WriteStartElement("c", "strRef", ChartNs);
        w.WriteElementString("c", "f", ChartNs,
            "'" + sheet.Replace("'", "''") + "'!$A$5:$A$" + (categories.Count + 4));
        w.WriteStartElement("c", "strCache", ChartNs);
        ChartValue(w, "ptCount", categories.Count.ToString(CultureInfo.InvariantCulture));
        for (var i = 0; i < categories.Count; i++)
        {
            w.WriteStartElement("c", "pt", ChartNs);
            w.WriteAttributeString("idx", i.ToString(CultureInfo.InvariantCulture));
            w.WriteElementString("c", "v", ChartNs, categories[i]);
            w.WriteEndElement();
        }
        w.WriteEndElement(); w.WriteEndElement(); w.WriteEndElement();
        w.WriteStartElement("c", "val", ChartNs);
        w.WriteStartElement("c", "numRef", ChartNs);
        w.WriteElementString("c", "f", ChartNs,
            "'" + sheet.Replace("'", "''") + "'!$" + valueCol +
            "$5:$" + valueCol + "$" + (numbers.Count + 4));
        w.WriteStartElement("c", "numCache", ChartNs);
        w.WriteElementString("c", "formatCode", ChartNs, "0");
        ChartValue(w, "ptCount", numbers.Count.ToString(CultureInfo.InvariantCulture));
        for (var i = 0; i < numbers.Count; i++)
        {
            w.WriteStartElement("c", "pt", ChartNs);
            w.WriteAttributeString("idx", i.ToString(CultureInfo.InvariantCulture));
            w.WriteElementString("c", "v", ChartNs,
                numbers[i].ToString(CultureInfo.InvariantCulture));
            w.WriteEndElement();
        }
        w.WriteEndElement(); w.WriteEndElement(); w.WriteEndElement();
        w.WriteEndElement();
    }

    private static void WriteCategoryChart(XmlWriter w, string title,
        string sheetName, IReadOnlyList<StudentPremiumAnalyticsController.CategoryStatistics> categories,
        bool rightToLeft, string label1, string col1,
        string label2, string col2, string color1, string color2,
        int categoryAxisId, int valueAxisId)
    {
        w.WriteStartElement("c", "chartSpace", ChartNs);
        w.WriteAttributeString("xmlns", "a", null, DrawingNs);
        w.WriteStartElement("c", "chart", ChartNs);
        ChartText(w, title);
        ChartValue(w, "autoTitleDeleted", "0");
        w.WriteStartElement("c", "plotArea", ChartNs);
        w.WriteStartElement("c", "layout", ChartNs); w.WriteEndElement();
        w.WriteStartElement("c", "barChart", ChartNs);
        ChartValue(w, "barDir", "bar");
        ChartValue(w, "grouping", "clustered");
        ChartValue(w, "varyColors", "0");
        var names = categories.Select(x => rightToLeft ? x.CategoryNameAr : x.CategoryNameEn).ToArray();
        WriteSeries(w, 0, label1, color1, sheetName, names,
            categories.Select(x => col1 == "B" ? x.SolvedProblems : x.CorrectAttempts).ToArray(),
            col1);
        WriteSeries(w, 1, label2, color2, sheetName, names,
            categories.Select(x => col2 == "C" ? x.ErrorNotebookProblems : x.IncorrectAttempts).ToArray(),
            col2);
        ChartValue(w, "gapWidth", "80");
        ChartValue(w, "axId", categoryAxisId.ToString(CultureInfo.InvariantCulture));
        ChartValue(w, "axId", valueAxisId.ToString(CultureInfo.InvariantCulture));
        w.WriteEndElement();
        w.WriteStartElement("c", "catAx", ChartNs);
        ChartValue(w, "axId", categoryAxisId.ToString(CultureInfo.InvariantCulture));
        w.WriteStartElement("c", "scaling", ChartNs);
        ChartValue(w, "orientation", "minMax");
        w.WriteEndElement();
        ChartValue(w, "axPos", "l");
        ChartValue(w, "tickLblPos", "nextTo");
        ChartValue(w, "crossAx", valueAxisId.ToString(CultureInfo.InvariantCulture));
        ChartValue(w, "crosses", "autoZero");
        w.WriteEndElement();
        w.WriteStartElement("c", "valAx", ChartNs);
        ChartValue(w, "axId", valueAxisId.ToString(CultureInfo.InvariantCulture));
        w.WriteStartElement("c", "scaling", ChartNs);
        ChartValue(w, "orientation", "minMax");
        w.WriteEndElement();
        ChartValue(w, "axPos", "b");
        w.WriteStartElement("c", "numFmt", ChartNs);
        w.WriteAttributeString("formatCode", "0");
        w.WriteAttributeString("sourceLinked", "0");
        w.WriteEndElement();
        ChartValue(w, "tickLblPos", "nextTo");
        ChartValue(w, "crossAx", categoryAxisId.ToString(CultureInfo.InvariantCulture));
        ChartValue(w, "crosses", "autoZero");
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteStartElement("c", "legend", ChartNs);
        ChartValue(w, "legendPos", "b");
        w.WriteStartElement("c", "layout", ChartNs); w.WriteEndElement();
        w.WriteEndElement();
        ChartValue(w, "plotVisOnly", "1");
        w.WriteEndElement();
        w.WriteEndElement();
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

    private static void DataBar(XmlWriter w, string address, string color, int priority)
    {
        w.WriteStartElement("conditionalFormatting", Spreadsheet);
        w.WriteAttributeString("sqref", address);
        w.WriteStartElement("cfRule", Spreadsheet);
        w.WriteAttributeString("type", "dataBar");
        w.WriteAttributeString("priority", priority.ToString(CultureInfo.InvariantCulture));
        w.WriteStartElement("dataBar", Spreadsheet);
        foreach (var type in new[] { "min", "max" })
        {
            w.WriteStartElement("cfvo", Spreadsheet);
            w.WriteAttributeString("type", type);
            w.WriteEndElement();
        }
        w.WriteStartElement("color", Spreadsheet);
        w.WriteAttributeString("rgb", color);
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
        w.WriteEndElement();
    }

    private static void WriteStyles(XmlWriter w)
    {
        w.WriteStartElement("styleSheet", Spreadsheet);
        w.WriteStartElement("fonts", Spreadsheet);
        w.WriteAttributeString("count", "4");
        foreach (var (bold, size, color) in new[] {
            (false, "11", "FF332745"),
            (true, "18", "FFFFFFFF"),
            (true, "11", "FFFFFFFF"),
            (true, "11", "FF6321BD") })
        {
            w.WriteStartElement("font", Spreadsheet);
            if (bold) { w.WriteStartElement("b", Spreadsheet); w.WriteEndElement(); }
            w.WriteStartElement("sz", Spreadsheet); w.WriteAttributeString("val", size); w.WriteEndElement();
            w.WriteStartElement("color", Spreadsheet); w.WriteAttributeString("rgb", color); w.WriteEndElement();
            w.WriteEndElement();
        }
        w.WriteEndElement();

        w.WriteStartElement("fills", Spreadsheet);
        w.WriteAttributeString("count", "4");
        foreach (var (pattern, color) in new[] {
            ("none", ""), ("gray125", ""), ("solid", "FF6D28D9"),
            ("solid", "FFF2EAFC") })
        {
            w.WriteStartElement("fill", Spreadsheet);
            w.WriteStartElement("patternFill", Spreadsheet);
            w.WriteAttributeString("patternType", pattern);
            if (color.Length > 0)
            {
                w.WriteStartElement("fgColor", Spreadsheet); w.WriteAttributeString("rgb", color); w.WriteEndElement();
                w.WriteStartElement("bgColor", Spreadsheet); w.WriteAttributeString("indexed", "64"); w.WriteEndElement();
            }
            w.WriteEndElement();
            w.WriteEndElement();
        }
        w.WriteEndElement();
        w.WriteStartElement("borders", Spreadsheet);
        w.WriteAttributeString("count", "1");
        w.WriteStartElement("border", Spreadsheet); w.WriteEndElement();
        w.WriteEndElement();
        w.WriteStartElement("cellStyleXfs", Spreadsheet);
        w.WriteAttributeString("count", "1");
        w.WriteStartElement("xf", Spreadsheet); w.WriteAttributeString("numFmtId", "0");
        w.WriteAttributeString("fontId", "0"); w.WriteAttributeString("fillId", "0");
        w.WriteAttributeString("borderId", "0"); w.WriteEndElement();
        w.WriteEndElement();
        w.WriteStartElement("cellXfs", Spreadsheet); w.WriteAttributeString("count", "5");
        foreach (var (font, fill) in new[] {
            ("0", "0"), ("1", "2"), ("2", "2"), ("0", "3"), ("3", "3") })
        {
            w.WriteStartElement("xf", Spreadsheet);
            w.WriteAttributeString("numFmtId", "0");
            w.WriteAttributeString("fontId", font); w.WriteAttributeString("fillId", fill);
            w.WriteAttributeString("borderId", "0");
            w.WriteAttributeString("xfId", "0");
            w.WriteAttributeString("applyFont", "1"); w.WriteAttributeString("applyFill", "1");
            w.WriteEndElement();
        }
        w.WriteEndElement();
        w.WriteEndElement();
    }

    private static string Column(int index)
    {
        var name = "";
        for (var value = index + 1; value > 0; value = (value - 1) / 26)
            name = (char)('A' + (value - 1) % 26) + name;
        return name;
    }
}
