const { Client } = require('pg');

const configs = {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'postgres',
    database: 'students',
};

const client = new Client(configs);

async function runRequest() {
    await client.connect();

    const response = await client.query(
        `INSERT INTO users (first_name, last_name, email, is_subscribe, gender) VALUES
        ('Iron', 'Man', 'tonystart@gmail.com', true, 'male');`
    );
    console.log(response);

    await client.end();
}

runRequest();
