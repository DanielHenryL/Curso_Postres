-- Unir dos consultas, especialmente para hacer reportes.
SELECT code, name FROM continent WHERE name LIKE '%America'
UNION
SELECT code, name FROM continent WHERE code in (3,5)
ORDER BY name ASC;

-- Unir dos tablas con where
SELECT a.name as pais, b.name as continent FROM country a, continent b
WHERE a.continent = b.code
ORDER BY b.name ASC;
--INNER JOIN
SELECT
    a.name as country,
    b.name as continent
FROM
    country a
    INNER JOIN continent b on a.continent = b.code
ORDER BY
    a.name ASC;
    
-- Alterar secuencia 
ALTER SEQUENCE continent_code_seq RESTART with 9;

-- Full OUTER JOIN
SELECT
    a.name as country,
    a.continent as continent_code,
    b.name as continent
FROM
    country a FULL
    OUTER JOIN continent b on a.continent = b.code ORDER BY a.name DESC;