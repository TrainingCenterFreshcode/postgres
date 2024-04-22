-- Ключ - ознака (найчастіше штучна) яка відрізняє один запис у таблиці від іншого
-- Первинний ключ (PRIMARY KEY) - використовується для того, щоб ключу дати обмеження унікальності (UNIQUE) і обмеження NOT NULL


/* Первинні ключі на два стовпці */

CREATE TABLE coordinates(
    x int,
    y int,
    z int,
    CONSTRAINT "unique_coord" PRIMARY KEY(x, y, z)
);

-- (111, 22, 36);
-- (252, 76, 88);
-- (111, 22, 36); <<---- ТУТ МАЄ ПОВЕРНУТИСЬ ПОМИЛКА

INSERT INTO coordinates VALUES
(111, 22, 36),
(252, 76, 88);

INSERT INTO coordinates VALUES
(111, 22, 36); -- ТУТ ПОВЕРНУЛАСЬ ПОМИЛКА =)

INSERT INTO coordinates VALUES
(123, 456, 789),
(33, 722, 999);