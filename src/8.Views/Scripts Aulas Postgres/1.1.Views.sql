-- view padrão
CREATE VIEW view_padrao AS
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

SELECT * FROM view_padrao;

SELECT "Código do Pedido","Cliente","Funcionário" 
FROM view_padrao
WHERE "Código do Pedido" = 10248

--view materializada
CREATE MATERIALIZED VIEW view_materializada AS
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

SELECT * FROM view_materializada;

SELECT "Código do Pedido","Cliente","Funcionário" 
FROM view_materializada
WHERE "Código do Pedido" = 10248

--view temporaria
CREATE TEMP VIEW view_temporaria AS 
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


SELECT * FROM view_temporaria;
-- drop
DROP VIEW view_padrao;
DROP MATERIALIZED VIEW view_materializada;
DROP VIEW view_temporaria;
