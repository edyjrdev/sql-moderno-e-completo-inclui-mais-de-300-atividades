SELECT
    o.order_id AS "Código do Pedido",
    o.order_date AS "Data do Pedido",
    p.product_name AS "Produto",
    d.unit_price AS "Preço Unitário",
    d.quantity AS "Quantidade",
    d.discount AS "Desconto"
FROM
    orders o
JOIN order_details d ON o.order_id = d.order_id
JOIN products p ON d.product_id = p.product_id
order by 1
