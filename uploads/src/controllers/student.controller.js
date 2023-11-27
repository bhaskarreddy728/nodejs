const httpStatus = require("http-status");
const pick = require("../utils/pick");
const ApiError = require("../utils/ApiError");
const catchAsync = require("../utils/catchAsync");
const util = require("../utils");
const { student } = require("../models");
const { studentservices, peopleServices } = require("../services");
//** create Tickets */
const studentCreate = catchAsync(async (req, res) => {
  const student = await studentservices.studentCreateServices(req.body);
  res.send({ student });
});
const getAllstudent = catchAsync(async (req, res) => {
  const page = util.parser.tryParseInt(req.query.page, 0);
  const limit = util.parser.tryParseInt(req.query.limit, 0);
  const query = {
    limit,
    order: [["id", "ASC"]],
  };
  const student = await studentservices.getAllstudentServices(query);
  res.send(util.response.paging(student, page, limit));
});
const getSinglestudent = catchAsync(async (req, res) => {
  const studentData = await studentservices.getSinglestudentServices(
    req.params.studentId
  );
  res.send({ student: studentData });
});

const updatestudent = catchAsync(async (req, res) => {
  const student = await studentservices.updatestudentServices(
    req.params.studentId,
    req.body
  );
  res.send({ student });
});
const deletestudent = catchAsync(async (req, res) => {
  await studentservices.deletestudentServices(req.params.studentId);
  res.status(httpStatus.NO_CONTENT).send();
});
module.exports = {
  studentCreate,
  getAllstudent,
  updatestudent,
  getSinglestudent,
  deletestudent,
 };
