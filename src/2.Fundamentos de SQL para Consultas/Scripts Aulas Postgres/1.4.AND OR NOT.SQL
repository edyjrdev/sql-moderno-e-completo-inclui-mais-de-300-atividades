--AND
SELECT
product_name,unit_price,units_in_stock 
FROM
products
WHERE 
unit_price = 11
AND units_in_stock <=5;

--OR
SELECT
product_name,unit_price,units_in_stock 
FROM
products
WHERE 
unit_price = 11
OR units_in_stock <=5;

--NOT
SELECT
product_name,unit_price,units_in_stock 
FROM
products
WHERE 
NOT unit_price = 11;

--AND OR
-- AVALIA PRIMERO AND DEPOIS OR
SELECT
product_name,unit_price,units_in_stock 
FROM
products
WHERE 
unit_price = 10
AND units_in_stock <=5
OR discontinued = 1;

--AND OR
SELECT
product_name,unit_price,units_in_stock 
FROM
products
WHERE 
unit_price = 10
OR units_in_stock <=5
AND discontinued = 1;

--PARENTESES
SELECT
product_name,unit_price,units_in_stock 
FROM
products
WHERE 
unit_price = 10
OR (units_in_stock <=5
AND discontinued = 1);