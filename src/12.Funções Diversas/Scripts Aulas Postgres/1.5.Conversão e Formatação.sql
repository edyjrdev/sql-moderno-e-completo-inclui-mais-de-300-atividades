-- Converte o preço unitário para texto
SELECT product_name, CAST(unit_price AS VARCHAR) AS "Preço Unitário"
FROM products;

-- Formata a data do pedido em formato específico
-- FM remove espaços e zeros
SELECT order_id, FORMAT('Pedido feito em %s ', 
		TO_CHAR(order_date, 'FMDay,FMDDth FMMonth, YYYY')) AS "Data Formatada"
FROM orders;
