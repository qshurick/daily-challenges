CREATE OR REPLACE FUNCTION IS_SMOOTH_SENTENCE(in sentence text) RETURNS boolean
AS $$
DECLARE
    words text[];
    word text;
    last_character char;
BEGIN
    last_character := NULL;
    SELECT STRING_TO_ARRAY(LOWER(sentence), ' ') INTO words;

    FOREACH word IN ARRAY words
    LOOP
        IF last_character IS NOT NULL AND last_character <> LEFT(word, 1) THEN
            RETURN FALSE;
        END IF;
        last_character := RIGHT(word, 1);
    END LOOP;

    RETURN TRUE;
END
$$ LANGUAGE plpgsql;

SELECT 'Marta appreciated deep perpendicular right trapezoids' AS SENTENCE, IS_SMOOTH_SENTENCE('Marta appreciated deep perpendicular right trapezoids') AS IS_SMOOTH
UNION ALL
SELECT 'Someone is outside the doorway', IS_SMOOTH_SENTENCE('Someone is outside the doorway')
UNION ALL
SELECT 'She eats super righteously', IS_SMOOTH_SENTENCE('She eats super righteously');
