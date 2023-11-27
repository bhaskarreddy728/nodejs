const {STUDENT} = require("../constants/index")
module.exports=(sequelize,DataTypes) => {
  const student = sequelize.define(
    STUDENT,
    {
      id: {
        type: DataTypes.INTEGER(11).UNSIGNED,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
        comment: 'Primary Key'
      },
      studentId: {
        type: DataTypes.STRING(12),
        allowNull: false,
        comment: 'Populate "id" field value from the same "student" table '
      },
        studentName: {
            type: DataTypes.STRING(12),
            allowNull: false,
          },
          studentEmail:{
          type: DataTypes.STRING(30),
          allowNull:false
          },
          studentPhonenumber: {
            type: DataTypes.INTEGER(),
            allowNull:false
          },
          studentSummary: {
            type: DataTypes.STRING(),
            allowNull: false
          },
          studentStatus: {
            type: DataTypes.STRING(),
            allowNull:false
          }
    },
    {
        timestamps: false,
      tableName: "student",
      comment: 'Stores student data'
    }
)
student.sync();
  return student;
  }