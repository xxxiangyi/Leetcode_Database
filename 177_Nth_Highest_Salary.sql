CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT Salary
      FROM (
          SELECT Salary,
          DENSE_RANK() OVER(ORDER BY Salary DESC) AS 'r'
          FROM Employee
      ) e
      WHERE e.r = N
  );
END