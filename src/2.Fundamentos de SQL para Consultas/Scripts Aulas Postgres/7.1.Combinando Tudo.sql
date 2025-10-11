SELECT 
    p.category_id AS "ID da Categoria",
    COUNT(p.product_id) AS "Quantidade de Produtos",
    AVG(p.unit_price) AS "Preço Médio",
    MAX(p.unit_price) AS "Preço Máximo"
FROM 
    products p
WHERE 
    p.discontinued = 0 AND 
    p.product_name LIKE 'C%'
GROUP BY 
    p.category_id
HAVING 
    AVG(p.unit_price) > 50
ORDER BY 
    "Quantidade de Produtos" DESC
LIMIT 5;
