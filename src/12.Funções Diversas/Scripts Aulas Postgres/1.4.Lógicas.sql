-- Retorna o primeiro valor não-nulo da lista
SELECT order_id, COALESCE(ship_region, 'N/A') AS "Região"
FROM orders;

-- Retorna null se o preço unitário é igual a 11, senão retorna o preço
SELECT product_id,unit_price, NULLIF(unit_price,11) AS "Preço Unitário"
FROM products;

-- Retorna o maior 
SELECT product_id,unit_price, GREATEST(unit_price, 20) AS "Preço Unitário"
FROM products;

-- Retorna o menor 
SELECT product_id,unit_price, LEAST(unit_price, 20) AS "Preço Unitário"
FROM products;

