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
	
SELECT * FROM users;

-- MAX,MIN,COUNT,ROUND,AVG(SACAR PROMEDIO ARITMETICO) y SUM,
SELECT
    COUNT(*) as total_users,
    MIN( followers ) as min_followers,
    MAX( followers ) as max_followers,
    ROUND(AVG( followers )) as avg_followers,
    SUM( followers ) / COUNT(*) as avg_manual 
FROM
    users;