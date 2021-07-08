#Solution 1
SELECT d.Name AS 'Department', e.Name AS 'Employee', e.Salary
FROM 
(
    SELECT *, 
    DENSE_RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary DESC) AS 'r'
    FROM Employee
) e
RIGHT JOIN Department d 
ON e.DepartmentId = d.Id
WHERE e.r = 1


#Solution 2
SELECT d.Name AS 'Department', e.Name AS 'Employee', e.Salary
FROM Employee e RIGHT JOIN Department d 
ON e.DepartmentId = d.Id
WHERE (e.Salary, e.DepartmentId) IN
(
    SELECT MAX(Salary), DepartmentId
    FROM Employee
    GROUP BY DepartmentId
)
