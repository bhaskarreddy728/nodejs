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
// //const studentCreateServices = async (userBody) => {
//   //var queryString = `SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'student' AND table_schema = '${db.name}'`;
//   //var queryData = await sequelize.query(queryString, {
//     type: sequelize.QueryTypes.SELECT,
//   });
//   var Id = queryData[0].AUTO_INCREMENT.toString();
//   var idPrefix = `${STUDENT_ID_PREFIX}${Id.padStart(8, "0")}`;

//   return student.create({
//     ...userBody,
//     studentId: idPrefix,
//     createdBy: 0,
//   })
//     .then((data) => data)
//     .catch((err) => {
//       throw new ApiError(httpStatus.BAD_REQUEST, err);
//     });
// };
const studentCreateServices = async (studentBody) => {
 
  return student.create(studentBody);
}
const getAllstudentServices = async (query) => {
  const studentData = await student.findAndCountAll({
    query,
  });
  return studentData;
};

const getSinglestudentServices = async (studentId) => {
  const getData = await student.findOne({
    where: { id: studentId},

  });
  return getData;
};
// const updatestudentServices = async (id,updateBody) => {
//   const studentData = await getSinglestudentServices(id);
//   if (!studentData)
//     throw new ApiError(httpStatus.NOT_FOUND, "student is not found");
//   Object.assign(studentData, updateBody);
//   await studentData.save();
//   return studentData;
// };
/**
 * @description Update student by id
 * @param {ObjectId} studentId
 * @param {Object} updateBody
 * @returns {Promise<User>}
 */
const updatestudentServices = async (studentId, updateBody) => {
  const studentData = await getSinglestudentServices(studentId);
  if (!studentData)
    throw new ApiError(httpStatus.NOT_FOUND, "student is not found");
  Object.assign(studentData, updateBody);
  await studentData.save();
  return studentData;
};
/**
 * @description Delete student by id
 * @param {ObjectId} studentId
 * @returns {Promise<User>}
 */
const deletestudentServices = async (studentId) => {
  const studentDetails = await student.findByPk(studentId);
  if (studentDetails) {
    studentDetails.isDeleted = 1;
    Object.assign(studentDetails);
  }
  await studentDetails.save();
  return studentDetails;
};

module.exports = {
  studentCreateServices,
  getAllstudentServices,
  getSinglestudentServices,
  updatestudentServices,
  deletestudentServices
  };