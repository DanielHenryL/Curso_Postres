-- Order by y Between
SELECT
    first_name,
    last_name,
    followers
FROM
    users
where
    followers BETWEEN 4600 AND 4700
ORDER BY 
	followers asc;
	