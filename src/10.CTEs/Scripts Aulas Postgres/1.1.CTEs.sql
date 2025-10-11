--total do pedido, com cliente
WITH PedidoSoma AS (
    SELECT order_id, SUM(unit_price * quantity) AS total_price
    FROM order_details
    GROUP BY order_id
)
SELECT o.order_id, o.customer_id, p.total_price
FROM orders o
JOIN PedidoSoma p ON o.order_id = p.order_id
ORDER BY total_price DESC;

