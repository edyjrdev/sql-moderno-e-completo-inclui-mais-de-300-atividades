-- Retorna o número de caracteres no nome do produto
SELECT product_name, LENGTH(product_name) AS "Tamanho"
FROM products;

-- Extrai uma substring do nome do produto
SELECT product_name, SUBSTRING(product_name FROM 1 FOR 5) AS "Abreviatura"
FROM products;

-- Retorna a posição da substring 'Ch' no nome do produto
SELECT product_name, POSITION('Ch' IN product_name) AS "Posição"
FROM products;

-- Remove espaços do início e do fim do nome do cliente
SELECT customer_id, TRIM(company_name) AS "Remove Espaços"
FROM customers;

-- Converte o nome do cliente para maiúsculas
SELECT customer_id, UPPER(company_name) AS "Maísculas",
LOWER(company_name) AS "Minúsculas"
FROM customers;
