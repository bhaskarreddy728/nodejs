const httpStatus = require("http-status");
const moment = require("moment");
const { Ticket, sequelize, People } = require("../models");
const ApiError = require("../utils/ApiError");
const { TICKET_ID_PREFIX } = require("../constants/constantFuctions");
const { db } = require("../config/config");

/**
 * @description Create a new Ticket
 * @param {Object} userBody
 * @returns {Promise<User>} Object
 */
const TicketCreateServices = async (userBody) => {
  var queryString = `SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'tickets' AND table_schema = '${db.name}'`;
  var queryData = await sequelize.query(queryString, {
    type: sequelize.QueryTypes.SELECT,
  });
  var Id = queryData[0].AUTO_INCREMENT.toString();
  var idPrefix = `${TICKET_ID_PREFIX}${Id.padStart(8, "0")}`;

  return Ticket.create({
    ...userBody,
    ticketId: idPrefix,
    createdBy: 0,
  })
    .then((data) => data)
    .catch((err) => {
      throw new ApiError(httpStatus.BAD_REQUEST, err);
    });
};

/**
 * @description Get all ticket details
 * @param {empty}
 * @returns {Promise<Ticket>} ArrayOfObject
 */
const getAllTicketServices = async (query) => {
  const ticketData = await Ticket.findAndCountAll({
    query,
    where: { isDeleted: 0 },
  });
  return ticketData;
};

/**
 * @description Ticket get by id
 * @param {ObjectId} ticketId
 * @returns  Object
 */
const getSingleTicketServices = async (ticketId) => {
  const getData = await Ticket.findOne({
    where: { id: ticketId, isDeleted: 0 },
  });
  return getData;
};

// /**
//  * @description search the query to filter in all people details functionality
//  * @param {Array<Query>} searchQuery
//  * @returns {Promise<People>} Array
//  */
const getPeopleShotsServices = async (req) => {
  var searchText = req.query.searchText;
  // var limit = (req.query.limit != undefined) ? req.query.limit : 10;
  var orderBy =
    req.query.orderBy != undefined ? req.query.orderBy : "  name ASC";
  var queryString =
    "SELECT   p.id,  p.name,   ed.id AS ed_id,   ed.currentDesignation AS ed_currentDesignation,   ed.currentCompany AS ed_currentCompany,  ed.currentTools AS ed_currentTools,  ed.currentSkills AS ed_currentSkills FROM   people AS p  LEFT OUTER JOIN employee_details AS ed ON p.employeeDetailsId = ed.id  WHERE p.id > 0";

  if (searchText != "") {
    queryString +=
      " AND ( p.name LIKE '%" +
      searchText +
      "%'  OR  ed.currentDesignation LIKE '%" +
      searchText +
      "%')";
  }
  queryString += " ORDER BY " + orderBy;
  return sequelize.query(queryString, { type: sequelize.QueryTypes.SELECT });
};

// * @description : date-range
const getTicketsDateRange = async (req) => {
  var startDate = req.query.startDate;
  var endDate = req.query.endDate;
  var StateDateRange = moment(startDate).local().format("YYYY-MM-DD");
  var EndDateRange = moment(endDate).local().format("YYYY-MM-DD");
  var filterData = [];
  var getData = await Ticket.findAll({
    where: { isDeleted: 0 },
  });
  if (startDate != "" && endDate != "") {
    filterData = getData.filter((item) => {
      let dateValue =
        item.dataValues["dateOfCreate"] || item["dateOfCreate"] || {};
      let date = moment(dateValue).local().format("YYYY-MM-DD");
      if (
        date.toString() >= StateDateRange &&
        date.toString() <= EndDateRange
      ) {
        return item;
      }
    });
    return filterData;
  }
};

/**
 * @description search the query to filter in all ticket details functionality
 * @param {Array<Query>} searchQuery
 * @returns {Promise<People>} Array
 */
const getSearchTicketServices = async (req) => {
  var searchText = req.query.searchText;
  var orderBy =
    req.query.orderBy != undefined ? req.query.orderBy : "  name ASC";
  var queryString =
    "SELECT   t.id,   t.ticketId,   t.ticketCategory,   t.ticketPriority,   t.companyDetail,   t.ticketDescription,   t.ticketIssueImage,   t.ticketIssueDoc,   t.peopleId,   t.ticketStatus  FROM   tickets AS t   LEFT OUTER JOIN  people AS p  ON  t.peopleId = p.id   WHERE t.id > 0";

  if (searchText != "") {
    queryString +=
      " AND ( t.ticketStatus LIKE '%" +
      searchText +
      "%'  OR  t.ticketCategory LIKE '%" +
      searchText +
      "%'  OR  t.ticketPriority LIKE '%" +
      searchText +
      "%'  OR  t.ticketId LIKE '%" +
      searchText +
      "%'  OR  p.name LIKE '%" +
      searchText +
      "%')";
  }
  queryString += " ORDER BY " + orderBy;
  return sequelize.query(queryString, { type: sequelize.QueryTypes.SELECT });
};

/**
 * @description Update ticket by id
 * @param {ObjectId} ticketId
 * @param {Object} updateBody
 * @returns {Promise<User>}
 */
const updateTicketServices = async (ticketId, updateBody) => {
  const ticketData = await getSingleTicketServices(ticketId);
  if (!ticketData)
    throw new ApiError(httpStatus.NOT_FOUND, "ticket is not found");
  Object.assign(ticketData, updateBody);
  await ticketData.save();
  return ticketData;
};

/**
 * @description Delete ticket by id
 * @param {ObjectId} ticketId
 * @returns {Promise<User>}
 */
const deleteTicketServices = async (ticketId) => {
  const ticketDetails = await Ticket.findByPk(ticketId);
  if (ticketDetails) {
    ticketDetails.isDeleted = 1;
    Object.assign(ticketDetails);
  }
  await ticketDetails.save();
  return ticketDetails;
};

module.exports = {
  TicketCreateServices,
  getAllTicketServices,
  getPeopleShotsServices,
  getSingleTicketServices,
  getSearchTicketServices,
  updateTicketServices,
  deleteTicketServices,
  getTicketsDateRange,
};