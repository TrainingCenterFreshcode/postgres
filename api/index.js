module.exports.getUsers = async () => {
    const fetchModule = await import('node-fetch');
    const fetch = fetchModule.default;

    const response = await fetch('https://randomuser.me/api?results=10&seed=ONL-JS-PFE2023-2&page=6');
    const data = await response.json();
    return data.results;
}