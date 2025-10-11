SELECT ProductName, Price, CategoryID
FROM Products
WHERE Price > 5
GROUP BY CategoryID
HAVING COUNT(ProductID) >= 3
ORDER BY Price DESC
LIMIT 5;