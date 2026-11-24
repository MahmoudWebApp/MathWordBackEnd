using System.Globalization;
using System.Threading;
using MathWorldAPI.Controllers;
using QuestPDF.Drawing;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace MathWorldAPI.Services;

/// <summary>
/// Creates a real, directly downloadable, searchable PDF in the requested
/// language. Data is exclusively from the authorized student report.
/// </summary>
public static class PremiumAnalyticsPdfExporter
{
    // A restrained professional reporting palette. The official MathWorld
    // logo above remains unchanged and embedded in both localized PDFs.
    private const string Navy = "#223047";
    private const string Teal = "#0F766E";
    private const string Green = "#15803D";
    private const string Red = "#B91C1C";
    private const string Amber = "#A16207";
    private const string Blue = "#1D4ED8";
    private const string Ink = "#273345";
    private const string Light = "#F8FAFC";
    private const string Border = "#DDE5EE";

    private static readonly Lazy<bool> Initialized = new(() =>
    {
        // Community eligibility must be re-evaluated if the project's license
        // or organization circumstances change.
        QuestPDF.Settings.License = LicenseType.Community;
        FontManager.RegisterFontFromEmbeddedResource("MathWorld.Brand.PdfArabicRegular.ttf");
        FontManager.RegisterFontFromEmbeddedResource("MathWorld.Brand.PdfArabicSemiBold.ttf");
        return true;
    }, LazyThreadSafetyMode.ExecutionAndPublication);

