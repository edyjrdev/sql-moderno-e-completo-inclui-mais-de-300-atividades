SELECT c.CategoryName, 
       SUM(p.Price * od.Quantity) FILTER (WHERE od.Quantity > 10) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE o.OrderDate BETWEEN '1997-01-01' AND '1997-03-31'
GROUP BY c.CategoryName
ORDER BY TotalSales DESC;
