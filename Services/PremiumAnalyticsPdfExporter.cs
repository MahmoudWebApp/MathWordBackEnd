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
                    column.Item().Border(1).BorderColor(Border).Padding(9).Column(context=>{
                        context.Spacing(2);
                        foreach(var line in PremiumAnalyticsReportContext.Lines(report,ar))
                            context.Item().Text(line).FontSize(9);
                    });
                    column.Item().Background(Light).Border(1).BorderColor(Border)
                        .Padding(10).Row(row =>
                        {
                            row.Spacing(8);
                            row.RelativeItem().Element(c => Metric(c,
                                ar ? "المحلولة / الإجمالي" : "Solved / total", $"{report.SolvedProblems}/{report.TotalProblems}", Green));
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
                            ? new[] { "المرحلة", "الفئة", "محلولة / الإجمالي", "محاولات", "صحيحة", "أخطاء للمراجعة", "النقاط" }
                            : new[] { "Stage", "Category", "Solved / total", "Attempts", "Correct", "Review", "Points" };
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
                            AddCell(table, $"{item.SolvedProblems}/{item.TotalProblems}");
                            AddCell(table, item.Attempts.ToString(CultureInfo.InvariantCulture));
                            AddCell(table, item.CorrectAttempts.ToString(CultureInfo.InvariantCulture));
                            AddCell(table, item.ErrorNotebookProblems.ToString(CultureInfo.InvariantCulture));
                            AddCell(table, item.AwardedPoints.ToString(CultureInfo.InvariantCulture));
                        }
                    });
                    column.Item().Text(ar ? "آخر المحاولات" : "Recent attempts").Bold().FontSize(14).FontColor(Navy);
                    if(report.RecentAttempts.Count==0)
                        column.Item().Text(ar?"لا توجد محاولات":"No attempts");
                    else column.Item().Table(table=>{
                        table.ColumnsDefinition(cols=>{cols.RelativeColumn(3);cols.RelativeColumn();cols.RelativeColumn(1.4f);});
                        table.Header(header=>{
                            foreach(var title in ar?new[]{"المسألة","النتيجة","التاريخ (UTC)"}:new[]{"Problem","Result","Date (UTC)"})
                                header.Cell().Background(Navy).Padding(6).Text(title).FontColor(Colors.White);
                        });
                        foreach(var attempt in report.RecentAttempts)
                        {
                            AddCell(table,ar?attempt.TitleAr:attempt.TitleEn);
                            AddCell(table,attempt.IsCorrect?(ar?"صحيحة":"Correct"):(ar?"خاطئة":"Incorrect"));
                            AddCell(table,attempt.SubmittedAtUtc.ToString("yyyy-MM-dd HH:mm",CultureInfo.InvariantCulture));
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


    /// <summary>Printable authoring contract for editors and generation tools.</summary>
    public static byte[] CreateAuthoringGuide(bool ar)
    {
        _ = Initialized.Value;
        using var imageStream=typeof(PremiumAnalyticsPdfExporter).Assembly.GetManifestResourceStream("MathWorld.Brand.Logo.png")
            ?? throw new InvalidOperationException("MathWorld approved logo missing");
        using var buffer=new MemoryStream();imageStream.CopyTo(buffer);var logo=buffer.ToArray();
        string T(string a,string e)=>ar?a:e;
        var groups=new (string Title,string[] Lines)[]
        {
            (T("1. التصنيف والبنية","1. Classification and structure"),new[]{
                T("استخدم معرفات حقيقية ومتوافقة للمرحلة والفئة والمهارة الأساسية. اختر من 1 إلى 50 مساراً فريداً من المرحلة نفسها، وحتى 30 مهارة مساندة لا تشمل الأساسية.","Use real compatible stage, category and primary skill IDs. Select 1–50 unique tracks from the same stage and at most 30 distinct secondary skills excluding the primary."),
                "StageId · CategoryId · PrimarySkillId · SecondarySkillIds · TrackIds",
                T("الصعوبة من 1 إلى 5؛ النقاط من 1 إلى 100000 وفق العقد. العنوان حتى 250 حرفاً والسؤال حتى 5000 لكل لغة. الحقول الثنائية تحتوي Ar وEn.","Difficulty 1–5; points 1–100000 under the contract. Title up to 250 and question up to 5000 characters per language. Bilingual objects contain Ar and En."),
                T("لا تخترع معرفات أو مستويات صعوبة. تأكد من تطابق السؤال مع الفئة والمهارات والمنهج المنشور.","Never invent identifiers or difficulty levels. Verify that the question matches the published curriculum and skills.")
            }),
            (T("2. LaTeX والخيارات والتلميحات","2. LaTeX, options and hints"),new[]{
                T("في النصوص، استخدم علامتي الدولار للمعادلة داخل السطر ودولارين مزدوجين للمعادلة المستقلة. في LatexCode وFormulaLatex اكتب LaTeX دون دولارات. استخدم x وy وa وb، وليس رموزاً عربية للمتغيرات.","Use dollar delimiters for inline and double dollar delimiters for display math in text. LatexCode and FormulaLatex contain raw LaTeX. Use Latin mathematical variables."),
                @"$2x+3=11$  |  $$a^2+b^2=c^2$$  |  \frac{3}{4}  |  \sqrt{x}  |  x^{2}",
                @"\int_a^b f(x)\,dx  |  \lim_{x\to0} f(x)  |  JSON: ""LatexCode"": ""\\frac{3}{4}""",
                T("أربعة خيارات مختلفة رياضياً ونصياً؛ صحيح واحد فقط. LatexCode حتى 3000 حرف. لكل مشتت ErrorType حتى 80 حرفاً وReason باللغتين حتى 1000 حرف؛ في الشرح اليدوي المعتمد يمكن تركهما فارغين.","Four mathematically and textually distinct options, exactly one correct. LatexCode max 3000. Each distractor needs ErrorType max 80 and bilingual Reason max 1000; approved manual explanations can omit them."),
                T("تلميحان مختلفان باللغتين، حتى 1000 حرف لكل لغة. الأول يوجه للفكرة والثاني للخطوة التالية، دون كشف الإجابة.","Two distinct bilingual hints, max 1000 characters per language. First guides the idea, second the next step, neither reveals the answer.")
            }),
            (T("3. الحل والفيديو","3. Solution and video"),new[]{
                T("الحل المنظم: Idea (2000)، Steps (من 1 إلى 20، كل خطوة 2000)، Result (1000) إلزامية باللغتين.","Structured solution requires bilingual Idea (2000), Steps (1–20, 2000 per step) and Result (1000)."),
                T("في الإضافة والتعديل التفاعلي فقط: FormulaLatex وSubstitution وVerification وCommonError حتى 2000، وUnit حتى 200، اختيارية عند عدم الانطباق. الحقل الثنائي إما فارغ باللغتين أو مكتمل باللغتين. الاستيراد الجماعي يحتفظ بالتحقق الصارم.","Interactive authoring only: FormulaLatex, Substitution, Verification and CommonError up to 2000, Unit up to 200, are optional if inapplicable. Bilingual optional fields must be empty in both languages or complete in both. Bulk imports retain strict validation."),
                T("الشرح المرن ManualExplanation متاح للأدمن وفق الصلاحيات، حتى 12000 حرف لكل لغة. لا تتجاوز هذه الحدود في الحل المسطح. استخدم خطوات برهانية عند الحاجة دون اختراع قانون أو وحدة.","Admin-authorized ManualExplanation allows up to 12000 characters per language. Flattened solutions must also stay within that limit. Use proof steps when appropriate, never invent a formula or unit."),
                T("YoutubeSolutionUrl اختياري: رابط HTTPS صالح لفيديو YouTube، بطول لا يتجاوز 2048 حرفاً. تحقق من المعاينة قبل الحفظ.","Optional YoutubeSolutionUrl: valid HTTPS YouTube video URL, max 2048 characters. Verify preview before saving.")
            }),
            (T("4. مثال صالح رياضياً","4. Mathematically valid example"),new[]{
                T("أوجد قيمة x إذا كان 2x+3=11. الخيارات: 3، 4 (صحيح)، 7، 8.","Find x if 2x+3=11. Options: 3, 4 (correct), 7, 8."),
                T("المشتتات: 3 خطأ حسابي عند طرح 3؛ 7 جمع 3 بدلاً من طرحها؛ 8 تجاهل القسمة على 2.","Distractors: 3 arithmetic error when subtracting 3; 7 added rather than subtracted 3; 8 omitted division by 2."),
                T("تلميح 1: اعزل الحد الذي يحتوي x. تلميح 2: اطرح 3 من الطرفين.","Hint 1: isolate the term containing x. Hint 2: subtract 3 from both sides."),
                T("الحل: حافظ على تساوي الطرفين. 2x=8 ثم x=4. تحقق: 2(4)+3=11. لا وحدة لهذه المسألة.","Solution: preserve equality. 2x=8, then x=4. Check: 2(4)+3=11. No unit applies."),
                "Title: { Ar, En }; Question: { Ar, En }; Options: [{ LatexCode, IsCorrect, ErrorType, Reason: { Ar, En } }]; Hints: [{ Ar, En }, { Ar, En }]; Solution: { Idea, FormulaLatex, Steps, Substitution, Result, Unit, Verification, CommonError }."
            }),
            (T("5. تعليمات جاهزة لأدوات الذكاء الاصطناعي","5. Prompt for generation tools"),new[]{
                T("ولّد مسائل أصلية وفق عقد WizardProblem. استخدم العربية والإنجليزية ورموزاً رياضية لاتينية. استخدم حصراً معرفات التصنيف التي يزودك بها المستخدم. أخرج JSON صحيحاً، بأربعة خيارات غير متكافئة وصحيح واحد، وأسباب للمشتتات وتلميحين متدرجين وحل قابل للتحقق. في الاستيراد الجماعي أكمل حقول الحل المطلوبة؛ لا تترك حقلاً اختيارياً إلا إذا كان المسار التفاعلي يسمح بذلك. لا تخترع محتوى غير منطبق؛ أشر للمراجع البشري إلى الحالات التي تستلزم شرحاً مرناً.","Generate original problems conforming to WizardProblem. Write Arabic and English with Latin math variables. Use only supplied curriculum identifiers. Output valid JSON, four inequivalent options with one correct answer, distractor reasons, two progressive hints and a verifiable solution. Complete strict solution fields for bulk imports; omit optional fields only when the interactive workflow permits. Flag non-applicable fields for human review rather than inventing content."),
                T("قبل الاعتماد: تحقق مستقلاً من الحساب والبرهان، عدم التكافؤ، تطابق اللغتين، LaTeX، التصنيف والتلميحات. احفظ كمسودة ثم اتبع صلاحيات المراجعة والنشر. لا تغير معرفات الخيارات أو سجل الطالب عند تعديل مسألة منشورة.","Before approval: independently verify math, option inequivalence, translations, LaTeX, classification and hints. Save as a draft and follow review/publication permissions. Never alter option identities or learner history when amending published content.")
            })
        };
        return Document.Create(doc=>doc.Page(page=>{
            page.Size(PageSizes.A4);page.Margin(34);page.PageColor(Colors.White);
            page.DefaultTextStyle(t=>t.FontFamily("IBM Plex Sans Arabic").FontSize(11).FontColor(Navy));
            page.Header().Row(row=>{row.ConstantItem(44).Height(44).Image(logo);row.RelativeItem().PaddingHorizontal(12).AlignMiddle().Text(T("MathWorld | دليل إضافة المسائل","MathWorld | Problem authoring guide")).FontSize(18).Bold().FontColor(Teal);});
            var root=page.Content().PaddingTop(14);root=ar?root.ContentFromRightToLeft():root.ContentFromLeftToRight();
            root.Column(col=>{
                col.Spacing(10);
                foreach(var group in groups){
                    col.Item().EnsureSpace(50).Background(Light).Padding(9).Text(group.Title).FontSize(15).Bold().FontColor(Teal);
                    foreach(var line in group.Lines)col.Item().PaddingHorizontal(6).Text(line);
                }
            });
            page.Footer().AlignCenter().Text(t=>{t.Span("MathWorld • ");t.CurrentPageNumber();t.Span(" / ");t.TotalPages();});
        })).GeneratePdf();
    }

    public static byte[] CreateExamCertificate(MathWorldAPI.Models.CustomExam exam,bool ar)
    {
        _ = Initialized.Value;
        using var stream=typeof(PremiumAnalyticsPdfExporter).Assembly.GetManifestResourceStream("MathWorld.Brand.Logo.png")
            ?? throw new InvalidOperationException("MathWorld approved report logo missing");
        using var buffer=new MemoryStream();stream.CopyTo(buffer);var logo=buffer.ToArray();
        return Document.Create(document=>document.Page(page=>{
            page.Size(PageSizes.A4.Landscape());page.Margin(36);page.PageColor(Colors.White);
            page.DefaultTextStyle(t=>t.FontFamily("IBM Plex Sans Arabic").FontColor(Navy).FontSize(15));
            var root=page.Content();root=ar?root.ContentFromRightToLeft():root.ContentFromLeftToRight();
            root.Border(2).BorderColor(Teal).Padding(24).Column(col=>{
                col.Spacing(12);col.Item().AlignCenter().Width(60).Height(60).Image(logo);
                col.Item().AlignCenter().Text("MathWorld").FontSize(25).Bold().FontColor(Teal);
                col.Item().AlignCenter().Text(ar?"شهادة اجتياز امتحان":"Exam achievement certificate").FontSize(27).Bold();
                col.Item().AlignCenter().Text(exam.CertificateStudentName??"").FontSize(24).SemiBold();
                col.Item().AlignCenter().Text(ar?exam.TitleAr:exam.TitleEn).FontSize(20).SemiBold();
                col.Item().AlignCenter().Text(ar?$"الدرجة: {exam.Score} من {exam.Total} — حد النجاح {exam.PassPercent}%":$"Score: {exam.Score} of {exam.Total} — pass threshold {exam.PassPercent}%");
                col.Item().AlignCenter().Text(exam.FinishedAtUtc!.Value.ToString("yyyy-MM-dd",CultureInfo.InvariantCulture));
                col.Item().AlignCenter().Text(ar?"رمز التحقق":"Verification code").FontSize(11);
                col.Item().ContentFromLeftToRight().AlignCenter().Text(exam.VerificationCode??"").FontSize(12).SemiBold();
                col.Item().AlignCenter().Text(ar?"شهادة تعليمية صادرة عن MathWorld، وليست اعتماداً أكاديمياً خارجياً.":"Issued by MathWorld; not an external academic accreditation.").FontSize(10);
            });
        })).GeneratePdf();
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
