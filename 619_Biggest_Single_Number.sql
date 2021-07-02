#Solution 1
SELECT MAX(num) AS 'num'
FROM
(
    SELECT num
    FROM my_numbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS n


#Solution 2
SELECT
IFNULL((
    SELECT num
    FROM my_numbers
    GROUP BY num
    HAVING COUNT(*) = 1
    ORDER BY num DESC
    LIMIT 1), NULL) AS 'num'