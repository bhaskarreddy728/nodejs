const express = require("express");
const authRoute = require("./auth.route");
const userRoute = require("./user.route");

// const docsRoute = require("./docs.route");
const uploadRoute = require("./upload.route");
const config = require("../../config/config");
// const actionRoute = require("./action.route");
const ticketRoute = require("./ticket.route");
// const contactRouter = require("./contact.route");
const employee = require("./employee.route");
const student = require("./student.route");
const router = express.Router();


const defaultRoutes = [
  
{
  path: "/employee",
  route: employee,
},
  {
    path: "/auth",
    route: authRoute,
  },
  {
    path: "/users",
    route: userRoute,
  },
  
  {
    path: "/upload",
    route: uploadRoute,
  },
 
  {
    path: "/ticket",
    route: ticketRoute,
  },
  
  {
    path: "/student",
    route: student,
  },
  
];


const devRoutes = [
  // {
  //   path: "/docs",
  //   route: docsRoute,
  // },
];

defaultRoutes.forEach((route) => {
  router.use(route.path, route.route);
});

/* istanbul ignore next */
if (config.env === "development") {
  devRoutes.forEach((route) => {
    router.use(route.path, route.route);
  });
}

module.exports = router;
