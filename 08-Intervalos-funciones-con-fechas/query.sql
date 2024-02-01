
--Fechas funciones basicas
SELECT
    now(),
    CURRENT_DATE,
    CURRENT_TIME,
    date_part('hours', now() ) as hours,
    date_part('minutes', now() ) as minutes,
    date_part('seconds', now() ) as seconds,
    date_part('days', now() ) as days,
    date_part('months', now() ) as months,
    date_part('years', now() ) as years;
    
-- Consultas sobre fechas

--01
SELECT
    *
FROM
    employees
WHERE
    hire_date > '1998-02-05'
ORDER BY
    hire_date DESC;
    
--02  
SELECT
    MAX(hire_date) as mas_nuevo,
    MIN(hire_date) as mas_antiguo
FROM
    employees;
    
--03
SELECT
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1999-01-01'
    AND '2001-01-04'
ORDER BY
    hire_date DESC;
    
-- Intervalos
SELECT
    MAX(hire_date) as days,
    MAX(hire_date) + INTERVAL '1 days' as day,
    MAX(hire_date) + INTERVAL '3 months' as month,
    MAX(hire_date) + INTERVAL '1 years' as years,
    MAX(hire_date) + INTERVAL '1 years' + INTERVAL '1 month' as oferta,
    date_part('years', now()),
    MAKE_INTERVAL( YEARS := date_part('year', now())::INTEGER )
    
FROM
    employees;
-- Fechas y actualizaciones
SELECT
    hire_date,
    MAKE_INTERVAL(
        YEARS := 2024 - EXTRACT(
            YEARS
            FROM
                hire_date
        ) :: INTEGER
    ),
    MAKE_INTERVAL(
        YEARS := date_part('years', CURRENT_DATE) :: INTEGER - EXTRACT(
            YEARS
            FROM
                hire_date
        ) :: INTEGER
    )
FROM
    employees
ORDER BY
    hire_date DESC;
    
-- tarea: sumar el añoa actual al campo hire_date de todos los employees
-- Probar el query antes de actualizarlo
SELECT
    hire_date,
    hire_date + INTERVAL '24 years' as update_date
FROM
    employees;
-- Actualizar bd
UPDATE
    employees
SET
    hire_date = hire_date + INTERVAL '24 years';
    
-- Clausula case y then    
SELECT
    first_name,
    last_name,
    hire_date,
    CASE
    	when hire_date > now() - INTERVAL '1 year' THEN '1 año o menos'
    	when hire_date > now() - INTERVAL '3 year' THEN '1 a 3 años'
    	when hire_date > now() - INTERVAL '6 year' THEN '3 a 6 años'
   	ELSE '+ de 6 años' 	

    END as rango_atiguedad
FROM
    employees
ORDER BY
    hire_date DESC;
	