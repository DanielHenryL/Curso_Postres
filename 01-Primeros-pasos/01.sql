--Crear tabla
CREATE TABLE users (
	name VARCHAR(10) UNIQUE
);
-- Insertar valor o valores a la tabla
INSERT INTO
    users (name)
VALUES
    ('Ramires'),
    ('Brenda');
-- Acatulizar registro
UPDATE
    users
SET
    name = 'Daniel'
where
    name = 'Dani';
-- Seleccionar registros
SELECT
    *
FROM
    users
LIMIT 5 
OFFSET 2;

SELECT * FROM users;

-- Clausula where    
SELECT * FROM users where name like '%a_';

-- Eliminar registro
DELETE FROM users where name like '%a_';

DELETE FROM users where name = 'Javier';

-- DROP y TRUNCATE
DROP TABLE users; -- Elimina la tabla y los registros
TRUNCATE TABLE users; -- Elimina los registros menos la tabla

-- Operadores de string y funciones
SELECT
    id,
    UPPER(name) as upper_name,
    LOWER(name) as lower_name, 
    LENGTH(name) ,
    (20 * 2 ) as Nota,
    CONCAT(id ,' ', name ),
    id||' '||name as barcode, 
    name
FROM
    users;


