--total
SELECT
count(1)  
FROM
suppliers;

--não nulos
SELECT
count(1)  
FROM
suppliers 
WHERE region IS NOT NULL;

--nulos
SELECT
count(1)  
FROM
suppliers 
WHERE region IS NULL;

--não é o mesmo que vazio
SELECT
count(1)  
FROM
suppliers 
WHERE region = '' or region = ' '

--regiões nulas
SELECT
	COALESCE(region, 'N/A') AS region
FROM
Suppliers;

--coalesce
SELECT
	region AS region
FROM
Suppliers;
