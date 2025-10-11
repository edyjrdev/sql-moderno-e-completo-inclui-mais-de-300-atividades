SELECT
    p.ProductName,
    c.CategoryName,
    SUM(od.Quantity) OVER (PARTITION BY p.CategoryID ORDER BY o.OrderDate) AS CumulativeQuantity,
    RANK() OVER (PARTITION BY p.CategoryID ORDER BY SUM(od.Quantity) DESC) AS RankInCategory
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE CategoryName = 'Beverages'
GROUP BY od.ProductID, od.OrderID
ORDER BY p.CategoryID, RankInCategory;