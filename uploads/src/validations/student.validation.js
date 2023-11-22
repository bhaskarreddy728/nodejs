const Joi = require("joi");

const createstudent = {
  body: Joi.object().keys({
    studentName: Joi.string().required(),
    studentEmail: Joi.string().required(),
    studentPhonenumber: Joi.number().integer().required(),
    studentSummary: Joi.string().required(),
    studentStatus: Joi.string(),
  }),
};

const getstudent = {
  params: Joi.object().keys({
    studentId: Joi.number().integer(),
  }),
};

module.exports = {
  createstudent,
  getstudent,
};
