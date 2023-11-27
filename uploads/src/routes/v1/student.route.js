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
   .route("/:studentId")
   .get(validate(studentValidation.getstudent), studentController.getSinglestudent)
   .patch(validate(studentValidation.updatestudent), studentController.updatestudent)
   .delete(validate(studentValidation.deletestudent), studentController.deletestudent)

  // router
  // .route("/")
  // .get(studentController.getAllstudent)
 module.exports = router;
