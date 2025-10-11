--stored procedure
CREATE OR REPLACE PROCEDURE add_product(
   product_id INT, pname VARCHAR, pcategory INT, 
	psupplier INT, pprice NUMERIC, discontinued INT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO products (product_id,product_name, category_id, 
						  supplier_id, unit_price, discontinued)
    VALUES (product_id, pname, pcategory, psupplier, pprice, discontinued);
    COMMIT;
END;
$$;

--execução
CALL add_product(99,'Novo Produto', 5, 1, 19.99,0);

SELECT * FROM products;

DELETE FROM products where product_id = 99;

DROP PROCEDURE add_product;
