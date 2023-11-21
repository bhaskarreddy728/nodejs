const express = require("express");
const studentController = require("../../controllers/student.controller");
const validate = require("../../middlewares/validate");
const router = express.Router();
const studentValidation = require("../../validations/student.validation");


router
  .route("/")
  .post( validate(studentValidation.createstudent), studentController.studentCreate)
   .get(studentController.getAllstudent);
  // router
  // .route("/")
  // .get(studentController.getAllstudent)
 module.exports = router;
