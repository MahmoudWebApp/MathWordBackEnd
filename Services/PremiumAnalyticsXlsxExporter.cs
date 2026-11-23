using System.Globalization;
using ClosedXML.Excel;
using ClosedXML.Excel.Drawings;
using MathWorldAPI.Controllers;

namespace MathWorldAPI.Services;

/// <summary>
/// A single, styled, WPS/Excel-compatible XLSX report. Uses ClosedXML instead
/// of hand-written OOXML drawing/chart parts. Chart-like data bars live inside
/// cells and cannot accidentally obscure worksheets in WPS Office.
/// </summary>
public static class PremiumAnalyticsXlsxExporter
{
    // Calm, conventional reporting colors: green = success, red = errors,
    // amber = points/caution. Logo remains the exact official MathWorld mark.
    private static readonly XLColor Navy = XLColor.FromHtml("#223047");
    private static readonly XLColor Green = XLColor.FromHtml("#15803D");
    private static readonly XLColor Red = XLColor.FromHtml("#B91C1C");
    private static readonly XLColor Amber = XLColor.FromHtml("#A16207");
    private static readonly XLColor Teal = XLColor.FromHtml("#0F766E");
    private static readonly XLColor Blue = XLColor.FromHtml("#1D4ED8");
    private static readonly XLColor Ink = XLColor.FromHtml("#273345");
    private static readonly XLColor SlateTint = XLColor.FromHtml("#EAF1F6");
    private static readonly XLColor GreenTint = XLColor.FromHtml("#E5F5E9");
    private static readonly XLColor RedTint = XLColor.FromHtml("#FCE8E8");
    private static readonly XLColor AmberTint = XLColor.FromHtml("#FFF2D6");
    private static readonly XLColor Light = XLColor.FromHtml("#F8FAFC");
    private static readonly XLColor Border = XLColor.FromHtml("#DDE5EE");

    private static string[] Headers(bool ar) => ar
        ? ["المرحلة", "الفئة", "المسائل المجربة", "المسائل المحلولة",
           "دفتر الأخطاء", "عدد المحاولات", "الإجابات الصحيحة",
           "الإجابات الخاطئة", "صحيحة من أول مرة", "النقاط", "الوقت بالثواني"]
        : ["Stage", "Category", "Attempted problems", "Solved problems",
           "Review errors", "Attempts", "Correct answers", "Incorrect answers",
           "First-try correct", "Points", "Time (seconds)"];

    public static byte[] Create(
        StudentPremiumAnalyticsController.StudentAnalyticsReport report, bool ar)
    {
        ArgumentNullException.ThrowIfNull(report);

        using var logoResource = typeof(PremiumAnalyticsXlsxExporter).Assembly
            .GetManifestResourceStream("MathWorld.Brand.Logo.png")
            ?? throw new InvalidOperationException("Approved MathWorld report mark is missing.");
        using var logoMemory = new MemoryStream();
        logoResource.CopyTo(logoMemory);
        var logoBytes = logoMemory.ToArray();

        using var workbook = new XLWorkbook();
        workbook.Properties.Title = ar ? "MathWorld | تقرير تقدمي" : "MathWorld | My progress";
        workbook.Properties.Subject = ar ? "تقرير إحصائيات الطالب" : "Student progress statistics";
        workbook.Properties.Author = "MathWorld";
        var summary = workbook.Worksheets.Add(ar ? "تقدمي" : "My progress");
        var charts = workbook.Worksheets.Add(ar ? "إحصائياتي" : "Statistics");

        Setup(summary, ar);
        Setup(charts, ar);
        BuildSummary(summary, report, ar, logoBytes);
        BuildCharts(charts, report, ar, logoBytes);

        using var buffer = new MemoryStream();
        workbook.SaveAs(buffer);
        return buffer.ToArray();
    }

    private static void Setup(IXLWorksheet sheet, bool ar)
    {
        sheet.RightToLeft = ar;
        sheet.Style.Font.FontName = "Arial";
        sheet.Style.Font.FontSize = 11;
        sheet.Style.Font.FontColor = Ink;
        sheet.Style.Alignment.Vertical = XLAlignmentVerticalValues.Center;
        sheet.Style.Fill.BackgroundColor = XLColor.White;
        sheet.ShowGridLines = false;
    }

