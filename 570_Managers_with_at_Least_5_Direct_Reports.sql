SELECT b.Name
FROM Employee a, Employee b
WHERE a.ManagerId = b.Id
GROUP BY a.ManagerId
HAVING COUNT(a.ManagerId) >= 5