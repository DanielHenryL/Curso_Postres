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
    
-- GROUP BY
SELECT first_name, last_name, followers
from users
where followers = 4 OR followers = 4999;

SELECT COUNT(*), followers
from users
where followers = 4 OR followers = 4999
GROUP BY followers;

SELECT COUNT(*), followers
from users
where followers BETWEEN 4500 and 4999
GROUP BY followers
ORDER BY followers desc;

-- Having
SELECT
    COUNT(*) as total,
    country
from
    users
GROUP BY
    country
HAVING
    COUNT(*) BETWEEN 4 AND 7
ORDER BY
    count(*) DESC; 
    
-- Distinct( elemntos unicos en el campo country)
SELECT DISTINCT country from users;

-- Group by con otras funciones 
SELECT
    COUNT(*),
    SUBSTRING(email, POSITION('@' IN email) + 1) as domain
FROM
    users
GROUP BY
    SUBSTRING(email, POSITION('@' IN email) + 1)
HAVING 
	count(*) > 1
ORDER BY 
	SUBSTRING(email, POSITION('@' IN email) + 1);

