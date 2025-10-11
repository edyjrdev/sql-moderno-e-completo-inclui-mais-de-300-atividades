SELECT
    c.CustomerName,
    SUM(od.Quantity * p.Price) AS TotalSales,
    CASE 
        WHEN SUM(od.Quantity * p.Price) <= 1000 THEN 'Baixo'
        WHEN SUM(od.Quantity * p.Price) > 1000 AND SUM(od.Quantity * p.Price) <= 5000 THEN 'Médio'
        ELSE 'Alto'
    END AS SalesCategory
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE c.Country = 'USA'
GROUP BY c.CustomerID
ORDER BY TotalSales DESC;