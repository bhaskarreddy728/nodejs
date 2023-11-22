const httpStatus = require("http-status");
const pick = require("../utils/pick");
const ApiError = require("../utils/ApiError");
const catchAsync = require("../utils/catchAsync");
const util = require("../utils");
const { student } = require("../models");
const { studentServices, peopleServices } = require("../services");
//** create Tickets */
const studentCreate = catchAsync(async (req, res) => {
  const student = await studentServices.studentCreateServices(req.body);
  res.send({ student });
});
const getAllstudent = catchAsync(async (req, res) => {
  const page = util.parser.tryParseInt(req.query.page, 0);
  const limit = util.parser.tryParseInt(req.query.limit, 0);
  const query = {
    limit,
    order: [["id", "ASC"]],
  };
  const student = await studentServices.getAllstudentServices(query);
  res.send(util.response.paging(student, page, limit));
});
const getSinglestudent = catchAsync(async (req, res) => {
  const studentData = await studentServices.getSinglestudentServices(
    req.params.id
  );
  res.send({ student: studentData });
});
const updatestudent = catchAsync(async (req, res) => {
  const student = await studentServices.updatestudentServices(
    req.params.id,
    req.body
  );
  res.send({ student });
});
module.exports = {
  studentCreate,
  getAllstudent,
  updatestudent,
  getSinglestudent,
 };
