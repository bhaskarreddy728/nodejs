const { TICKET, PEOPLE } = require("../constants/index");
const { uuid } = require("uuidv4");
module.exports = (sequelize, DataTypes) => {
  const Ticket = sequelize.define(
    TICKET,
    {
      id: {
        type: DataTypes.INTEGER(11).UNSIGNED,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
        comment: 'Primary Key'
      },
      ticketId: {
        type: DataTypes.STRING(12),
        allowNull: false,
        comment: 'Populate "id" field value from the same "tickets" table '
      },
      issueTitle: {
        type: DataTypes.STRING(100),
        allowNull: false,
      },
      ticketCategory: {
        type: DataTypes.STRING(100),
        allowNull: false,
      },
      ticketPriority: {
        type: DataTypes.STRING(100),
        allowNull: false,
      },
      companyDetail: {
        type: DataTypes.STRING(100),
        allowNull: false,
      },
      ticketDescription: {
        type: DataTypes.TEXT,
        allowNull: false,
      },
      ticketIssueImage: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      ticketIssueDoc: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      ticketIssueImageName: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      ticketIssueDocName: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      peopleId: {
        type: DataTypes.STRING,
        allowNull: false,
        required: true,
        comment: 'Populate "id" field value from the same "people" table '
      },
      dateOfCreate: {
        type: DataTypes.DATE(3),
        allowNull: false,
        required: true,
      },
      ticketStatus: {
        type: DataTypes.STRING(100),
        allowNull: false,
      },
      isDeleted: {
        type: DataTypes.TINYINT(1).UNSIGNED,
        defaultValue: 0,
        allowNull: false,
        comment: 'isDeleted value is "0: isVisible", "1: notVisible" on the data'
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
      timestamps: false,
      tableName: "tickets",
      comment: 'Stores tickets data'
    }
  );
  Ticket.sync();
  return Ticket;
};
