WITH SalesData AS (
    SELECT
        strftime('%Y-%m', o.OrderDate) AS OrderMonth,
        od.ProductID,
        p.ProductName,
        c.CustomerID,
        c.CustomerName,  
        SUM(od.Quantity * p.Price) AS MonthlyRevenue  
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE o.OrderDate >= '1997-01-01' AND o.OrderDate <= '1997-12-31'
    GROUP BY OrderMonth, od.ProductID, c.CustomerID, c.CustomerName   
),
TopMonths AS (
    SELECT
        ProductID,
        ProductName,
        OrderMonth,
        CustomerName,  
        MonthlyRevenue,
        RANK() OVER (PARTITION BY ProductID ORDER BY MonthlyRevenue DESC) AS RevenueRank
    FROM SalesData
)
SELECT
    ProductName AS "Produto",
    OrderMonth AS "Mês do Pedido",
    CustomerName AS "Cliente", 
    MonthlyRevenue AS "Vendas Mensais"
FROM TopMonths
WHERE RevenueRank <= 3
ORDER BY ProductID, RevenueRank, MonthlyRevenue DESC;