    private static void Header(
        IXLWorksheet sheet, string title, string subtitle, byte[] logo, bool ar)
    {
        // The official logo stays within the colored banner in RTL/LTR.
        sheet.Range("A1:K2").Style.Fill.BackgroundColor = Navy;
        // Keep the original purple mark legible against a light icon tile.
        // The rest of the report header stays a professional navy.
        sheet.Range("A1:A2").Style.Fill.BackgroundColor = Light;
        sheet.Range("B1:K2").Merge();
        var titleRange = sheet.Range("B1:K2");
        titleRange.Value = title;
        titleRange.Style.Fill.BackgroundColor = Navy;
        titleRange.Style.Font.Bold = true;
        titleRange.Style.Font.FontSize = 19;
        titleRange.Style.Font.FontColor = XLColor.White;
        titleRange.Style.Alignment.Vertical = XLAlignmentVerticalValues.Center;
        titleRange.Style.Alignment.Horizontal = ar
            ? XLAlignmentHorizontalValues.Right : XLAlignmentHorizontalValues.Left;
        titleRange.Style.Alignment.Indent = 1;

        sheet.Range("A3:K3").Style.Fill.BackgroundColor = SlateTint;
        sheet.Range("B3:K3").Merge();
        var subtitleRange = sheet.Range("B3:K3");
        subtitleRange.Value = subtitle;
        subtitleRange.Style.Fill.BackgroundColor = SlateTint;
        subtitleRange.Style.Font.FontColor = Navy;
        subtitleRange.Style.Font.Bold = true;
        subtitleRange.Style.Font.FontSize = 10;
        subtitleRange.Style.Alignment.Indent = 1;
        subtitleRange.Style.Alignment.Horizontal = ar
            ? XLAlignmentHorizontalValues.Right : XLAlignmentHorizontalValues.Left;
        sheet.Row(4).Height = 7;
        sheet.Range("A4:K4").Style.Fill.BackgroundColor = Teal;
        sheet.Row(1).Height = 34;
        sheet.Row(2).Height = 32;
        sheet.Row(3).Height = 27;

        // A small square icon, never a floating chart/drawing over report cells.
        using var stream = new MemoryStream(logo);
        sheet.AddPicture(stream, XLPictureFormat.Png, "MathWorld")
            .MoveTo(sheet.Cell("A1"))
            .WithSize(62, 62);
        sheet.Column(11).Width = 19;
    }

    private static void Metric(IXLWorksheet sheet, int row, int col,
        string name, long value, XLColor accent, XLColor tint)
    {
        var label = sheet.Range(row, col, row, col + 1).Merge();
        label.Value = name;
        label.Style.Fill.BackgroundColor = tint;
        label.Style.Font.FontColor = accent;
        label.Style.Font.Bold = true;
        label.Style.Font.FontSize = 9;
        label.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;

        var number = sheet.Range(row + 1, col, row + 1, col + 1).Merge();
        number.FirstCell().Value = value;
        number.Style.Fill.BackgroundColor = tint;
        number.Style.Font.FontColor = accent;
        number.Style.Font.Bold = true;
        number.Style.Font.FontSize = 17;
        number.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
        number.Style.Border.BottomBorder = XLBorderStyleValues.Thin;
        number.Style.Border.BottomBorderColor = Border;
    }

    private static void BuildSummary(IXLWorksheet sheet,
        StudentPremiumAnalyticsController.StudentAnalyticsReport report,
        bool ar, byte[] logo)
    {
        sheet.Column(1).Width = 29;
        sheet.Column(2).Width = 37;
        for (var i = 3; i <= 10; i++) sheet.Column(i).Width = 19;

        Header(sheet, ar ? "MathWorld  |  تقرير التقدم في الرياضيات"
            : "MathWorld  |  Mathematics progress report",
            (ar ? "إحصائيات حقيقية  •  " : "Your real learning statistics  •  ") +
                report.GeneratedAtUtc.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture),
            logo, ar);

