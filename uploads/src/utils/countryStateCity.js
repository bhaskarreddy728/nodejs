const fs = require("fs");
const path = require("path");
// const pathData = path.resolve(__dirname + '../mock_data/countries+states+cities.json')
const pathData = path.join(__dirname, '../mock_data/countries+states+cities.json')

const getCountriesData = () => {
    const jsonData = fs.readFileSync(pathData);
    return JSON.parse(jsonData)
}

module.exports = {
    getCountriesData
}