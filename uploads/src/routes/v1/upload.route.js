const express = require('express');
const auth = require('../../middlewares/auth');
const uploadController = require('../../controllers/upload.controller');

const router = express.Router();

router.route('/profile').post(auth('profileUpload'), uploadController.profileUpload)
router.route('/profileCancel').post(uploadController.profileUploadCancel)

module.exports = router;