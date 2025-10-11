-- Inicia a transação
BEGIN;

-- Insere um novo pedido
INSERT INTO orders (order_id,order_date, customer_id, employee_id)
VALUES (200,'2023-10-05', 'VINET', 5);

-- Insere um detalhe para o pedido
INSERT INTO order_details (order_id, product_id, quantity, unit_price,discount)
VALUES (200, 11, 10, 14.00,0);

-- Tenta selecionar as últimas inserções 
SELECT * FROM orders WHERE order_id = 200;
SELECT * FROM order_details WHERE order_id = 200

-- rollback
ROLLBACK;
COMMIT;
