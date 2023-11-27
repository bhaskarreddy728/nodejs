const Joi = require("joi");

const createstudent = {
  body: Joi.object().keys({
    studentId: Joi.number().integer(),
    studentName: Joi.string().required(),
    studentEmail: Joi.string().required(),
    studentPhonenumber: Joi.number().integer().required(),
    studentSummary: Joi.string().required(),
    studentStatus: Joi.string().required(),
  }),
};

const getstudent = {
  params: Joi.object().keys({
    studentId: Joi.number().integer(),
  }),
};
const updatestudent = {
  params: Joi.object().keys({
    studentId: Joi.number().integer(),
  }),
  body: Joi.object().keys({
    
    studentName: Joi.string(),
    studentEmail: Joi.string(),
    studentPhonenumber: Joi.number().integer(),
    studentSummary: Joi.string(),
    studentStatus: Joi.string(),
     }),
};
const deletestudent = {
  params: Joi.object().keys({
    studentId: Joi.number().integer(),
  }),
};
module.exports = {
  createstudent,
  getstudent,
  updatestudent,
  deletestudent
};
