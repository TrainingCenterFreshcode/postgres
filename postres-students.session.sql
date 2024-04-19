CREATE TABLE users(
    first_name varchar(64) NOT NULL CONSTRAINT first_name_not_empty CHECK (first_name != ''),
    last_name varchar(64) NOT NULL CONSTRAINT last_name_not_empty CHECK (last_name != ''),
    email varchar(64) NOT NULL CONSTRAINT email_not_empty CHECK (email != '') UNIQUE,
    gender varchar(30) NOT NULL CONSTRAINT gender_not_empty CHECK (gender != ''),
    is_subscribe boolean NOT NULL,
    birthday date CHECK (birthday <= current_date),
    foot_size smallint,
    height numeric(5, 2) CONSTRAINT too_high_user CHECK(height < 2.4)
);

DROP TABLE users;

INSERT INTO users VALUES
('Susan', 'Doe', 'brauni14678@gmail.com', 'female', true, '1994-09-14', 40, 1.65),
('Peter', 'Doe', 'fwerty1234@mail.ua', 'male', false, '1990-09-14', 46, 1.95);

INSERT INTO users VALUES
('Draco', 'Doe', 'brauni@gmail.com', 'male', true, NULL, NULL, 2.3);

INSERT INTO users VALUES
('Peter', 'Parker', 'brauni123456789@gmail.com', 'male', true, '2024-04-18', NULL, 2.3);