const dotenv = require('dotenv');
const path = require('path');
const Joi = require('joi');

// const CON:any; 
dotenv.config({ path: path.join(__dirname, '../../.env') });

const envVarsSchema = Joi.object()
  .keys({
    NODE_ENV: Joi.string().valid('production', 'development', 'test').required(),
    PORT: Joi.number().default(8082),
    WEB_APP_URL: Joi.string().required().description('Front end URL'),
    DB_NAME: Joi.string().required().description('MySQL database user name'),
    DB_USERNAME: Joi.string().required().description('MySQL database user name'),
    DB_PASSWORD: Joi.any().description('MySQL database password'),
    DB_PORT: Joi.number().default(3306),
    DB_HOST: Joi.string().description('db host'),
    DB_DIALECT: Joi.string().default('mysql'),
    JWT_SECRET: Joi.string().required().description('JWT secret key'),
    JWT_ACCESS_EXPIRATION_MINUTES: Joi.number().default(30).description('minutes after which access tokens expire'),
    JWT_REFRESH_EXPIRATION_DAYS: Joi.number().default(1).description('days after which refresh tokens expire'),
    JWT_RESET_PASSWORD_EXPIRATION_MINUTES: Joi.number()
      .default(10)
      .description('minutes after which reset password token expires'),
    JWT_VERIFY_EMAIL_EXPIRATION_MINUTES: Joi.number()
      .default(10)
      .description('minutes after which verify email token expires'),
    SMTP_HOST: Joi.string().description('server that will send the emails'),
    SMTP_PORT: Joi.number().description('port to connect to the email server'),
    SMTP_USERNAME: Joi.string().description('username for email server'),
    SMTP_PASSWORD: Joi.string().description('password for email server'),
    EMAIL_FROM: Joi.string().description('the from field in the emails sent by the app'),
  })
  .unknown();

const { value: envVars, error } = envVarsSchema.prefs({ errors: { label: 'key' } }).validate(process.env);

if (error) {
  throw new Error(`Config validation error: ${error.message}`);
}

module.exports = {
  env: envVars.NODE_ENV,
  port: envVars.PORT,
  uiURL: envVars.WEB_APP_URL,
  db: {
    name: envVars.DB_NAME,
    username: envVars.DB_USERNAME,
    password: envVars.DB_PASSWORD,
    host: envVars.DB_HOST,
    port: envVars.DB_PORT,
    dialect: envVars.DB_DIALECT
  },
  jwt: {
    secret: envVars.JWT_SECRET,
    accessExpirationMinutes: envVars.JWT_ACCESS_EXPIRATION_MINUTES,
    refreshExpirationDays: envVars.JWT_REFRESH_EXPIRATION_DAYS,
    resetPasswordExpirationMinutes: envVars.JWT_RESET_PASSWORD_EXPIRATION_MINUTES,
    verifyEmailExpirationMinutes: envVars.JWT_VERIFY_EMAIL_EXPIRATION_MINUTES,
  },
  // CON: {},
  email: {
    smtp: {
      services: 'Godaddy',
      host: envVars.SMTP_HOST,
      port: envVars.SMTP_PORT,
      secureConnection: true, // TLS requires secureConnection to be false
      // tls: {
      //   ciphers: 'SSLv3'
      // },
      auth: {
        user: envVars.SMTP_USERNAME, // generated ethereal user
        pass: envVars.SMTP_PASSWORD, // generated ethereal password
      },
    },
    from: envVars.EMAIL_FROM,
  },
};
