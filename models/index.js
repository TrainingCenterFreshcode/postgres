const { Client } = require('pg');
const { configs } = require('../configs');
const User = require('./User');

const client = new Client(configs);

User._client = client;
User._tableName = 'users';

module.exports = {
    client,
    User // абсолютно готова до роботи модель
}

/*

Які дії будуть відбуватись в models/index.js (індексі моделей)?

+ 1. Налаштовуємо конфіг підключення до БД
+ 2. Підключення кожної нашої моделі до БД

*/