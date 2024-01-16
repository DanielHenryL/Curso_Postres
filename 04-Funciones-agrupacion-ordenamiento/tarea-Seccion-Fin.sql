

-- 1. Cuantos usuarios tenemos con cuentas @google.com

SELECT
    COUNT(*) as total
from
    users
where
    email like '%@google.com';
    
-- 2. De qué países son los usuarios con cuentas de @google.com

SELECT
    DISTINCT country
from
    users
where
    email like '%@google.com';
    
-- 3. Cuantos usuarios hay por país (country)

SELECT
    COUNT(*),
    country
FROM
    users
GROUP BY
    country;


-- 4. Listado de direcciones IP de todos los usuarios de Iceland
-- Campos requeridos first_name, last_name, country, last_connection
SELECT
    first_name,
    last_name,
    country,
    last_connection
from
    users
WHERE
    country = 'Iceland';
-- 5. Cuantos de esos usuarios (query anterior) tiene dirección IP
-- que incia en 112.XXX.XXX.XXX
SELECT
    COUNT(*)
from
	users
WHERE
    country='Iceland' AND last_connection LIKE '112%';

SELECT * from users;
-- 6. Listado de usuarios de Iceland, tienen dirección IP
-- que inicia en 112 ó 28 ó 188
SELECT
    username,
    last_connection,
    country
from
    users
where
    country = 'Iceland'
    AND (
        last_connection like '112%'
        OR last_connection LIKE '28%'
        OR last_connection LIKE '188%'
    );


-- 7. Ordene el resultado anterior, por apellido (last_name) ascendente
-- y luego el first_name ascendentemente también
SELECT
	username,
    last_connection,
    last_name,
    first_name
from
    users
where
    country = 'Iceland'
    AND (
        last_connection like '112%'
        OR last_connection LIKE '28%'
        OR last_connection LIKE '188%'
    )
ORDER BY last_name ASC,first_name ASC ;
-- 8. Listado de personas cuyo país está en este listado
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Ordenar los resultados de por País asc, Primer nombre asc, apellido asc
SELECT
    username,
    country
from
    users
WHERE
    country in ('Mexico', 'Peru', 'Costa Rica')
ORDER BY
    country asc,
    first_name asc,
    last_name asc;
-- 9. Del query anterior, cuente cuántas personas hay por país
-- Ordene los resultados por País asc
SELECT
    COUNT(*),
    country
from
    users
WHERE
    country in ('Mexico', 'Peru', 'Costa Rica')
GROUP BY 
	country
ORDER BY
    country asc;
    
    
    
    