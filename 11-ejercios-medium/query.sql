
CREATE OR REPLACE FUNCTION sayHello(user_name VARCHAR)
RETURNS VARCHAR
LANGUAGE plpgsql
AS 
$$
BEGIN
	RETURN 'Hola ' || user_name;
END;
$$


CREATE OR REPLACE FUNCTION comment_replies( id INTEGER)
RETURNS json
AS
$$

DECLARE result json;
BEGIN
	SELECT
	    json_agg(
	    	json_build_object('user', a.user_id,'comment', a.content )
	    ) INTO result
	FROM
	    comments a
	WHERE
	    a.comment_parent_id = id;
	    
	return result;
END;
$$
LANGUAGE plpgsql;


-- aplicando la funcion en el ejercicio de la tarea 11
SELECT
    b.*,
    comment_replies(b.comment_id)
FROM
    comments b
WHERE
    b.comment_parent_id is null;
    
    