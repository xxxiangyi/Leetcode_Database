SELECT b.Id
FROM Weather a, Weather b
WHERE DATEDIFF(b.recordDate, a.recordDate) = 1
AND a.Temperature < b.Temperature