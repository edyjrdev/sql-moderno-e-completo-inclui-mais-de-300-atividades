--funcionários com pedidos na Alemanha e Brazil
SELECT DISTINCT e.first_name, e.last_name
FROM Employees e
WHERE EXISTS (
    SELECT order_id
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    WHERE c.country in ('Germany','Brazil') AND e.employee_id = o.employee_id
);