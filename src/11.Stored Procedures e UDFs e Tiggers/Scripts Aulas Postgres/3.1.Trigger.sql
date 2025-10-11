--criamos coluna para data de atualização
ALTER TABLE products ADD COLUMN last_updated TIMESTAMP;

SELECT last_updated FROM products limit 1;

--função de atualização
CREATE OR REPLACE FUNCTION update_product_last_updated()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_updated = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--trigger
CREATE TRIGGER product_update_before
BEFORE UPDATE ON products
FOR EACH ROW
EXECUTE FUNCTION update_product_last_updated();

--teste
INSERT INTO products (product_id,product_name, category_id, 
						  supplier_id, unit_price, discontinued)
VALUES (99,'Novo Produto', 5, 1, 19.99,0);

UPDATE products SET unit_price = 12.00 WHERE product_name = 'Novo Produto';

SELECT product_name, last_updated FROM products WHERE product_name = 'Novo Produto';

DROP TRIGGER product_update_before ON products;
DROP FUNCTION update_product_last_updated;
ALTER TABLE products DROP COLUMN last_updated;
DELETE FROM products where product_id = 99;


