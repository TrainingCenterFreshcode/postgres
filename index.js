const { User, Product, Order, client } = require('./models');
const { getUsers } = require('./api');
const { generatePhones } = require('./utils');

async function runRequest() {
    await client.connect();

    // Генератор юзерів
    // const usersArray = await getUsers();
    // const response = await User.bulkCreate(usersArray);


    // Генератор товарів
    // const phonesArray = generatePhones(400);
    // const response = await Product.bulkCreate(phonesArray);


    // Генератор замовлень
    const { rows: usersArray } = await User.findAll(); // всі юзери з таблиці users
    const { rows: productsArray } = await Product.findAll(); // всі товари з таблиці products
    const response = await Order.bulkCreate(usersArray, productsArray);

    console.log(response);

    await client.end();
}

runRequest();
