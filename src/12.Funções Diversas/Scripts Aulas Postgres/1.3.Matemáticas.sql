-- Arredonda 
SELECT  unit_price, quantity,unit_price * quantity AS "Total",
	ROUND((unit_price * quantity)::numeric, 2) 
	AS "Total Arredondado"
FROM order_details;

-- Retorna o menor inteiro
SELECT product_name,unit_price, CEILING(unit_price) AS "Preço Inteiro"
FROM products;

-- Retorna o valor absoluto da mudança 
SELECT product_id,unit_price, ABS(unit_price - 20) AS "Mudança de Preço"
FROM products;

-- Gera um número aleatório 
SELECT product_id, RANDOM() AS "Número Aleatório"
FROM products;
