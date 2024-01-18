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

SELECT * from country WHERE code='CRI';
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

