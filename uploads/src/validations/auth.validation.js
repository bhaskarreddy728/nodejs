const Joi = require('joi');
const { password } = require('./custom.validation');

const register = {
  body: Joi.object().keys({
    email: Joi.string().required().email(),
    password: Joi.string().required().custom(password),
    name: Joi.string().required(),
  }),
};

const login = {
  body: Joi.object().keys({
    email: Joi.string().required(),
    password: Joi.string().required(),
  }),
};

const logOut = {
  body: Joi.object().keys({
    refreshToken: Joi.string().required(),
  }),
}

const refreshTokens = {
  body: Joi.object().keys({
    refreshToken: Joi.string().required(),
    pauseInstanceWhileRefreshing: Joi.boolean()
  }),
};

const forgotPassword = {
  body: Joi.object().keys({
    email: Joi.string().email().required(),
    mobileDevice: Joi.string().allow('', null),
  }),
};

const resetPassword = {
  query: Joi.object().keys({
    token: Joi.string().required(),
  }),
  body: Joi.object().keys({
    password: Joi.string().required().custom(password),
  }),
};

const verifyEmail = {
  query: Joi.object().keys({
    token: Joi.string().required(),
  }),
};
module.exports = {
  register,
  login,
  logOut,
  refreshTokens,
  forgotPassword,
  resetPassword,
  verifyEmail
};
