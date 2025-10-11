--array
--coluna de array
ALTER TABLE products ADD COLUMN tags TEXT[];

--Inserindo 
UPDATE products SET tags = ARRAY['orgânico', 'importado'] WHERE product_id = 5;

SELECT * FROM products 
WHERE product_id = 5; 

-- Adicionando um item 
UPDATE products SET tags = array_append(tags, 'eco-friendly') WHERE product_id = 5;

-- Removendo um item 
UPDATE products SET tags = array_remove(tags, 'importado') WHERE product_id = 5;

-- Consultando um item no array
SELECT product_name,tags FROM products WHERE 'orgânico' = ANY (tags);

ALTER TABLE products DROP COLUMN tags;

--tipo composto
-- Criando um tipo composto
CREATE TYPE product_info AS (
    manufacturer TEXT,
    warranty_period INT
);

-- Adicionando a coluna do tipo
ALTER TABLE products ADD COLUMN additional_info product_info;

-- Inserindo dados 
UPDATE products SET additional_info = ROW('Acme Corp', 24) WHERE product_id = 5;

SELECT * FROM products 
WHERE product_id = 5; 

ALTER TABLE products DROP COLUMN additional_info;


DROP TYPE product_info;
