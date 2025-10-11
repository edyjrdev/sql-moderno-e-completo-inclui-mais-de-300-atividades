SELECT product_name, unit_price,
       CASE 
           WHEN unit_price < 10 THEN '$'
           WHEN unit_price BETWEEN 10 AND 20 THEN '$$'
           ELSE '$$$'
       END AS "Categoria de Preços"
FROM products;
