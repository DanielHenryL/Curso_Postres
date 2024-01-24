-- Unir dos consultas, especialmente para hacer reportes.
SELECT code, name FROM continent WHERE name LIKE '%America'
UNION
SELECT code, name FROM continent WHERE code in (3,5)
ORDER BY name ASC;