    public static byte[] Create(
        StudentPremiumAnalyticsController.StudentAnalyticsReport report, bool ar)
    {
        ArgumentNullException.ThrowIfNull(report);
        _ = Initialized.Value;
        using var imageStream = typeof(PremiumAnalyticsPdfExporter).Assembly
            .GetManifestResourceStream("MathWorld.Brand.Logo.png")
            ?? throw new InvalidOperationException("MathWorld approved report logo missing");
        using var imageBuffer = new MemoryStream();
        imageStream.CopyTo(imageBuffer);
        var logo = imageBuffer.ToArray();
        var accuracy = report.Attempts == 0 ? 0 :
            (int)Math.Round(100.0 * report.CorrectAttempts / report.Attempts);
        var review = report.Categories.Sum(x => x.ErrorNotebookProblems);
        var top = report.Categories.OrderByDescending(x => x.SolvedProblems)
            .ThenBy(x => x.CategoryId).Take(9).ToArray();
        var maxSolved = Math.Max(1, top.Select(x => x.SolvedProblems).DefaultIfEmpty(0).Max());
        var maxAttempts = Math.Max(1, top.Select(x => x.Attempts).DefaultIfEmpty(0).Max());

        var document = Document.Create(document =>
        {
            document.Page(page =>
            {
                page.Size(PageSizes.A4.Landscape());
                page.Margin(28);
                page.PageColor(Colors.White);
                page.DefaultTextStyle(text => text.FontFamily("IBM Plex Sans Arabic")
                    .FontSize(9).FontColor(Ink));

                page.Header().BorderBottom(1).BorderColor(Border).PaddingBottom(13).Row(row =>
                {
                    row.ConstantItem(56).Height(56).Image(logo);
                    row.RelativeItem().PaddingLeft(14).Column(column =>
                    {
                        column.Item().Text("MathWorld").FontSize(20).Bold().FontColor(Navy);
                        column.Item().Text(ar ? "منصة الرياضيات التفاعلية" :
                            "Interactive mathematics learning").FontSize(9).FontColor(Teal);
                        column.Item().Text(ar ? "تقرير التقدم في الرياضيات" :
                            "Mathematics progress report").FontSize(14).SemiBold().FontColor(Navy);
                    });
                    row.ConstantItem(138).AlignRight().Column(column =>
                    {
                        column.Item().Text(ar ? "تاريخ التقرير" : "Report date")
                            .FontColor("#6B6078");
                        column.Item().Text(report.GeneratedAtUtc.ToString(
                            "yyyy-MM-dd", CultureInfo.InvariantCulture)).SemiBold();
                    });
                });

                var root = page.Content();
                if (ar) root = root.ContentFromRightToLeft();
                else root = root.ContentFromLeftToRight();
                root.Column(column =>
                {
                    column.Spacing(13);
                    column.Item().Background(Light).Border(1).BorderColor(Border)
                        .Padding(10).Row(row =>
                        {
                            row.Spacing(8);
                            row.RelativeItem().Element(c => Metric(c,
                                ar ? "المحلولة" : "Solved", report.SolvedProblems, Green));
                            row.RelativeItem().Element(c => Metric(c,
                                ar ? "المحاولات" : "Attempts", report.Attempts, Blue));
                            row.RelativeItem().Element(c => Metric(c,
                                ar ? "الصحيحة" : "Correct", report.CorrectAttempts, Green));
                            row.RelativeItem().Element(c => Metric(c,
                                ar ? "النقاط" : "Points", report.AwardedPoints, Amber));
                            row.RelativeItem().Element(c => Metric(c,
                                ar ? "الدقة" : "Accuracy", accuracy.ToString() + "%", Teal));
                            row.RelativeItem().Element(c => Metric(c,
                                ar ? "دفتر الأخطاء" : "Review errors", review, Red));
                        });

                    column.Item().Text(ar ? "ملخص إحصائي حسب الفئة" :
                        "Category performance charts").Bold().FontSize(14).FontColor(Navy);

                    if (top.Length == 0)
                        column.Item().Text(ar ? "لا توجد محاولات حتى الآن." :
                            "No attempts have been recorded yet.");
                    else
                    {
                        column.Item().Border(1).BorderColor(Border).Padding(12).Column(chart =>
                        {
                            chart.Spacing(7);
                            chart.Item().Text(ar ? "المسائل المحلولة" : "Solved problems")
                                .SemiBold().FontColor(Green);
                            foreach (var item in top)
                                chart.Item().Element(c => MetricBar(c,
                                    ar ? item.CategoryNameAr : item.CategoryNameEn,
                                    item.SolvedProblems, maxSolved, Green));
                        });

                        column.Item().Border(1).BorderColor(Border).Padding(12).Column(chart =>
                        {
                            chart.Spacing(7);
                            chart.Item().Text(ar ? "إجمالي المحاولات" : "Total attempts")
                                .SemiBold().FontColor(Teal);
                            foreach (var item in top)
                                chart.Item().Element(c => MetricBar(c,
                                    ar ? item.CategoryNameAr : item.CategoryNameEn,
                                    item.Attempts, maxAttempts, Teal));
                        });
                    }

                    column.Item().PaddingTop(6).Text(ar ? "التفاصيل حسب المرحلة والفئة" :
                        "Detailed results by stage and category").Bold().FontSize(14).FontColor(Navy);
                    column.Item().Table(table =>
                    {
                        table.ColumnsDefinition(cols =>
                        {
                            cols.RelativeColumn(1.6f);
                            cols.RelativeColumn(2.6f);
                            for (var i = 0; i < 5; i++) cols.RelativeColumn(0.9f);
                        });

                        var titles = ar
                            ? new[] { "المرحلة", "الفئة", "محلولة", "محاولات", "صحيحة", "أخطاء للمراجعة", "النقاط" }
                            : new[] { "Stage", "Category", "Solved", "Attempts", "Correct", "Review", "Points" };
                        table.Header(header =>
                        {
                            foreach (var title in titles)
                                header.Cell().Background(Navy).PaddingVertical(8)
                                    .PaddingHorizontal(5).Text(title).FontColor(Colors.White)
                                    .SemiBold().FontSize(8);
                        });
                        foreach (var item in report.Categories)
                        {
                            AddCell(table, ar ? item.StageNameAr : item.StageNameEn);
                            AddCell(table, ar ? item.CategoryNameAr : item.CategoryNameEn);
                            AddCell(table, item.SolvedProblems.ToString(CultureInfo.InvariantCulture));
                            AddCell(table, item.Attempts.ToString(CultureInfo.InvariantCulture));
                            AddCell(table, item.CorrectAttempts.ToString(CultureInfo.InvariantCulture));
                            AddCell(table, item.ErrorNotebookProblems.ToString(CultureInfo.InvariantCulture));
                            AddCell(table, item.AwardedPoints.ToString(CultureInfo.InvariantCulture));
                        }
                    });
                    column.Item().Text(ar
                        ? "جميع الأرقام مأخوذة من تقدّم الطالب الفعلي. ولا تُعرض معرّفات داخلية."
                        : "All figures come from your actual recorded progress. Internal IDs are omitted.")
                        .FontSize(8).FontColor("#746783");
                });

                page.Footer().PaddingTop(8).BorderTop(1).BorderColor(Border).Row(row =>
                {
                    row.RelativeItem().Text("MathWorld").FontColor(Navy).SemiBold();
                    row.RelativeItem().AlignRight().Text(text =>
                    {
                        text.Span(ar ? "الصفحة " : "Page ");
                        text.CurrentPageNumber();
                        text.Span(" / ");
                        text.TotalPages();
                    });
                });
            });
        });
        return document.GeneratePdf();
    }


