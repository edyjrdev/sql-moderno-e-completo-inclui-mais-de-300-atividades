--identificar produtos mais vendidos comparados com a média
WITH TotalVendas AS (
    SELECT product_id, SUM(quantity) AS total_quantity
    FROM order_details
    GROUP BY product_id
), MaisVendidos AS (
    SELECT product_id, total_quantity
    FROM TotalVendas
    WHERE total_quantity > (
        SELECT AVG(total_quantity) FROM TotalVendas
    )
)
SELECT p.product_id, p.product_name, mv.total_quantity
FROM products p
JOIN MaisVendidos mv ON p.product_id = mv.product_id
ORDER BY mv.total_quantity DESC;