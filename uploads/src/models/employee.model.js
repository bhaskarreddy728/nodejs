const {EMPLOYEE} = require("../constants/index")
module.exports=(sequelize,DataTypes) => {
  const EmployeeData = sequelize.define(
    EMPLOYEE,
    {
      id: {
        type: DataTypes.INTEGER(11).UNSIGNED,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
        comment: 'Primary Key'
      },
        employeeName: {
            type: DataTypes.STRING(12),
            allowNull: false,
            comment: 'Populate "id" field value from the same "employee" table '
          },
          employeeEmail:{
          type: DataTypes.STRING(30),
          allowNull:false
          },
          employeePhonenumber: {
            type: DataTypes.INTEGER(),
            allowNull:false
          },
          employeeSummary: {
            type: DataTypes.STRING(),
            allowNull: false
          },
          employeeStatus: {
            type: DataTypes.BOOLEAN(),
            allowNull:false
          }
    },
    {
        timestamps: false,
      tableName: "employee",
      comment: 'Stores employee data'
    }
)
EmployeeData.sync();
  return EmployeeData;
  }