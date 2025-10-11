SELECT ProductName, Price, CategoryID
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);