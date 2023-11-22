const httpStatus = require("http-status");
const pick = require("../utils/pick");
const ApiError = require("../utils/ApiError");
const catchAsync = require("../utils/catchAsync");
const util = require("../utils");
const { student } = require("../models");
const { studentCreateServices, peopleServices } = require("../services");
//** create Tickets */
const studentCreate = catchAsync(async (req, res) => {
  const student = await studentCreateServices.studentCreateServices(req.body);
  res.send({ student });
});
const getAllstudent = catchAsync(async (req, res) => {
  const page = util.parser.tryParseInt(req.query.page, 0);
  const limit = util.parser.tryParseInt(req.query.limit, 0);
  const query = {
    limit,
    order: [["id", "ASC"]],
  };
  const student = await studentCreateServices.getAllstudentServices(query);
  res.send(util.response.paging(student, page, limit));
});
module.exports = {
  studentCreate,
  getAllstudent,
 };
