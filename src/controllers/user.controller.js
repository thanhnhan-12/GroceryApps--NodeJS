import { catchAsync } from '../utils/catchAsync';
import userService from '../services/user.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const userController =  {
  getUserInfor: catchAsync (async function (req, res, next) {
    const userInfor = await userService.getUserInfor(req.params.userID); 

    return res.status(httpStatus.OK).send(userInfor);
  }),

  updateUserInforById: catchAsync (async function (req, res, next) {
    const userInforById = await userService.updateUserInforById(
      req.params.userID,
      req.body,
    ); 

    return res.status(httpStatus.OK).send(userInforById);
  }),
}

export default userController;