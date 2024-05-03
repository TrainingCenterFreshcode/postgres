SELECT * FROM users;


--------


SELECT id, first_name, last_name, email FROM users;



-----------


SELECT id, first_name, last_name, email FROM users
WHERE id > 5995;



SELECT first_name, last_name FROM users
WHERE gender = 'female';


SELECT email FROM users
WHERE is_subscribe = true;

SELECT email FROM users
WHERE is_subscribe;


-----------



/*

Задача: знайти всіх користувачів, у яких висота (height) не NULL

*/

SELECT * FROM users
WHERE height IS NOT NULL;


/*

Задача: знайти всіх користувачів, які не підписались на розсилку

*/

SELECT first_name, last_name, email, is_subscribe FROM users
WHERE is_subscribe IS false;



--------------------------

SELECT first_name, last_name, email FROM users
WHERE first_name = 'William';

/*

У нас є діапазон імен ('William', 'John', 'Jason')
Задача: знайти всіх юзерів, які входять у цей діапазон

*/

SELECT first_name, last_name, email FROM users
WHERE first_name IN ('William', 'John', 'Jason');


--------------------------


/*

Задача: знайти всіх юзерів, у яких id між 4100 і 4200

*/

-- варіант 1
SELECT first_name, last_name, id FROM users
WHERE id >= 4100 AND id <= 4200;


--варіант 2
SELECT first_name, last_name, id FROM users
WHERE id BETWEEN 4100 AND 4200;


--------------------------


/*

Задача: Знайти всіх юзерів, ім'я яких починається на букву 'К'

% - будь-яку кількість будь-яких символів
_ - 1 будь-який символ

*/

SELECT first_name, last_name FROM users
WHERE first_name LIKE 'K%';

/*

Задача: Знайти всіх юзерів, у яких рівно 8 символів у імені

*/

SELECT first_name, last_name FROM users
WHERE first_name LIKE '________';


/*

Задача: знайти всіх юзерів, у яких ім'я складається з 3 символів і починається на букву 'A'

*/

SELECT first_name, last_name FROM users
WHERE first_name LIKE 'A__';


/*

Задача: Знайти всіх юзерів, у яких ім'я закінчується на літеру 'f'

*/

SELECT first_name, last_name FROM users
WHERE first_name LIKE '%f';



---------------------------


ALTER TABLE users
ADD COLUMN weight int CHECK(weight != 0 AND weight > 0);

--------------------------

UPDATE users
SET weight = 60;

--------------------------

UPDATE users
SET weight = 100
WHERE id BETWEEN 4000 AND 5000;

--------------------------

UPDATE users
SET weight = 95
WHERE id = 4040;


SELECT * FROM users
WHERE id = 4040;


/*

ДЗ.

+ 1. Потрібно створити невеличку таблицю співробітників (employees):
    - id
    - name
    - salary
    - work_hours    (кількість відпрацьованих за місяць годин)

+ 2. Вставити дані (INSERT) про 3-х співробітників

3. Всім співробітникам, які відпрацювали за місяць більше 150 годин, збільшити зарплату на 20% (UPDATE)

*/

--- 1

CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK(name != ''),
    salary int NOT NULL CHECK(salary >= 0),
    work_hours int NOT NULL CHECK(work_hours >= 0)
);

--- 2

INSERT INTO employees(name, salary, work_hours) VALUES
('Ivanov', 400, 80),
('Petrov', 750, 185),
('Sidorov', 0, 0);


--- 3 

UPDATE employees
SET salary = salary * 1.2
WHERE work_hours > 150;



-----

INSERT INTO users (first_name, last_name, email, gender, birthday, is_subscribe) VALUES
('Test', 'Testovich', 'test@gmail.com', 'gender', '1800-12-12', false) RETURNING *;


SELECT * FROM users
WHERE id = 6001;

DELETE FROM users
WHERE id = 6001;



-------------------

-- Задача: вивести всіх користувачів з інфою про них + вік


SELECT id, first_name, last_name, birthday, extract("years" from age(birthday)) FROM users;


UPDATE users
SET birthday = '2005-01-01'
WHERE (gender = 'female' AND is_subscribe);


----------------
-- make_interval([years], [months], [days]) - функція, яка створює власний інтервал

SELECT id, first_name, last_name, make_interval(40, 8) FROM users;


-----------

-- Аліаси - псевдоніми
-- Якщо кирилиця - обов'язково беріть у лапки
-- Якщо латиниця - можна і з лапками і без лапок
SELECT first_name AS "Ім'я", last_name AS "Прізвище", id AS "Особистий номер" FROM users;


SELECT id, first_name, last_name, birthday, extract("years" from age(birthday)) AS years FROM users
WHERE extract("years" from age(birthday)) BETWEEN 2 AND 10;

SELECT id, first_name, last_name, birthday, extract("years" from age(birthday)) AS "years old" FROM users
WHERE extract("years" from age(birthday)) BETWEEN 2 AND 10;


-----------------

/*

Пагінація - спосіб розділити великий об'єм інформації на менші частини

1) Нам потрібні сторінки
2) Нам потрібно знати, яка кількість результатів буде відображатись на кожній сторінці

*/

-- LIMIT - задає кількість результатів, яку я хочу отримати
--          (кількість результатів на сторінці)

SELECT * FROM users
LIMIT 50
OFFSET 200; -- 50 * 4

-- Як нам дізнатись, скільки потрібно відступати (формула для розрахунку OFFSET)
/*

У цій формулі, перша сторінка буде вважатись нульовою

OFFSET = LIMIT * сторінку_яку_ми_запитуємо - 1

*/



--------------------


