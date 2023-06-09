import { catchAsync } from '../utils/catchAsync';
import adminService from '../services/admin.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const adminController = {
  getAllUser: catchAsync(async function (req, res, next) {
    const userList = await adminService.getAllUser();

    return res.status(httpStatus.OK).send(userList);
  }),

  updateAccountById: catchAsync(async function (req, res, next) {
    const accountList = await adminService.updateAccountById(
      req.params.idAccount,
      req.body,
    );

    return res.status(httpStatus.OK).send(accountList);
  }),

  getStatistical: catchAsync(async function (req, res, next) {
    const statistical = await adminService.getStatistical() ;

    return res.status(httpStatus.OK).send(statistical );
  }),
};

export default adminController;
