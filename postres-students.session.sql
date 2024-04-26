-- Ключ - ознака (найчастіше штучна) яка відрізняє один запис у таблиці від іншого
-- Первинний ключ (PRIMARY KEY) - використовується для того, щоб ключу дати обмеження унікальності (UNIQUE) і обмеження NOT NULL
-- Потенційний ключ - стовпець (група стовпців) які могли стати первинним ключем, але ще не обрані як такі.
-- Зовнішній ключ (foreign key) - стовпець (група стовпців) які містять значення, які посилаються на ідентифікатори в інших таблицях
-- Каскадне видалення - якщо ви видаляєте запис у батьківській таблиці, то автоматично будуть видалені всі записи у дочірніх таблицях, які мають посилання на цей видалений запис.
-- Каскадне оновлення - якщо значення у записі батьківської таблиці змінюється, то всі відповідні записи у дочірніх таблицях автоматично змінюються згідно цих змін
/*
 
 
 В таблиці products створити генерований стовпець is_luxury
 
 Якщо price > 800 -> true
 else -> false
 
 */
CREATE TABLE products_version_2(
    id serial PRIMARY KEY,
    brand varchar(256) NOT NULL CHECK(brand != ''),
    model varchar(256) NOT NULL CHECK(model != ''),
    price numeric(8, 2) NOT NULL,
    is_luxury boolean GENERATED ALWAYS AS (price > 800) STORED
);

INSERT INTO products_version_2 (brand, model, price)
VALUES 
('Iphone', '15 Pro', 1300),
('Samsung', 'S10', 400),
('Xiaomi', 'Model 5', 200);


ALTER TABLE products
ADD COLUMN is_luxury boolean GENERATED ALWAYS AS (price > 800) STORED;