-- Crear tabla continent
CREATE TABLE "public"."continent" (
    "code" serial NOT NULL,
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);
--Insertar informacion a la tabala continent desde country.
INSERT INTO
    continent (name)
SELECT
    DISTINCT continent
FROM
    country
ORDER BY
    continent ASC;
