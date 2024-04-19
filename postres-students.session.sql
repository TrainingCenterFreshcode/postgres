CREATE TABLE users_with_emails();

DROP TABLE users, users_with_emails, test;

DROP TABLE products;

-- Як виконати запит: Ctrl + E (2)

/*

char(5): '1234567' -> error, '12' -> '12   '
varchar(5): '1234567' -> error, '12' -> '12'

text -> max 1GB

*/

CREATE TABLE users(
    first_name varchar(64),
    last_name varchar(64),
    biography text
);