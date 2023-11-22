const express = require("express");
const studentController = require("../../controllers/student.controller");
const validate = require("../../middlewares/validate");
const router = express.Router();
const studentValidation = require("../../validations/student.validation");


router
  .route("/")
  .post( validate(studentValidation.createstudent), studentController.studentCreate)
   .get(studentController.getAllstudent)
   //.patch(validate(studentValidation.updatestudent), studentController.updatestudent)
   router
   .route("/:id")
   .get(validate(studentValidation.getstudent), studentController.getSinglestudent)
   .patch(validate(studentValidation.updatestudent), studentController.updatestudent)
  // router
  // .route("/")
  // .get(studentController.getAllstudent)
 module.exports = router;
