-- Retorna a data e hora atuais
SELECT NOW();

-- Retorna a data atual
SELECT CURRENT_DATE;

-- Extrai o ano da data do pedido
SELECT order_date, 
	   EXTRACT(YEAR FROM order_date) AS "Ano", 
       EXTRACT(MONTH FROM order_date) AS "Mês",
	   EXTRACT(DAY FROM order_date) AS "Dia", 
	   EXTRACT(QUARTER FROM order_date) AS "Trimestre"
FROM orders;

-- Calcula tempo do pedido
SELECT order_id, AGE(order_date, CURRENT_DATE) AS age
FROM orders;

-- Converte string para data
SELECT TO_DATE('20240101', 'YYYYMMDD') AS "Data";

-- Converte data para string
SELECT TO_CHAR(NOW(), 'YYYY-MM-DD') AS "Data";

-- Trabalhando com Zonas Horárias
SELECT order_date,order_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York' 
FROM orders WHERE order_id = 10248;
