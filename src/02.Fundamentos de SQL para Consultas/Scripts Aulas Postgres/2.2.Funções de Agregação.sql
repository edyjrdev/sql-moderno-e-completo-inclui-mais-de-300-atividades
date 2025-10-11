-- avg
SELECT
AVG(prod.unit_price) "Preço Médio"
FROM
products as prod;

--sum
SELECT
SUM(prod.unit_price) "Soma dos Preços"
FROM
products as prod;

--count
SELECT
COUNT(prod.unit_price) "Quantidade de Produtos"
FROM
products as prod;

--min
SELECT
MIN(prod.unit_price) "Menor Preço"
FROM
products as prod;

--Max
SELECT
MAX(prod.unit_price) "Maior Preço"
FROM
products as prod;


SELECT
AVG(prod.unit_price) "Preço Médio"
FROM
products as prod;

SELECT
AVG(prod.unit_price) "Preço Médio",
AVG(prod.units_in_stock) "Estoque Médio"
FROM
products as prod;

