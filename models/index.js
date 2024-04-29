const { Client } = require('pg');
const { configs } = require('../configs');
const User = require('./User');
const Product = require('./Product');

const client = new Client(configs);

// Фаршируємо модель клієнтом і назвою таблиці

User._client = client;
User._tableName = 'users';

Product._client = client;
Product._tableName = 'products';

module.exports = {
    client,
    User, // абсолютно готова до роботи модель
    Product // абсолютно готова до роботи модель
}

/*

Які дії будуть відбуватись в models/index.js (індексі моделей)?

+ 1. Налаштовуємо конфіг підключення до БД
+ 2. Підключення кожної нашої моделі до БД

*/