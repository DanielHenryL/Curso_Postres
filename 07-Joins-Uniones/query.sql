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

-- Full OUTER JOIN(todo, incluyendo sin match)
SELECT
    a.name as country,
    a.continent as continent_code,
    b.name as continent
FROM
    country a FULL
    OUTER JOIN continent b on a.continent = b.code ORDER BY a.name DESC;
-- RIGTH OUTER JOIN(solo b, sin match)
SELECT
    a.name as country,
    a.continent as continent_code,
    b.name as continent
FROM
    country a
    RIGHT OUTER JOIN continent b on a.continent = b.code
where
    a.continent is NULL
ORDER BY
    b.name ASC;
    
-- Aggregations + join  ****opcion 1
SELECT
    b.name as continent_name,
    COUNT(a.continent) as cant_country
FROM
    country a 
    RIGHT JOIN continent b on a.continent = b.code
GROUP BY
    b.name
ORDER BY
    count(*) ASC;
    
-- Opcion 2 (No recomendada)
(
    SELECT
        COUNT(*),
        b.name as continent_name
    FROM
        country a
        INNER JOIN continent b on a.continent = b.code
    GROUP BY
        b.name
)
UNION
    (
        SELECT
            0 as count,
            b.name
        FROM
            country a
            RIGHT JOIN continent b on a.continent = b.code
        WHERE
            a.continent is NULL
        GROUP BY
            b.name
    )
ORDER BY
    count;
-- tarea
(
    SELECT
        count(a.name),
        b.name as contient
    FROM
        country a
        INNER JOIN continent b on a.continent = b.code
    WHERE
        b.name NOT LIKE ('%America')
    GROUP BY
        b.name
)
UNION
(
    SELECT
        count(a.name),
        'America' as continent
    FROM
        country a
        INNER JOIN continent b on (
            a.continent = b.code
            and b.name like '%America'
        )
)
ORDER BY
    count ASC;  
   
-- Tarea 
-- Quiero que em muestre el pais con mas ciudades
-- Campos: Total de ciudades y el nombre del pais
SELECT
    count(a.name) as total,
    a.name as country
from
    country a
    INNER JOIN city b on a.code = b.countrycode
GROUP BY
    a.name
ORDER BY
    total DESC
LIMIT
    1; 
