CREATE TABLE users(
    first_name varchar(64),
    last_name varchar(64),
    biography text,
    gender varchar(30),
    is_subscribe boolean,
    birthday date,
    foot_size smallint,
    height numeric(5, 2)
);

INSERT INTO users VALUES('John', 'Doe', 'Тут може бути якась неймовірно велика розповідь про Джона', 'male', true, '2004-09-14', 43, 1.75);


INSERT INTO users VALUES
('Susan', 'Doe', 'Тут може бути якась неймовірно велика розповідь про Сьюзан', 'female', true, '1994-09-14', 40, 1.65),
('Peter', 'Doe', 'Тут може бути якась неймовірно велика розповідь про Пітера', 'male', true, '1990-09-14', 46, 1.95);

INSERT INTO users VALUES('Blake', 'Doe', 'Тут може бути якась неймовірно велика розповідь про Блейка', 'male', false, '2004-09-14', NULL, NULL);