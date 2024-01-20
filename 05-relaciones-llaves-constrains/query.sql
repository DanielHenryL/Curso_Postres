-- Agregar la primary key en el campo code
ALTER TABLE country ADD PRIMARY KEY (code);
-- Pretendemos hacer la eliminacion de registro y es recomendable primero hacer la consulta para estar seguro
SELECT * from country where code='NLD' AND code2 ='NA';
-- Eliminar el registro
delete from country where code='NLD' AND code2 ='NA';


-- agregar check(condicion)
ALTER TABLE country ADD CHECK(
	surfacearea >= 0
);

--Eliminando un constraint
ALTER TABLE country ADD CHECK(
	(continent='Asia'::TEXT) or
	(continent='South America'::TEXT) or
	(continent='North America'::TEXT) or
	(continent='Oceania'::TEXT) or
	(continent='Antarctica'::TEXT) or
	(continent='Africa'::TEXT) or
	(continent='Europe'::TEXT) or
	(continent='Central America'::TEXT) 
);

ALTER TABLE country DROP CONSTRAINT  "country_continent_check";

SELECT * from country;

--Crear index para name, tomese que el index es parecido a una llave primaria
CREATE UNIQUE INDEX "unique_country_name" on country(
	name
);

--Crear index para continent
CREATE INDEX "country_continet" on country(
	continent
);

SELECT
    *
FROM
    city
WHERE
    name = 'Jinzhou'
    and countrycode = 'CHN'
    and district = 'Liaoning';

CREATE UNIQUE INDEX "unique_name_countrycode_district" on city(
	name, countrycode, district
);

CREATE INDEX "index_district" on city(
	district
);


-- llave FOREIGN KEY de la tabla city a la tabla country campo countrycode y code, respectivamente.
ALTER TABLE city ADD CONSTRAINT fk_country_code FOREIGN KEY ( countrycode ) REFERENCES country ( code );

--Insert un registro.
INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');
		
-- llave FOREIGN KEY de la tabla countrylanguage a la tabla country campo countrycode y code, respectivamente.
ALTER TABLE countrylanguage ADD CONSTRAINT fk_country_code FOREIGN KEY ( countrycode ) REFERENCES country ( code );

-- Eliminar en cascada
-- llave FOREIGN KEY de la tabla countrylanguage a la tabla country campo countrycode y code, respectivamente.
ALTER TABLE countrylanguage        -- Tabla dependiente
	ADD CONSTRAINT fk_country_code -- NOMBRE DE LA FK
	FOREIGN KEY ( countrycode )    -- campo de la tabla dependiente
	REFERENCES country ( code )    -- referencia de la tabla y campo
	ON DELETE CASCADE;  		   -- Asignar la eliminacion es cuando el registo de la tabla independiente se elimina los campos dependiente tambien son eliminados 	 

DELETE FROM country WHERE code ='AFG';

SELECT * FROM country where code='AFG';
SELECT * FROM city where countrycode='AFG';
SELECT * FROM countrylanguage where countrycode='AFG';
