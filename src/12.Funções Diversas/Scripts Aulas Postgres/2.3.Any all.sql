--produtos com preço maior que qualquer produto do fornecedor 1
SELECT product_name, unit_price
FROM products
WHERE unit_price > ANY (SELECT unit_price FROM products WHERE supplier_id = 1);

--produtos cujo preço é maior que todos produtos  do fornecedor 1
SELECT product_name, unit_price
FROM products
WHERE unit_price > ALL (SELECT unit_price FROM products WHERE supplier_id = 1);