        var review = report.Categories.Sum(x => x.ErrorNotebookProblems);
        var accuracy = report.Attempts == 0 ? 0 :
            (int)Math.Round(report.CorrectAttempts * 100.0 / report.Attempts);
        var labels = ar
            ? new[] { "المحلولة", "المحاولات", "الصحيحة", "النقاط", "دفتر الأخطاء",
                      "المجربة", "الخاطئة", "صحيحة أول مرة", "الوقت (ثانية)", "الدقة %" }
            : new[] { "Solved", "Attempts", "Correct", "Points", "Review errors",
                      "Attempted", "Incorrect", "First-try correct", "Time (seconds)", "Accuracy %" };
        var values = new[]
        {
            report.SolvedProblems, report.Attempts, report.CorrectAttempts,
            report.AwardedPoints, review, report.AttemptedProblems,
            report.IncorrectAttempts, report.FirstTryCorrect,
            report.TimeSpentSeconds, accuracy
        };
        // Green is used only for solved/correct; red for mistakes;
        // amber for points. Neutral metrics stay slate.
        var accents = new[] { Green, Blue, Green, Amber, Red,
                              Blue, Red, Teal, Blue, Teal };
        var tints = new[] { GreenTint, SlateTint, GreenTint, AmberTint, RedTint,
                           SlateTint, RedTint, GreenTint, SlateTint, GreenTint };
        for (var i = 0; i < 10; i++)
            Metric(sheet, i < 5 ? 5 : 8, 1 + (i % 5) * 2,
                labels[i], values[i], accents[i], tints[i]);
        foreach (var r in new[] { 5, 8 }) sheet.Row(r).Height = 26;
        foreach (var r in new[] { 6, 9 }) sheet.Row(r).Height = 39;
        sheet.Row(11).Height = 17;

        var headers = Headers(ar);
        for (var i = 0; i < headers.Length; i++)
            sheet.Cell(12, i + 1).Value = headers[i];
        var heading = sheet.Range(12, 1, 12, 11);
        heading.Style.Fill.BackgroundColor = Navy;
        heading.Style.Font.FontColor = XLColor.White;
        heading.Style.Font.Bold = true;
        heading.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
        heading.Style.Alignment.WrapText = true;
        sheet.Row(12).Height = 48;
        sheet.Range("A12:B12").Style.Alignment.Horizontal = ar
            ? XLAlignmentHorizontalValues.Right : XLAlignmentHorizontalValues.Left;

        var row = 13;
        foreach (var category in report.Categories)
        {
            // ClosedXML serializes strings as literal values, never Excel formulas.
            sheet.Cell(row, 1).Value = ar ? category.StageNameAr : category.StageNameEn;
            sheet.Cell(row, 2).Value = ar ? category.CategoryNameAr : category.CategoryNameEn;
            sheet.Cell(row, 3).Value = category.AttemptedProblems;
            sheet.Cell(row, 4).Value = category.SolvedProblems;
            sheet.Cell(row, 5).Value = category.ErrorNotebookProblems;
            sheet.Cell(row, 6).Value = category.Attempts;
            sheet.Cell(row, 7).Value = category.CorrectAttempts;
            sheet.Cell(row, 8).Value = category.IncorrectAttempts;
            sheet.Cell(row, 9).Value = category.FirstTryCorrect;
            sheet.Cell(row, 10).Value = category.AwardedPoints;
            sheet.Cell(row, 11).Value = category.TimeSpentSeconds;
            FormatBodyRow(sheet, row, row % 2 == 1 ? Light : XLColor.White);
            sheet.Cell(row, 4).Style.Font.FontColor = Green;
            sheet.Cell(row, 7).Style.Font.FontColor = Green;
            sheet.Cell(row, 9).Style.Font.FontColor = Teal;
            sheet.Cell(row, 10).Style.Font.FontColor = Amber;
            if (category.ErrorNotebookProblems > 0)
                sheet.Cell(row, 5).Style.Font.FontColor = Red;
            if (category.IncorrectAttempts > 0)
                sheet.Cell(row, 8).Style.Font.FontColor = Red;
            row++;
        }

