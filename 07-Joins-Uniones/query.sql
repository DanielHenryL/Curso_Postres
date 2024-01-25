-- Unir dos consultas, especialmente para hacer reportes.
SELECT code, name FROM continent WHERE name LIKE '%America'
UNION
SELECT code, name FROM continent WHERE code in (3,5)
ORDER BY name ASC;

-- Unir dos tablas con where
SELECT a.name as pais, b.name as continent FROM country a, continent b
WHERE a.continent = b.code
ORDER BY b.name ASC;