const { tokenTypes } = require('../config/tokens');
const { USER, TOKEN } = require("../constants/tables")

module.exports = (sequelize, DataTypes) => {
  const Token = sequelize.define(
    TOKEN,
    {
      id: {
        type: DataTypes.INTEGER(11).UNSIGNED,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
        comment: 'Primary Key'
      },
      token: {
        type: DataTypes.STRING,
        required: true,
        index: true,
      },
      userId: {
        type: DataTypes.INTEGER(11).UNSIGNED,
        allowNull: false,
        reference: {
          model: USER,
          key: 'userId'
        },
        require: true,
        comment: 'Populate "id" field value from "users" table'
      },
      tokenType: {
        type: DataTypes.ENUM,
        values: [tokenTypes.REFRESH, tokenTypes.RESET_PASSWORD, tokenTypes.VERIFY_EMAIL],
        allowNull: false,
        required: true,
      },
      expires: {
        type: DataTypes.DATE,
        allowNull: false,
        required: true,
      },
      blacklisted: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
        allowNull: false
      },
      createdBy: {
        type: DataTypes.INTEGER(11).UNSIGNED,
        allowNull: false,
        comment: 'Primary Key of "user_masters" table'
      },
      createdAt: {
        type: DataTypes.DATE(3),
        defaultValue: sequelize.literal('CURRENT_TIMESTAMP(3)')
      },
      updatedBy: {
        type: DataTypes.INTEGER(11).UNSIGNED,
        allowNull: true,
        comment: 'Primary Key of "user_masters" table'
      },
      updatedAt: {
        type: DataTypes.DATE(3),
        defaultValue: sequelize.literal('CURRENT_TIMESTAMP(3)')
      }
    },
    {
      tableName: "tokens",
      timestamps: false,
      comment: 'Stores tokens data'
    },
  );
  Token.associate = function (models) {

  };
  Token.sync();
  return Token;
};
