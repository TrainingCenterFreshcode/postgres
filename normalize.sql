-- 1 НФ: в кожній комірці зберігається атомарне значення (без списків ітп)
-- 2 НФ: 1 НФ + таблиця повинна мати ключ; ключ функціонально визначає всю строку


CREATE TABLE employees( -- BAD PRACTICE; не відповідає 2 НФ
    id serial PRIMARY KEY,
    name varchar(200),
    department varchar(300),
    position varchar(300),
    car_aviability boolean
);
















DROP TABLE employees;

CREATE TABLE employees( -- відповідає 2 НФ
    id serial PRIMARY KEY,
    name varchar(200),
    position varchar(300) REFERENCES positions(name)
);

INSERT INTO employees (name, position) VALUES
('John', 'JS developer'),
('Jane', 'Sales manager'),
('Jake', 'Bodyguard for developers'),
('Andrew', 'Driver');

INSERT INTO employees (name, position) VALUES
('Milena', 'CFO'),
('Sergey', 'CEO'),
('Matthew', 'SMM/PR division'),
('Timofey', 'Accountant');

CREATE TABLE positions( -- відповідає 2 НФ
    name varchar(300) PRIMARY KEY,
    department varchar(300),
    car_aviability boolean
);

INSERT INTO positions (name, car_aviability) VALUES
('JS developer', false),
('Sales manager', false),
('Bodyguard for developers', true),
('Driver', true);

INSERT INTO positions (name, car_aviability) VALUES
('CFO', true),
('CEO', true),
('SMM/PR division', false),
('Accountant', false);


SELECT employees.id, employees.name, employees.position, positions.car_aviability FROM 
employees JOIN positions
ON employees.position = positions.name;