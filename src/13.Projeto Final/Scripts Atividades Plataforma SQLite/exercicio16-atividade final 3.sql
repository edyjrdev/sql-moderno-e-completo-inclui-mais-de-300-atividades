SELECT ProductName, Price,
CASE 
    WHEN Price <= 10 THEN 'Muito Baixo'
    WHEN Price > 10 AND Price <= 50 THEN 'Médio'
    WHEN Price > 50 AND Price <= 100 THEN 'Alto'    
    WHEN Price > 100 AND Price <= 200 THEN 'Muito Alto'
    ELSE 'Altíssimo'
END AS PriceCategory
FROM Products;