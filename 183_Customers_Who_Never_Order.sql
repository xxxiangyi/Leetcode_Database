#Solution 1
SELECT c.Name AS 'Customers'
FROM Customers c LEFT JOIN Orders o
ON c.Id = o.CustomerId
WHERE o.CustomerId IS NULL


#Solution 2
SELECT Name AS 'Customers'
FROM Customers
WHERE Id NOT IN 
(
    SELECT CustomerId
    FROM Orders
)