--insert
INSERT INTO shippers (shipper_id, company_name, phone) VALUES
(7, 'Speedy Express', '555-1234');

--mais de um registro
INSERT INTO shippers (shipper_id, company_name, phone) VALUES
(8, 'My Package', '555-4556'),
(9, 'Travel With Me', '2344-4522');

--duas colunas
INSERT INTO shippers (shipper_id, company_name) VALUES
(10, 'Lets Go');

--sem colunas
INSERT INTO shippers VALUES
(11, 'Max Speed', '1212-5847');

select * from shippers;

--fk
INSERT INTO orders (
  order_id, customer_id, employee_id, order_date, required_date, shipped_date,
  ship_via, freight, ship_name, ship_address, ship_city, ship_region,
  ship_postal_code, ship_country
)
VALUES (
  11078, 'VINET', 5, '2023-09-05', '2023-10-03', '2023-09-08',
  2, 32.38, 'Vins et alcools Chevalier', '59 rue de lAbbaye', 'Reims', NULL,
  '51100', 'France'
);

select * from employees;

--violaçãode integrade referêncial
INSERT INTO orders (
  order_id, customer_id, employee_id, order_date, required_date, shipped_date, 
  ship_via, freight, ship_name, ship_address, ship_city, ship_region, 
  ship_postal_code, ship_country
) VALUES (
  11079, 'VINET', 10, '2023-09-05', '2023-10-03', '2023-09-08', 
  2, 32.38, 'Vins et alcools Chevalier', '59 rue de lAbbaye', 'Reims', NULL, 
  '51100', 'France'
);
