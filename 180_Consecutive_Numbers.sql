SELECT Num AS 'ConsecutiveNums'
FROM
(
    SELECT DISTINCT Num,
    LEAD(Num, 1) OVER(ORDER BY Id) AS 'lead',
    LAG(Num, 1) OVER(ORDER BY Id) AS 'lag'
    FROM Logs
) n
WHERE Num = n.lead 
AND Num = n.lag
