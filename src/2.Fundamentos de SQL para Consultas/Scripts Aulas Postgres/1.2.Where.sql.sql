--Básico
SELECT
product_name, unit_price
FROM
products
WHERE 
product_name = 'Geitost';

--Condições <,>,<>,<=,>=,=
SELECT
product_name, unit_price
FROM
products
WHERE 
unit_price > 100;

--Like %
SELECT
product_name, unit_price
FROM
products
WHERE 
product_name like '%Bl%';

--Like _
SELECT
product_name, unit_price
FROM
products
WHERE 
product_name like '%Blay_';

-- ILike: Case Insensitive: b minúsculo
SELECT
product_name, unit_price
FROM
products
WHERE 
product_name ilike '%blay_';

-- Not Like
SELECT
product_name, unit_price
FROM
products
WHERE 
product_name NOT like '%Blay_';

-- Between
SELECT
product_name, unit_price
FROM
products
WHERE 
unit_price BETWEEN 50 AND 100;

-- IN
SELECT
product_name, quantity_per_unit
FROM
products
WHERE 
quantity_per_unit 
IN ('24 - 12 oz bottles','2 kg box');

-- NOT IN
SELECT
product_name, quantity_per_unit
FROM
products
WHERE 
quantity_per_unit 
NOT IN ('24 - 12 oz bottles','2 kg box');

