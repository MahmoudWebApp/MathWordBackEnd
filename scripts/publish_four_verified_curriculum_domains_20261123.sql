-- Four reviewed curriculum domains had valid bilingual descriptions but
-- remained unpublished, hiding 36 otherwise published category skills.
-- Changing the domain publication status exposes existing learning objectives
-- on public and student web and Flutter using the shared curriculum API.
BEGIN;
DO $domain$
DECLARE n integer;
BEGIN
  UPDATE public."CurriculumDomains" d
  SET "IsPublished" = TRUE
  WHERE ("Id","StableKey") IN
    ((3,'geometry-measurement'),(5,'calculus-analysis'),
     (6,'linear-algebra'),(8,'differential-equations'))
    AND d."IsPublished" = FALSE
    AND LENGTH(TRIM(d."NameAr")) > 2
    AND LENGTH(TRIM(d."NameEn")) > 2
    AND LENGTH(TRIM(d."DescriptionAr")) > 8
    AND LENGTH(TRIM(d."DescriptionEn")) > 8
    AND EXISTS (SELECT 1 FROM public."CurriculumSkills" s
                WHERE s."DomainId"=d."Id" AND s."IsPublished");
  GET DIAGNOSTICS n = ROW_COUNT;
  IF n <> 4 THEN
    RAISE EXCEPTION 'Expected exactly 4 reviewed domains; updated %, rolling back', n;
  END IF;
END $domain$;
COMMIT;
