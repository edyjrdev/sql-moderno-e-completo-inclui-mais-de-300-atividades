SELECT
    o.order_id AS "Código do Pedido",
    c.company_name AS "Cliente",
    e.first_name || ' ' || e.last_name AS "Funcionário",
    p.product_name AS "Produto",
    od.unit_price AS "Preço Unitário",
    od.quantity AS "Quantidade",
    od.discount AS "Desconto",
    s.company_name AS "Transportadora",
    o.shipped_date AS "Data de Envio"
FROM
    orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id
LEFT JOIN shippers s ON o.ship_via = s.shipper_id
ORDER BY 1;
