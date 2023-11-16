const fs = require("fs");
const path = require("path");
const Sequelize = require("sequelize");
const { sequelize } = require("../config/db");
// require('dotenv').config();
const basename = path.basename(__filename);
const db = {};

fs.readdirSync(__dirname)
  .filter(
    (file) =>
      file.indexOf(".") !== 0 && file !== basename && file.slice(-3) === ".js"
  )
  .forEach((file) => {
    const model = require(path.join(__dirname, file))(
      sequelize,
      Sequelize.DataTypes
    );
    console.log(model, "model");
    db[model.name] = model;
  });

Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

// relationships for models
// Define all relationships here below

db.User = require("./user.model")(sequelize, Sequelize.DataTypes);
db.Token = require("./token.model")(sequelize, Sequelize.DataTypes);

db.Employee = require("./employee.model")(sequelize,Sequelize.DataTypes);
db.student = require("./student.model")(sequelize,Sequelize.DataTypes);
db.Ticket = require("./ticket.model")(sequelize, Sequelize.DataTypes);




//db.User.hasOne(db.Token, { foreignKey: "userId", targetKey: "id" });
//Expenses relationship

//People relationship


//Contact relationship
//db.User.hasMany(db.Contact, { foreignKey: "userId", targetKet: "id" });

//Testimonial relationship


// db.Investment.belongsTo(db.expenses_payment_method , {foreignKey : 'paymentType' , targetKey : 'id'});
// db.expenses_payment_method.hasOne(db.Investment , {foreignKey : 'paymentType' ,targetKey : 'id' });

// db.Investment.belongsTo(db.business_list_master , {foreignKey : 'companyName' , targetKey : 'id'});
// db.business_list_master.hasOne(db.Investment , {foreignKey : 'companyName' ,targetKey : 'id' });

// // Ticket relationship
// db.Ticket.belongsTo(db.People, { foreignKey: 'assign', targetKey: 'id'});
// db.People.hasOne(db.Ticket, { foreignKey: 'assign', targetKey: 'id'});

module.exports = db;
