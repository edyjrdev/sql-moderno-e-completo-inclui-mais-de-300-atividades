SELECT C.CustomerName, E.FirstName || ' ' || E.LastName AS EmployeeName, O.OrderDate
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN Employees E ON O.EmployeeID = E.EmployeeID
WHERE strftime('%Y-%m', O.OrderDate) = '1997-01'
ORDER BY O.OrderDate;

