--order by
SELECT
product_id,product_name, unit_price
FROM
products
order by unit_price;

--decrescente
SELECT
product_id,product_name, unit_price
FROM
products
order by unit_price desc

--asc padrão
SELECT
product_id,product_name, unit_price
FROM
products
order by unit_price asc;

--limit
SELECT
product_id,product_name, unit_price
FROM
products
limit 5;

--order by, limit
SELECT
product_id,product_name, unit_price
FROM
products
order by unit_price desc
limit 5;

--offset  primeiro 5
SELECT
product_id,product_name, unit_price
FROM
products
order by unit_price desc
limit 5

--offset próximos 5
SELECT
product_id,product_name, unit_price
FROM
    products
ORDER BY unit_price DESC
LIMIT 5 OFFSET 5;

--próximos 5
SELECT
product_id,product_name, unit_price
FROM
    products
ORDER BY unit_price DESC
LIMIT 5 OFFSET 10;

--próximos 5
SELECT
product_id,product_name, unit_price
FROM
    products
ORDER BY unit_price DESC
LIMIT 5 OFFSET 15;


--20 produtos
SELECT
product_id,product_name, unit_price
FROM
products
order by unit_price desc
limit 20

--mais de uma coluna
select 
product_id,units_in_stock, unit_price
from 
products
order by units_in_stock asc, unit_price desc