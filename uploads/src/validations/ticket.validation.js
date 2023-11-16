const Joi = require("joi");

const createTicket = {
  body: Joi.object().keys({
    issueTitle: Joi.string().required(),
    ticketCategory: Joi.string().required(),
    ticketPriority: Joi.string().required(),
    companyDetail: Joi.string().required(),
    dateOfCreate: Joi.string(),
    ticketDescription: Joi.string().required(),
    ticketIssueImage: Joi.string().required(),
    ticketIssueDoc: Joi.string().required(),
    ticketIssueImageName: Joi.string().required(),
    ticketIssueDocName: Joi.string().required(),
    ticketStatus: Joi.string().required(),
    peopleId: Joi.string().required(),
  }),
};

const getTicket = {
  params: Joi.object().keys({
    ticketId: Joi.number().integer(),
  }),
};

const updateTicket = {
  params: Joi.object().keys({
    ticketId: Joi.number().integer(),
  }),
  body: Joi.object().keys({
    issueTitle: Joi.string(),
    ticketCategory: Joi.string(),
    ticketPriority: Joi.string(),
    companyDetail: Joi.string(),
    dateOfCreate: Joi.string(),
    ticketDescription: Joi.string(),
    ticketIssueImage: Joi.string(),
    ticketIssueDoc: Joi.string(),
    ticketIssueImageName: Joi.string().required(),
    ticketIssueDocName: Joi.string().required(),
    ticketStatus: Joi.string(),
    peopleId: Joi.string().required(),
  }),
};

const deleteTicket = {
  params: Joi.object().keys({
    ticketId: Joi.number().integer(),
  }),
};
module.exports = {
  createTicket,
  getTicket,
  updateTicket,
  deleteTicket,
};
