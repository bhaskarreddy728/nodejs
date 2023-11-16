const httpStatus = require("http-status");
const moment = require("moment");
const { Employee, sequelize, People } = require("../models");
const ApiError = require("../utils/ApiError");
const { db } = require("../config/config");


// const EmployeeCreateServices = async (userBody) => {
//   var queryString = `SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'employee' AND table_schema = '${db.name}'`;
//   var queryData = await sequelize.query(queryString, {
//     type: sequelize.QueryTypes.SELECT,
//   });
//   var Id = queryData[0].AUTO_INCREMENT.toString();

//   var idPrefix = `${COMPLAINT_ID_PREFIX}${Id.padStart(8, "0")}`;

//   return Employee.create({
//     ...userBody,
//     id: idPrefix,
//     createdBy: 0,
//   })
//     .then((data) => data)
//     .catch((err) => {
//       throw new ApiError(httpStatus.BAD_REQUEST, err);
//     });  
// };

const EmployeeCreateServices = async (employeeBody) => {
 
  return Employee.create(employeeBody);
}

const getAllEmployeeServices = async (query) => {
  const Data = await Employee.findAndCountAll({
    query,
    where: { isDeleted: 0 },
  });
  return EmployeeData;Employee
};
const getSingleEmployeeServices = async (id) => {
  const getData = await Employee.findOne({
    where: { id: id, isDeleted: 0 },
  });
  return getData;
};
const updateEmployeeServices = async (id, updateBody) => {
  const EmployeeData = await getSingleEmployeeServices(id);
  if (!EmployeeData)
    throw new ApiError(httpStatus.NOT_FOUND, "Employee is not found");
  Object.assign(EmployeeData, updateBody);
  await EmployeeData.save();
  return EmployeeData;
};
const deleteEmployeeServices = async (id) => {
  const EmployeeDetails = await Ticket.findByPk(id);
  if (EmployeeDetails) {
    EmployeeDetails.isDeleted = 1;
    Object.assign(EmployeeDetails);
  }
  await EmployeeDetails.save();
  return EmployeeDetails;
};
module.exports = {
    EmployeeCreateServices,
    getAllEmployeeServices,
    getSingleEmployeeServices,
    updateEmployeeServices,
    deleteEmployeeServices
}