SELECT * FROM users
WHERE gender IS NULL;


ALTER TABLE orders
ADD COLUMN status boolean;



UPDATE orders
SET status = true
WHERE id % 2 = 0;

UPDATE orders
SET status = false
WHERE id % 2 = 1;


SELECT id, created_at, customer_id, status AS order_status FROM orders;


--- 1 syntax CASE

/*
CASE
    WHEN condition1 = true
    THEN result1
    WHEN condition2 = true
    THEN result2
    ...
    ELSE result3
END;
*/

-- Вивести всі замовлення, там де статус true - написати "виконано", де false - написати "нове"

SELECT id, created_at, customer_id, status, (
    CASE
    WHEN status = TRUE
    THEN 'виконано'
    WHEN status = FALSE
    THEN 'нове'
    ELSE 'інший статус'
    END
) AS order_status
FROM orders
ORDER BY id;


-- 2 syntax CASE

/*
    CASE condition WHEN value1 THEN result1
                    WHEN value2 THEN result2
                    ...
        ELSE default_result
    END;
*/

-- Витягти місяць народження юзера і на його основі вивести, народився восени, навесні, влітку чи взимку

SELECT *, (
    CASE extract('month' from birthday)
        WHEN 1 THEN 'winter'
        WHEN 2 THEN 'winter'
        WHEN 3 THEN 'spring'
        WHEN 4 THEN 'spring'
        WHEN 5 THEN 'spring'
        WHEN 6 THEN 'summer'
        WHEN 7 THEN 'summer'
        WHEN 8 THEN 'summer'
        WHEN 9 THEN 'fall'
        WHEN 10 THEN 'fall'
        WHEN 11 THEN 'fall'
        WHEN 12 THEN 'winter'
        ELSE 'unkown'
    END
) AS "пора року" FROM users;