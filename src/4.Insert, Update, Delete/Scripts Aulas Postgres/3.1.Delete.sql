DELETE FROM shippers
WHERE shipper_id = 7;

DELETE FROM shippers
WHERE shipper_id between 8 AND 9;

DELETE FROM shippers
WHERE company_name IN ('Lets Go','Max Speed')

DELETE FROM orders
WHERE order_id = 11078 
