
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

    