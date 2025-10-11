SELECT P.ProductName, OD.Quantity
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
JOIN Orders O ON OD.OrderID = O.OrderID
WHERE OD.Quantity > (
    SELECT AVG(Quantity)
    FROM OrderDetails
    JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
) 

