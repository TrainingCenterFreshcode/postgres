/*

Задача: порахувати кількість замовлень

*/

CREATE MATERIALIZED VIEW total_orders AS (
    SELECT count(*) AS "загальна кількість замовлень" 
    FROM orders
);

DROP MATERIALIZED VIEW total_orders;

SELECT * FROM total_orders; -- 6956

INSERT INTO orders (customer_id, status)
VALUES (
    6002,
    false
);

REFRESH MATERIALIZED VIEW total_orders;



CREATE FUNCTION refresh_materialized_view()
RETURNS void
AS
$$
BEGIN
    REFRESH MATERIALIZED VIEW total_orders;
END;
$$
LANGUAGE plpgsql;

DROP FUNCTION refresh_materialized_view();


SELECT refresh_materialized_view();