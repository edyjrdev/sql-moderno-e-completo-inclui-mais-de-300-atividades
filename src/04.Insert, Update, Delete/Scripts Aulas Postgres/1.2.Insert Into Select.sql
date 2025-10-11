select supplier_id, company_name, phone from suppliers
where company_name = 'Escargots Nouveaux';

select * from shippers;

INSERT INTO shippers (shipper_id, company_name, phone)
SELECT supplier_id, company_name, phone
from suppliers
where company_name = 'Escargots Nouveaux'