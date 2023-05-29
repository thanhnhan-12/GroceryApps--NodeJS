import { catchAsync } from '../utils/catchAsync';
import adminService from '../services/admin.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const adminController = {
  getAllUser: catchAsync(async function (req, res, next) {
    const userList = await adminService.getAllUser();

    return res.status(httpStatus.OK).send(userList);
  }),
};

export default adminController;
