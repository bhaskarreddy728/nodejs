const express = require("express");
const auth = require("../../middlewares/auth");
const studentController = require("../../controllers/student.controller");
const validate = require("../../middlewares/validate");
const router = express.Router();
const studentValidation = require("../../validations/student.validation");

router
  .route("/")
  .post( validate(studentValidation.createstudent), studentController.studentCreate)
  // .post(studentController.studentCreate)

 module.exports = router;
