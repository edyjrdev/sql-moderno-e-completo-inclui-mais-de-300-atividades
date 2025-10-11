WITH OrderTotals AS (
    SELECT
        od.OrderID,
        SUM(od.Quantity * p.Price) AS TotalAmount
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY od.OrderID
),
CustomerOrders AS (
    SELECT
        c.CustomerName,
        o.OrderID,
        ot.TotalAmount
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderTotals ot ON o.OrderID = ot.OrderID
    WHERE c.CustomerName = 'Around the Horn'
)
SELECT
    co.CustomerName,
    p.ProductName,
    od.Quantity,
    co.TotalAmount
FROM CustomerOrders co
JOIN OrderDetails od ON co.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
ORDER BY co.TotalAmount DESC;