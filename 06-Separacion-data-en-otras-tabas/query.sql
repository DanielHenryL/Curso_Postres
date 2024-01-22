-- Crear tabla continent
CREATE TABLE "public"."continent" (
    "code" serial NOT NULL,
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);
--Insertar informacion a la tabla continent desde country.
INSERT INTO
    continent (name)
SELECT
    DISTINCT continent
FROM
    country
ORDER BY
    continent ASC;

-- Antes de hacer el volcado de la data.
-- Hacer respaldo en una nueva tabla
CREATE TABLE "public"."country_bk" (
    "code" bpchar(3) NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL,
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric(10,2),
    "gnpold" numeric(10,2),
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar(2) NOT NULL,
    PRIMARY KEY ("code")
);
-- Copiar data a la nueva tabla
INSERT INTO country_bk 
	SELECT * FROM country;
	
SELECT * FROM country_bk;

SELECT * FROM country;
-- Eliminamos el Check para poder hacer el cambio
ALTER TABLE country DROP CONSTRAINT "country_continent_check";

