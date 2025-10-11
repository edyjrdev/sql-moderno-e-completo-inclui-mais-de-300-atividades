--produtos cujo preço são maior que a média
SELECT product_name, unit_price 
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products);

--funcionários com pedidos na Alemanha e Brazil
SELECT DISTINCT e.first_name, e.last_name
FROM employees e
WHERE e.employee_id IN (
    SELECT o.employee_id
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    WHERE c.country in ('Germany','Brazil') AND e.employee_id = o.employee_id
);


