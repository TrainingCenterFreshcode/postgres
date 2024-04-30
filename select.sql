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

Задача: Знайти всіх юзерів, у яких рівно 5 символів у імені

*/

SELECT first_name, last_name FROM users
WHERE first_name LIKE '_____';


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

1. Потрібно створити невеличку таблицю співробітників (employees):
    - id
    - name
    - salary
    - work_hours    (кількість відпрацьованих за місяць годин)

2. Вставити дані (INSERT) про 3-х співробітників

3. Всім співробітникам, які відпрацювали за місяць бульше 150 годин, збільшити зарплату на 20%

*/
