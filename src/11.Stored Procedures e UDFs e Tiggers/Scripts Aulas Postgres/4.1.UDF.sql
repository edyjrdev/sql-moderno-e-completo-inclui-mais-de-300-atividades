CREATE OR REPLACE FUNCTION total_order_price(o_id INT)
RETURNS NUMERIC AS $$
DECLARE
    total_price NUMERIC;
BEGIN
    SELECT SUM(unit_price * quantity)
    INTO total_price
    FROM order_details
    WHERE order_id = o_id;
    RETURN total_price;
END;
$$ LANGUAGE plpgsql;


SELECT o.order_id, total_order_price(o.order_id)
FROM ORDERS o;
