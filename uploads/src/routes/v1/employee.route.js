const express = require("express");
const auth = require("../../middlewares/auth");
const employeeController = require("../../controllers/employee.controller");
const validate = require("../../middlewares/validate");
const router = express.Router();
const employeeValidation = require("../../validations/employee.validation");



router
  .route("/")
  .post(auth('manageUsers'), validate(employeeValidation.createEmployee), employeeController.EmployeeCreate)
  // .post(employeeController.EmployeeCreate)

  .get(auth("getUsers"), employeeController.getAllEmployee);

router
  .route("/:employeeId")
  .get(auth("getUsers"), validate(employeeValidation.getTicket), employeeController.getSingleEmployee)
  .patch(auth("manageUsers"), validate(employeeValidation.updateTicket), employeeController.updateEmployee)
  .delete(auth("manageUsers"), validate(employeeValidation.deleteTicket), employeeController.deleteEmployee)

module.exports = router;