SELECT id, first_name || ' ' || last_name AS "full name", gender, email FROM users;

SELECT id, concat(first_name, ' ', last_name) AS "full name", gender, email FROM users;


/*

Задача: Знайти всіх користувачів, повне ім'я яких (ім'я + прізвище) < 10 символів


*/

-- варіант 1

SELECT id, concat(first_name, ' ', last_name) AS "full name", gender, email FROM users
WHERE char_length(concat(first_name, ' ', last_name)) < 10;


-- варіант 2
SELECT * FROM -- основний запит
( -- підзапит
    SELECT id, concat(first_name, ' ', last_name) AS "full name", gender, email FROM users
) AS "FN"
WHERE char_length("FN"."full name") < 10; -- фільтрація відбувається у основному запиті



/*


Створити таблицю workers:
- id
- name
- salary
- birthday

*/

CREATE TABLE workers(
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL CHECK (name != ''),
    salary int NOT NULL CHECK (salary >= 0),
    birthday date NOT NULL CHECK (birthday < current_date)
);

/*

1. Додайте робітника з ім'ям Олег, з/п 300

*/

INSERT INTO workers(name, salary, birthday) VALUES
('Oleg', 300, '1968-03-26');

/*

2. Додайте робітницю Ярославу, з/п 500

*/

INSERT INTO workers(name, salary, birthday) VALUES
('Jaroslava', 500, '1958-09-12');


/*

3. Додайте двох нових працівників одним запитом -
Сашу, з/п 1000
Машу, з/п 200

*/

INSERT INTO workers(name, salary, birthday) VALUES
('Sasha', 1000, '1990-12-30'),
('Masha', 200, '1985-11-01');

/*

4. Встановити Олегу з/п 500

*/

UPDATE workers
SET salary = 500
WHERE id = 1;

/*

5. Всім, у кого з/п більше 500, врізати з/п до 400

*/

UPDATE workers
SET salary = 400
WHERE salary > 500;

/*

6. Вибрати (SELECT) всіх робітників, чия з/п більше 400

*/

SELECT * FROM workers
WHERE salary > 400;

/*

7. Вибрати робітника з id = 4

*/

SELECT * FROM workers
WHERE id = 4;

/*

8. Дізнатися (SELECT) з/п та вік Олега

*/

SELECT *, extract('years' from age(birthday)) FROM workers
WHERE id = 1;

/*

9. Спробувати знайти робітника з ім'ям "Jaroslava"

*/

SELECT * FROM workers
WHERE name = 'Jaroslava';


/*

10. Вибрати робітників у віці 30 років АБО з з/п > 800
WHERE _кількість_років_ = 30 OR salary > 800;

*/

SELECT * FROM workers
WHERE extract('years' from age(birthday)) = 30 OR salary > 800;

/*

11. Вибрати всіх робітників у віці від 25 до 28 років

*/

SELECT *, extract('years' from age(birthday)) AS "age" FROM workers
WHERE extract('years' from age(birthday)) BETWEEN 25 AND 28;

/*

12. Вибрати всіх співробітників, що народились у вересні

*/

SELECT *, extract('month' from birthday) FROM workers
WHERE extract('month' from birthday) = 9;

/*

13. Видалити робітника з id = 4

*/

DELETE FROM workers
WHERE id = 4;

/*

14. Видалити Олега

*/

DELETE FROM workers
WHERE name = 'Oleg';

/*

15. Видалити всіх робітників старших за 30 років

*/

DELETE FROM workers
WHERE extract('years' from age(birthday)) > 30;



--- Агрегатні функції - функції, які виконують якусь операцію над групою рядків і повертають одне-єдине значення
-- COUNT, SUM, AVG, MIN, MAX

SELECT max(weight) FROM users;

SELECT min(weight) FROM users;

SELECT sum(weight) FROM users;

SELECT avg(weight) FROM users;

-- Підрахувати кількість записів в таблиці

SELECT count(id) FROM users;

-- Знайти середню вагу чоловіків і жінок. Окремо чоловіків, окремо жінок

SELECT gender, avg(weight) FROM users
GROUP BY gender;

/* ОСЬ ТУТ БУДЕ ПОМИЛКА! Запитувати в SELECT ми можемо тільки ті стовпці, які приймають участь у групуванні
SELECT id, gender, avg(weight) FROM users
GROUP BY gender;
*/

-- Знайти середню вагу чоловіків

SELECT avg(weight) FROM users
WHERE gender = 'male';


-- Знайти середню вагу всіх користувачів, старших за 10 років

SELECT avg(weight) FROM users
WHERE extract('years' from age(birthday)) > 10;


SELECT brand, avg(price) FROM products
GROUP BY brand;


-- Сортування - впорядкування даних за якимись ознаками

-- ASC - за збільшенням (default)
-- DESC - за зменшенням

SELECT * FROM users
ORDER BY birthday ASC,
            first_name ASC;

UPDATE users
SET birthday = '2002-09-14'
WHERE id BETWEEN 4038 AND 4046;

-- Вивести топ-3 телефони, яких в нас залишилось найменше

SELECT * FROM products
ORDER BY quantity ASC
LIMIT 3;



-- Фільтрація груп

/*

Знайти кількість користувачів у кожній віковій групі

*/

SELECT count(*) AS "кількість", extract('years' from age(birthday)) AS "вікова група"
FROM users
GROUP BY "вікова група"
ORDER BY "вікова група";

/*

Модифікувати запит таким чином, щоб залишились тільки вікові групи, де < 500 користувачів

*/

SELECT count(*), extract('years' from age(birthday)) AS "вікова група"
FROM users
GROUP BY "вікова група"
HAVING count(*) < 500;