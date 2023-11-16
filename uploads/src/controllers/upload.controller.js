const httpStatus = require('http-status');
const multer = require('multer');
const ApiError = require('../utils/ApiError');
const catchAsync = require('../utils/catchAsync');
const { profiles } = require('../config/multer');
const fs = require('fs');
const path = require('path');

const profileUpload = catchAsync(async (req, res) => {
    profiles(req, res, function (err) {
        if (err instanceof multer.MulterError) {
            throw new ApiError(httpStatus.INTERNAL_SERVER_ERROR, multer.MulterError);
        } else if (err) {
            throw new ApiError(httpStatus.INTERNAL_SERVER_ERROR, err);
        }
        res.status(httpStatus.CREATED).send(req.file || req.files);
      })
});

const removeFile = async (file) => {
    // console.log("removeFile", file);
    // const Path = __dirname+'../../../uploads';
    const filePath = path.join(__dirname+'../../../uploads', file);

    if(file !== null){
        const response = await fs.unlink(filePath, ((res) => (res)))
        return response
    }
    return null
}
const profileUploadCancel = catchAsync(async (req, res) => {
    await removeFile(req.query.profile);
    return res.status(200).send({ code: 200, message: "file deleted successfully"})
})

module.exports = {
    profileUpload,
    profileUploadCancel
}