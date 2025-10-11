--pedidos por ano
SELECT EXTRACT(YEAR FROM order_date) AS "Ano", 
	COUNT(1) AS "Total de Pedidos"
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date);