    public static byte[] CreateCertificate(MathWorldAPI.Models.LearningCertificate certificate,bool ar)
    {
        _ = Initialized.Value;
        using var stream=typeof(PremiumAnalyticsPdfExporter).Assembly.GetManifestResourceStream("MathWorld.Brand.Logo.png")
            ?? throw new InvalidOperationException("MathWorld approved report logo missing");
        using var buffer=new MemoryStream();stream.CopyTo(buffer);
        var logo=buffer.ToArray();
        var c=certificate;
        return Document.Create(document=>document.Page(page=>{
            page.Size(PageSizes.A4.Landscape());page.Margin(36);page.PageColor(Colors.White);
            page.DefaultTextStyle(t=>t.FontFamily("IBM Plex Sans Arabic").FontColor(Navy).FontSize(15));
            var root=page.Content();
            root=ar?root.ContentFromRightToLeft():root.ContentFromLeftToRight();
            root.Border(2).BorderColor(Teal).Padding(24).Column(col=>{
                col.Spacing(12);
                col.Item().AlignCenter().Width(60).Height(60).Image(logo);
                col.Item().AlignCenter().Text("MathWorld").FontSize(25).Bold().FontColor(Teal);
                col.Item().AlignCenter().Text(ar?"شهادة إكمال وإتقان":"Certificate of completion and mastery").FontSize(27).Bold();
                col.Item().AlignCenter().Text(ar?"تُمنح هذه الشهادة إلى":"This certificate is awarded to").FontSize(13);
                col.Item().AlignCenter().Text(c.StudentName).FontSize(25).SemiBold();
                col.Item().AlignCenter().Text(ar?c.TitleAr:c.TitleEn).FontSize(20).SemiBold().FontColor(Teal);
                col.Item().AlignCenter().Text(ar?$"أكمل {c.TotalProblems} مسألة وأثبت الحل المستقل في {c.RequiredSkills} مهارة.":$"Completed {c.TotalProblems} problems and demonstrated independent solving in {c.RequiredSkills} skills.");
                col.Item().AlignCenter().Text(ar?"تاريخ الإصدار (UTC)":"Issued (UTC)").FontSize(11);
                col.Item().AlignCenter().Text(c.IssuedAtUtc.ToString("yyyy-MM-dd",CultureInfo.InvariantCulture)).SemiBold();
                col.Item().PaddingTop(6).BorderTop(1).BorderColor(Border).PaddingTop(8).AlignCenter().Text(ar?"رمز التحقق من الشهادة":"Certificate verification code").FontSize(11);
                col.Item().ContentFromLeftToRight().AlignCenter().Text(c.VerificationCode).FontSize(12).SemiBold();
                col.Item().AlignCenter().Text(ar?"شهادة إنجاز تعليمية من MathWorld، وليست اعتماداً أكاديمياً رسمياً.":"A MathWorld learning achievement, not a formal academic accreditation.").FontSize(9);
            });
        })).GeneratePdf();
    }

    private static void Metric(IContainer container, string label, object value, string accent)
    {
        container.Column(column =>
        {
            column.Item().Text(label).FontSize(8).FontColor("#536377");
            column.Item().Text(Convert.ToString(value, CultureInfo.InvariantCulture) ?? "")
                .FontSize(15).Bold().FontColor(accent);
        });
    }

    private static void MetricBar(
        IContainer container, string label, int count, int maximum, string color)
    {
        var ratio = Math.Min(100, 100.0 * count / Math.Max(1, maximum));
        container.Row(row =>
        {
            row.ConstantItem(200).Text(label).FontSize(8);
            row.RelativeItem().Height(9).Background("#EAF1F6").Row(fill =>
            {
                fill.RelativeItem((float)Math.Max(0.01, ratio)).Background(color);
                fill.RelativeItem((float)Math.Max(0.01, 100.0 - ratio));
            });
            row.ConstantItem(36).AlignRight().Text(count.ToString(CultureInfo.InvariantCulture))
                .SemiBold().FontSize(8);
        });
    }

    private static void AddCell(TableDescriptor table, string text)
    {
        table.Cell().BorderBottom(1).BorderColor(Border).Padding(5)
            .Text(text).FontSize(8);
    }
}
