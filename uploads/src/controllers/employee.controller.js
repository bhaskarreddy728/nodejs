const httpStatus = require("http-status")
const catchAsync = require("../utils/catchAsync")
const utils = require("../utils")
const {employeeservices} = require("../services")

const EmployeeCreate= catchAsync(async (req, res) => {
    const employee= await employeeservices.EmployeeCreateServices(req.body);
    res.send({ employee});
  });
  
  const getAllEmployee = catchAsync(async (req, res) => {
    const page = util.parser.tryParseInt(req.query.page, 0);
    const limit = util.parser.tryParseInt(req.query.limit, 0);
    //   const searchQuery = util.stringify(req.query.ticketCategory);
    const query = {
      // searchQuery,
      limit,
      order: [["id", "ASC"]],
    };
    const employee = await employeeServices.getAllTicketServices(query);
    res.send(util.response.paging(employee, page, limit));
  });
  const getSingleEmployee = catchAsync(async (req, res) => {
    const EmployeeData = await employeeServices.getSingleEmployeeServices(
      req.params.employeeId
    );
    res.send({ ticket: EmployeeData });
  });
  const updateEmployee = catchAsync(async (req, res) => {
    const Employee = await employeeServices.updateEmployeeServices(
      req.params.employeeId,
      req.body
    );
    res.send({ Employee });
  });
  const deleteEmployee = catchAsync(async (req, res) => {
    await employeeServices.deleteEmployeeServices(req.params.employeeId);
    res.status(httpStatus.NO_CONTENT).send();
  });
module.exports = {
    EmployeeCreate,
    getAllEmployee,
    getSingleEmployee,
    updateEmployee,
    deleteEmployee
}