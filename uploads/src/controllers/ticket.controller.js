const httpStatus = require("http-status");
const pick = require("../utils/pick");
const ApiError = require("../utils/ApiError");
const catchAsync = require("../utils/catchAsync");
const util = require("../utils");
const { Ticket } = require("../models");
const { ticketServices, peopleServices } = require("../services");
//** create Tickets */
const TicketCreate = catchAsync(async (req, res) => {
  const ticket = await ticketServices.TicketCreateServices(req.body);
  res.send({ ticket });
});

/**
 * @description Get all tickets
 */
const getAllTickets = catchAsync(async (req, res) => {
  const page = util.parser.tryParseInt(req.query.page, 0);
  const limit = util.parser.tryParseInt(req.query.limit, 0);
  //   const searchQuery = util.stringify(req.query.ticketCategory);
  const query = {
    // searchQuery,
    limit,
    order: [["id", "ASC"]],
  };
  const tickets = await ticketServices.getAllTicketServices(query);
  res.send(util.response.paging(tickets, page, limit));
});
/**
 * @description Get One ticket
 */
const getSingleTicket = catchAsync(async (req, res) => {
  const ticketData = await ticketServices.getSingleTicketServices(
    req.params.ticketId
  );
  res.send({ ticket: ticketData });
});
/**
 * @description Search functionallity for people Designation
 */
const getSearchDesignation = catchAsync(async (req, res) => {
  const filterDesignation = await ticketServices.getPeopleShotsServices(req);
  res.send({ people: filterDesignation });
});

/**
 * @description date range
 */

const getDateRange = catchAsync(async (req, res) => {
  const dateRange = await ticketServices.getTicketsDateRange(req);
  res.send({ people: dateRange });
});

// getTicketsDateRange
/**
 * @description Search functionallity
 */
const getSearchTickets = catchAsync(async (req, res) => {
  const ticketData = await ticketServices.getSearchTicketServices(req);
  res.send({ ticket: ticketData });
});

/**
 * @description update ticket
 */
const updateTicket = catchAsync(async (req, res) => {
  const ticket = await ticketServices.updateTicketServices(
    req.params.ticketId,
    req.body
  );
  res.send({ ticket });
});

const deleteTicket = catchAsync(async (req, res) => {
  await ticketServices.deleteTicketServices(req.params.ticketId);
  res.status(httpStatus.NO_CONTENT).send();
});

/**
 * @description update ticket
 */

module.exports = {
  TicketCreate,
  getAllTickets,
  getSearchDesignation,
  getSingleTicket,
  getSearchTickets,
  updateTicket,
  deleteTicket,
  getDateRange,
};
