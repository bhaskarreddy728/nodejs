const httpStatus = require("http-status");
const moment = require("moment");
const { Ticket, sequelize, People, student } = require("../models");
const ApiError = require("../utils/ApiError");
const { STUDENT_ID_PREFIX } = require("../constants/constantFuctions");
const { db } = require("../config/config");

/**
 * @description Create a new Ticket
 * @param {Object} userBody
 * @returns {Promise<User>} Object
 */
const studentCreateServices = async (userBody) => {
  var queryString = `SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'student' AND table_schema = '${db.name}'`;
  var queryData = await sequelize.query(queryString, {
    type: sequelize.QueryTypes.SELECT,
  });
  var Id = queryData[0].AUTO_INCREMENT.toString();
  var idPrefix = `${STUDENT_ID_PREFIX}${Id.padStart(8, "0")}`;

  return student.create({
    ...userBody,
    studentId: idPrefix,
    createdBy: 0,
  })
    .then((data) => data)
    .catch((err) => {
      throw new ApiError(httpStatus.BAD_REQUEST, err);
    });
};



module.exports = {
  studentCreateServices,
  };