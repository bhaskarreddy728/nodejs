const httpStatus = require('http-status');
const catchAsync = require('../utils/catchAsync');
const{ userServices, tokenServices, authServices, emailServices } = require("../services/index");

/**
 * Create a register 
 */
 const register = catchAsync(async (req, res) => {
  const userData = await userServices.userRegisterServices(req.body);
  const token = await tokenServices.generateAuthToken(userData);
  res.status(httpStatus.CREATED).send({ user: userData, token })
});

/**
 * user Login functions 
 */
 const login = catchAsync(async (req, res) => {
  const { email, password } = req.body;
  const user = await authServices.userLoginServices(email, password);
  const token = await tokenServices.generateAuthToken(user);
  res.send({ user, token })
});

/**
 * user LogOut functions 
 */
const logOut = catchAsync(async (req, res) => {
  await authServices.logoutServices(req.body.refreshToken)
  res.status(httpStatus.NO_CONTENT).send();
})

//** refresh tokens */
const refreshTokens = catchAsync(async(req, res) => {
  const tokens = await authServices.refreshAuthServices(req.body.refreshToken);
  res.send({ ...tokens })
})

//** forget password */
const forgetPassword = catchAsync(async (req, res) => {
  await authServices.forgetPasswordServices(req.body);
  res.status(httpStatus.NO_CONTENT).send();
});

//** reset password */
const resetPassword = catchAsync(async(req, res) => {
  await authServices.resetPasswordServices(req.query.token, req.body.password);
  res.status(httpStatus.NO_CONTENT).send();
})

//** send email verification */
const sendEmailVerification = catchAsync(async (req, res) => {
  const verifyEmailToken = await tokenServices.generateVerifyEmailToken(req.user);
  await emailServices.sendVerificationEmail(verifyEmailToken, req.user)
  res.status(httpStatus.NO_CONTENT).send();
})

//** send verify Email */
const verifyEmail = catchAsync(async(req, res) => {
  await authServices.verifyEmailServices(req.query.token);
  res.status(httpStatus.NO_CONTENT).send();
})
module.exports = {
  register,
  login,
  logOut,
  refreshTokens,
  forgetPassword,
  resetPassword,
  sendEmailVerification,
  verifyEmail
}