--Permite fazer cálculos específicos em funções de agregação
SELECT 
    SUM(unit_price * quantity) AS "Total de Vendas",
    SUM(unit_price * quantity) FILTER (WHERE unit_price > 20) 
		AS "Total Produtos Mais Caros",
    AVG(quantity) FILTER (WHERE quantity > 10) 
	AS 	"Média de Maiores Vendas"
FROM order_details;

