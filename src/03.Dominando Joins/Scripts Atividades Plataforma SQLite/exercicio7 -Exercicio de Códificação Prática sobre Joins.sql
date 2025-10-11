SELECT 
    p.ProductName,
    c.CategoryName,
    cu.CustomerName,
    cu.Country,
    e.FirstName || ' ' || e.LastName AS EmployeeName,
    o.OrderDate
FROM Orders o
JOIN Customers cu ON o.CustomerID = cu.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE 
     cu.Country = 'USA';