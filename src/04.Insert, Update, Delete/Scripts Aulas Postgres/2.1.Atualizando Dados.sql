--customers
select phone,postal_code from customers
where customer_id = 'ALFKI';

UPDATE customers
SET phone = '555-9999',
postal_code = '12209'
WHERE customer_id = 'ALFKI';

--employees
select title,* from employees
where employee_id = 1;

UPDATE employees
SET title = 'Senior Sales Representative'
WHERE employee_id = 1;

--update sem where
select unit_price from products;

UPDATE products
SET unit_price = unit_price * 1.10;

--orders
Select freight from orders
WHERE order_date BETWEEN '1997-01-21' AND '1997-04-07'
  AND ship_country = 'USA';

UPDATE orders
SET freight = freight * 1.05
WHERE order_date BETWEEN '1997-01-21' AND '1997-04-07'
  AND ship_country = 'USA';

--orders
UPDATE orders
SET ship_address = NULL
WHERE order_id = 11077;

select ship_address from orders
WHERE order_id = 11077;

UPDATE orders
SET ship_address = (SELECT address FROM customers 
					WHERE customer_id = orders.customer_id)
WHERE order_id = 11077;

  





