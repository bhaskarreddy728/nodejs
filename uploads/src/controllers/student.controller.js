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

module.exports = {
  studentCreate,
 };
