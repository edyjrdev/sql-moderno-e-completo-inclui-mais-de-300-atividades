--ROW_NUMBER() atribui numero sequencial a cada linha dentro da partição
--sequenciar os pedidos do cliente por data
SELECT customer_id, order_id, order_date,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) 
	   AS "Sequência"
FROM orders;

--RANK() atribui uma classificação 
--cria ranking de produtos mais vendidos (quantidade)
SELECT od.product_id, p.product_name, SUM(od.quantity) as "Quantidade Total",
       RANK() OVER (ORDER BY SUM(od.quantity) DESC) AS "Ranking"
FROM order_details od
INNER JOIN products p ON (p.product_id = od.product_id)
GROUP BY od.product_id,p.product_name;

--DENSE_RANK() atribui uma classificação dentro da partição
--cria ranking de produtos mais vendidos
--não pula números repetidos
SELECT od.product_id, p.product_name, SUM(od.quantity) as "Quantidade Total",
       DENSE_RANK() OVER (ORDER BY SUM(od.quantity) DESC) AS "Ranking"
FROM order_details od
INNER JOIN products p ON (p.product_id = od.product_id)
GROUP BY od.product_id,p.product_name;

--NTILE cria grupos baseado em algum valor e um n especificado
--dividir fretes em 4 quantis
SELECT order_id, freight,
       NTILE(4) OVER (ORDER BY freight DESC) AS "Quartis"
FROM orders;

--LAG acessa dados da linha anterior 
--compara preço do produto com pedido anterior
SELECT order_id, product_id, unit_price,
       LAG(unit_price, 1) OVER (PARTITION BY product_id ORDER BY order_id) 
	   	AS "Preço Anterior"
FROM order_details;

--LEAD acessa dados da linha seguinte 
--mostra o preço do próximo pedido de um produto
SELECT order_id, product_id, unit_price,
       LEAD(unit_price, 1) OVER (PARTITION BY product_id ORDER BY order_id) 
	   AS "Próximo Preço"
FROM order_details;






