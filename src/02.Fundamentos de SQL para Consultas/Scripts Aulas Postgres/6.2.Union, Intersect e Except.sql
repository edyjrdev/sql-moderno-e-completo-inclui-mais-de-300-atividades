--union, sem duplicados
select distinct region from suppliers
union 
select distinct region from customers 

-- union all, incluindo duplicatas
select distinct region from suppliers
union all
select distinct region from customers 

--INTERSECT retorna as linhas que são resultados comuns 
select distinct region from suppliers
INTERSECT
select distinct region from customers 

--EXCEPT retorna as linhas da primeira consulta que não existem na segunda
select distinct region from suppliers
EXCEPT
select distinct region from customers;
--
select distinct region from customers
EXCEPT
select distinct region from suppliers;