        sheet.Cell(row, 1).Value = ar ? "الإجمالي" : "TOTAL";
        sheet.Cell(row, 3).Value = report.AttemptedProblems;
        sheet.Cell(row, 4).Value = report.SolvedProblems;
        sheet.Cell(row, 5).Value = review;
        sheet.Cell(row, 6).Value = report.Attempts;
        sheet.Cell(row, 7).Value = report.CorrectAttempts;
        sheet.Cell(row, 8).Value = report.IncorrectAttempts;
        sheet.Cell(row, 9).Value = report.FirstTryCorrect;
        sheet.Cell(row, 10).Value = report.AwardedPoints;
        sheet.Cell(row, 11).Value = report.TimeSpentSeconds;
        var total = sheet.Range(row, 1, row, 11);
        total.Style.Fill.BackgroundColor = SlateTint;
        total.Style.Font.FontColor = Navy;
        total.Style.Font.Bold = true;
        total.Style.Border.TopBorder = XLBorderStyleValues.Medium;
        total.Style.Border.TopBorderColor = Teal;
        sheet.Row(row).Height = 29;

        if (row > 13)
        {
            sheet.Range(13, 4, row - 1, 4).AddConditionalFormat().DataBar(Green);
            sheet.Range(13, 5, row - 1, 5).AddConditionalFormat().DataBar(Red);
        }
        // A single table with an in-place filter and no floating chart objects.
        sheet.Range(12, 1, Math.Max(12, row - 1), 11).SetAutoFilter();
        sheet.SheetView.FreezeRows(12);
        sheet.PageSetup.PageOrientation = XLPageOrientation.Landscape;
        sheet.PageSetup.FitToPages(1, 0);
    }

    private static void FormatBodyRow(IXLWorksheet sheet, int row, XLColor background)
    {
        var range = sheet.Range(row, 1, row, 11);
        range.Style.Fill.BackgroundColor = background;
        range.Style.Border.BottomBorder = XLBorderStyleValues.Hair;
        range.Style.Border.BottomBorderColor = Border;
        range.Style.Alignment.Vertical = XLAlignmentVerticalValues.Center;
        sheet.Range(row, 3, row, 11).Style.Alignment.Horizontal =
            XLAlignmentHorizontalValues.Center;
        sheet.Cell(row, 2).Style.Font.Bold = true;
        sheet.Cell(row, 2).Style.Alignment.WrapText = true;
        sheet.Range(row, 1, row, 2).Style.Alignment.Horizontal =
            sheet.RightToLeft ? XLAlignmentHorizontalValues.Right : XLAlignmentHorizontalValues.Left;
        sheet.Row(row).Height = 34;
    }

    private static void BuildCharts(IXLWorksheet sheet,
        StudentPremiumAnalyticsController.StudentAnalyticsReport report,
        bool ar, byte[] logo)
    {
        sheet.Column(1).Width = 34;
        sheet.Column(2).Width = 17;
        sheet.Column(3).Width = 19;
        sheet.Column(4).Width = 4;
        sheet.Column(5).Width = 34;
        sheet.Column(6).Width = 17;
        sheet.Column(7).Width = 19;
        sheet.Column(8).Width = 17;
        sheet.Column(9).Width = 18;
        sheet.Column(10).Width = 8;
        Header(sheet, ar ? "MathWorld  |  إحصائياتي"
            : "MathWorld  |  My statistics",
            ar ? "مخططات تقدم مدمجة بالخلايا — بدون رسومات تغطي البيانات"
               : "Compact in-cell progress charts — no overlapping drawings",
            logo, ar);

        var top = report.Categories.OrderByDescending(c => c.AttemptedProblems)
            .ThenBy(c => c.StageId).ThenBy(c => c.CategoryId)
            .Take(12).ToArray();
        var left = ar
            ? new[] { "الفئة", "محلولة", "دفتر الأخطاء" }
            : new[] { "Category", "Solved", "Review errors" };
        var right = ar
            ? new[] { "الفئة", "الصحيحة", "الخاطئة", "المحاولات", "المجربة" }
            : new[] { "Category", "Correct", "Incorrect", "Attempts", "Attempted" };
        sheet.Range("A5:C6").Merge().Value =
            ar ? "إنجاز المسائل حسب الفئة" : "Solved progress by category";
        sheet.Range("E5:I6").Merge().Value =
            ar ? "دقة المحاولات حسب الفئة" : "Answer accuracy by category";
        foreach (var area in new[] { "A5:C6", "E5:I6" })
        {
            var range = sheet.Range(area);
            range.Style.Fill.BackgroundColor = Navy;
            range.Style.Font.FontColor = XLColor.White;
            range.Style.Font.Bold = true;
            range.Style.Font.FontSize = 13;
            range.Style.Alignment.Vertical = XLAlignmentVerticalValues.Center;
            range.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
        }
        for (var i = 0; i < left.Length; i++) sheet.Cell(8, i + 1).Value = left[i];
        for (var i = 0; i < right.Length; i++) sheet.Cell(8, i + 5).Value = right[i];
        foreach (var area in new[] { "A8:C8", "E8:I8" })
        {
            var cells = sheet.Range(area);
            cells.Style.Fill.BackgroundColor = SlateTint;
            cells.Style.Font.FontColor = Navy;
            cells.Style.Font.Bold = true;
            cells.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
            cells.Style.Alignment.WrapText = true;
        }
        sheet.Row(8).Height = 36;
        var row = 9;
        foreach (var c in top)
        {
            var name = ar ? c.CategoryNameAr : c.CategoryNameEn;
            sheet.Cell(row, 1).Value = name;
            sheet.Cell(row, 2).Value = c.SolvedProblems;
            sheet.Cell(row, 3).Value = c.ErrorNotebookProblems;
            sheet.Cell(row, 5).Value = name;
            sheet.Cell(row, 6).Value = c.CorrectAttempts;
            sheet.Cell(row, 7).Value = c.IncorrectAttempts;
            sheet.Cell(row, 8).Value = c.Attempts;
            sheet.Cell(row, 9).Value = c.AttemptedProblems;
            foreach (var area in new[] { sheet.Range(row, 1, row, 3),
                sheet.Range(row, 5, row, 9) })
            {
                area.Style.Fill.BackgroundColor = row % 2 == 1 ? Light : XLColor.White;
                area.Style.Border.BottomBorder = XLBorderStyleValues.Hair;
                area.Style.Border.BottomBorderColor = Border;
                area.Style.Alignment.Vertical = XLAlignmentVerticalValues.Center;
            }
            sheet.Cell(row, 1).Style.Alignment.Horizontal = ar ? XLAlignmentHorizontalValues.Right : XLAlignmentHorizontalValues.Left;
            sheet.Cell(row, 5).Style.Alignment.Horizontal = ar ? XLAlignmentHorizontalValues.Right : XLAlignmentHorizontalValues.Left;
            sheet.Cell(row, 2).Style.Font.FontColor = Green;
            sheet.Cell(row, 3).Style.Font.FontColor = Red;
            sheet.Cell(row, 6).Style.Font.FontColor = Green;
            sheet.Cell(row, 7).Style.Font.FontColor = Red;
            sheet.Row(row).Height = 32;
            row++;
        }
        if (top.Length > 0)
        {
            sheet.Range(9, 2, row - 1, 2).AddConditionalFormat().DataBar(Green);
            sheet.Range(9, 3, row - 1, 3).AddConditionalFormat().DataBar(Red);
            sheet.Range(9, 6, row - 1, 6).AddConditionalFormat().DataBar(Green);
            sheet.Range(9, 7, row - 1, 7).AddConditionalFormat().DataBar(Red);
        }
        else
        {
            sheet.Cell(9, 1).Value = ar ? "لا توجد بيانات بعد" : "No data yet";
        }
        sheet.SheetView.FreezeRows(8);
        sheet.PageSetup.PageOrientation = XLPageOrientation.Landscape;
        sheet.PageSetup.FitToPages(1, 0);
    }
}
