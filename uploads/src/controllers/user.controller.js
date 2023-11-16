const httpStatus = require('http-status');
const catchAsync = require('../utils/catchAsync');
const { userServices } = require('../services');
const util = require('../utils');

/**
 * Create a user 
 */
const userCreated = catchAsync(async (req, res) => {
  const userData = await userServices.userCreateServices(req.body);
  res.status(httpStatus.CREATED).send({ user: userData })
});

/**
 * getAll user Details 
 */
// const getAllUsers = catchAsync(async (req, res) => {
//   const user = await userServices.getAllUserServices()
//   res.send({ user })
// })

const getAllUsers = catchAsync(async (req, res) => {
  const page = util.parser.tryParseInt(req.query.page, 0);
  const limit = util.parser.tryParseInt(req.query.limit, 0);
  // const name = util.parser
  const query = {
      limit,
      order: [['id', 'ASC']],
  }
  const result = await userServices.getAllUserServices(query);
  res.send(util.response.paging(result, page, limit))
})
//** get by user Id */
const getUser = catchAsync(async (req, res) => {
  const user = await userServices.getUserById(req.params.userId);
  res.send(user)
})

//** Update the user details */
const updateUserDetail = catchAsync(async (req, res) => {
  const userData = await userServices.updateUserById(req.params.userId, req.body);
  res.send({ user: userData })
})

//** Delete user data */
const deleteUser = catchAsync(async (req, res) => {
  await userServices.deleteUserById(req.params.userId);
  res.status(httpStatus.NO_CONTENT).send()
})
module.exports = {
  userCreated,
  getAllUsers,
  getUser,
  updateUserDetail,
  deleteUser
};
