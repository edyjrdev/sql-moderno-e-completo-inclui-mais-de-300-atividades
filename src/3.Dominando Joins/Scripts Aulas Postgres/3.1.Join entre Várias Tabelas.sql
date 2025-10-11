SELECT
    o.order_id AS "Número do Pedido",
    o.order_date AS "Data do Pedido",
    o.shipped_date AS "Data de Envio",
    c.company_name AS "Cliente",
    e.first_name || ' ' || e.last_name AS "Funcionário",
    s.company_name AS "Transportadora"
FROM
    orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN employees e ON o.employee_id = e.employee_id
LEFT JOIN shippers s ON o.ship_via = s.shipper_id;
