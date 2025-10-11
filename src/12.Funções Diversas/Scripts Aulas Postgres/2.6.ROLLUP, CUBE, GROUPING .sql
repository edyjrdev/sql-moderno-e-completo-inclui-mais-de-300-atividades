SELECT c.country, EXTRACT(YEAR FROM o.order_date) AS "Ano", 
	SUM(od.quantity * od.unit_price) AS "Total de Vendas"
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY ROLLUP (c.country, EXTRACT(YEAR FROM o.order_date))
order by 1, 3

SELECT c.country, EXTRACT(YEAR FROM o.order_date) AS "Ano", 
	p.category_id, SUM(od.quantity * od.unit_price) AS "Total de Vendas"
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY CUBE (c.country, EXTRACT(YEAR FROM o.order_date), p.category_id)
order by 1,2,3

SELECT c.country, EXTRACT(YEAR FROM o.order_date) AS "Ano", p.category_id, 
	SUM(od.quantity * od.unit_price) AS "Total de Vendas"
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY GROUPING SETS ((c.country, EXTRACT(YEAR FROM o.order_date)), (p.category_id), ())
order by 1,2,3,4
