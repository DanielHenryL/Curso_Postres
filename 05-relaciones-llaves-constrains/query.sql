-- Agregar la primary key en el campo code
ALTER TABLE country ADD PRIMARY KEY (code);
-- Pretendemos hacer la eliminacion de registro y es recomendable primero hacer la consulta para estar seguro
SELECT * from country where code='NLD' AND code2 ='NA';
-- Eliminar el registro
delete from country where code='NLD' AND code2 ='NA';


SELECT * from country;
-- agregar check(condicion)
ALTER TABLE country ADD CHECK(
	surfacearea >= 0
);



