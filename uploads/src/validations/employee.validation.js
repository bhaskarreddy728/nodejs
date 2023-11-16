const Joi = require("joi");

const createEmployee = {
  body: Joi.object().keys({
    employeeName: Joi.string().required(),
    employeeEmail: Joi.string().required(),
    employeePhonenumber: Joi.number().integer().required(),
    employeeSummary: Joi.string().required(),
    employeeStatus: Joi.boolean(),
  }),
};

const getEmployee = {
  params: Joi.object().keys({
    employeeId: Joi.number().integer(),
  }),
};

const updateEmployee = {
  params: Joi.object().keys({
    employeeId: Joi.number().integer(),
  }),
  body: Joi.object().keys({
    employeeName: Joi.string(),
    employeeEmail: Joi.string(),
    employeePhonenumber: Joi.number().integer(),
    employeeSummary: Joi.string(),
    employeeStatus: Joi.boolean(),
    employeeId: Joi.string(),
  }),
};

const deleteEmployee = {
  params: Joi.object().keys({
    employeeId: Joi.number().integer(),
  }),
};
module.exports = {
  createEmployee,
  getEmployee,
  updateEmployee,
  deleteEmployee,
};
