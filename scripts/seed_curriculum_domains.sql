-- Idempotent curricular vocabulary; not a fixed category count.
-- Run after 20261121220000_CurriculumTaxonomy schema migration.
INSERT INTO "CurriculumDomains"
("StableKey","NameAr","NameEn","DescriptionAr","DescriptionEn","SortOrder","IsPublished")
VALUES
('numbers-operations','الأعداد والعمليات','Numbers and Operations','الأعداد والعمليات والعلاقات العددية','Number systems, arithmetic and numerical relationships',10,false),
('algebra-functions','الجبر والدوال','Algebra and Functions','التعبيرات والمعادلات والعلاقات والدوال','Expressions, equations, patterns and functions',20,false),
('geometry-measurement','الهندسة والقياس','Geometry and Measurement','الأشكال والحيز والقياسات والبراهين','Shapes, space, measurement and proof',30,false),
('statistics-probability','الإحصاء والاحتمالات','Statistics and Probability','تحليل البيانات والاحتمالات والاستدلال الإحصائي','Data, chance and statistical reasoning',40,false),
('calculus-analysis','التفاضل والتكامل والتحليل','Calculus and Analysis','النهايات والتغير والتكامل والتحليل الرياضي','Limits, rates of change, integration and analysis',50,false),
('linear-algebra','الجبر الخطي','Linear Algebra','المتجهات والمصفوفات والتحويلات الخطية','Vectors, matrices and linear transformations',60,false),
('discrete-mathematics','الرياضيات المتقطعة','Discrete Mathematics','العد والمنطق والتراكيب الرياضية المتقطعة','Counting, logic and discrete structures',70,false),
('differential-equations','المعادلات التفاضلية','Differential Equations','نمذجة الأنظمة والتغير باستخدام المعادلات التفاضلية','Modeling change with differential equations',80,false)
ON CONFLICT ("StableKey") DO NOTHING;
