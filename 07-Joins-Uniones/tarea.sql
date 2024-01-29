-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?
SELECT
    count(*),
    b.languagecode,
    b.language
FROM
    countrylanguage b
    INNER JOIN country a on a.code = b.countrycode
WHERE
    a.continent = 5
    and b.isofficial is TRUE
GROUP BY
 	b.languagecode,
    b.language
ORDER BY
    count DESC
limit
    1;
    
    
   
-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa
-- (no hacer subquery, tomar el código anterior)

SELECT
	*
FROM
    countrylanguage b
    INNER JOIN country a on a.code = b.countrycode
WHERE
    a.continent = 5
    and b.isofficial is TRUE and b.languagecode = 135;

