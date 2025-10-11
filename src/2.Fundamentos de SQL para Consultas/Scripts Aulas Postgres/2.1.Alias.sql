-- alias para tabela
SELECT
prod.product_name ,
prod.unit_price ,
prod.units_in_stock
FROM
products  prod
WHERE 
unit_price = 10
OR discontinued = 1

--alias para coluna
SELECT
prod.product_name as "Nome do Produto" ,
prod.unit_price Preço,
prod.units_in_stock Stock
FROM
products prod
WHERE 
unit_price = 10
OR discontinued = 1